resource "aws_organizations_organizational_unit" "security_ou" {
  name      = "Security"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "workloads_ou" {
  name      = "Workloads"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "shared_ou" {
  name      = "SharedServices"
  parent_id = aws_organizations_organization.org.roots[0].id
}