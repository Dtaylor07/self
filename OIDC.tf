data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  github_repositories = [
    "self",
    "dhavalrepo",
    "nikitarepo"
  ]

  oidc_sub_repositories = formatlist("repo:Dtaylor07:org/%s:environment:%s", local.github_repositories, upper(var.environment))

  additional_permission = var.environment == "PROD" ? formatlist("repo:Dtaylor07/%s:environment:%s", local.github_repositories, "RELEASE") : []
}

# create github oidc provider
resource "aws_iam_openid_connect_provider" "github_actions" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
  url             = "https://token.actions.githubusercontent.com"
}

# policy document defining who can assume the iam role
data "aws_iam_policy_document" "github_deployment_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = [
        format(
          "arn:aws:iam::%s:oidc-provider/token.actions.githubusercontent.com",
          local.account_id
        )
      ]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = concat(local.oidc_sub_repositories, local.additional_permission)
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

# iam role to assume
resource "aws_iam_role" "github_deployment_oidc_role" {
  name               = "github-oidc-role-new"
  assume_role_policy = data.aws_iam_policy_document.github_deployment_oidc_assume_role_policy.json
}

data "aws_iam_policy_document" "github_deployment_oidc_role_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "github_actions_role_policy" {
  name   = "github_deployment_oidc_role_policy_new"
  role   = aws_iam_role.github_deployment_oidc_role.id
  policy = data.aws_iam_policy_document.github_deployment_oidc_role_policy_document.json
}
