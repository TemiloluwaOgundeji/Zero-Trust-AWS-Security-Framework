resource "aws_organizations_organization" "org" {
  aws_service_access_principals = [
    "sso.amazonaws.com",
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com"
  ]

  feature_set = "ALL"

  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY",
    "TAG_POLICY"
  ]
}

resource "aws_organizations_policy" "log_protection" {
  name    = "LogProtection"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.root}/scp/log-protection.json")
}

resource "aws_organizations_policy" "mfa_enforcement" {
  name    = "MFAEnforcement"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.root}/scp/mfa-enforcement.json")
}

resource "aws_organizations_policy" "root_restrictions" {
  name    = "RootRestrictions"
  type    = "SERVICE_CONTROL_POLICY"
  content = file("${path.root}/scp/root-restrictions.json")
}

resource "aws_organizations_policy_attachment" "attach_log" {
  policy_id = aws_organizations_policy.log_protection.id
  target_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy_attachment" "attach_mfa" {
  policy_id = aws_organizations_policy.mfa_enforcement.id
  target_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy_attachment" "attach_root" {
  policy_id = aws_organizations_policy.root_restrictions.id
  target_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_policy" "tag_policy" {
  name    = "TagPolicy"
  type    = "TAG_POLICY"
  content = file("${path.root}/scp/tagging-policy.json")
}

resource "aws_organizations_policy_attachment" "attach_tag_policy" {
  policy_id = aws_organizations_policy.tag_policy.id
  target_id = aws_organizations_organization.org.roots[0].id
}