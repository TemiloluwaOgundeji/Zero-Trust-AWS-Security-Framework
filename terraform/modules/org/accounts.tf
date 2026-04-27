resource "aws_organizations_account" "dev_account" {
  name      = "DevAccount"
  email     = "dev@gmail.com"
  parent_id = aws_organizations_organizational_unit.workloads_ou.id
}

resource "aws_organizations_account" "prod_account" {
  name      = "ProdAccount"
  email     = "prod@gmail.com"
  parent_id = aws_organizations_organizational_unit.workloads_ou.id
}

resource "aws_organizations_account" "security_account" {
  name      = "SecurityAccount"
  email     = "security@gmail.com"
  parent_id = aws_organizations_organizational_unit.security_ou.id
}

resource "aws_organizations_account" "finance_account" {
  name      = "FinanceAccount"
  email     = "finance@gmail.com"
  parent_id = aws_organizations_organizational_unit.shared_ou.id
}

resource "aws_organizations_account" "shared_services_account" {
  name      = "SharedServicesAccount"
  email     = "shared@gmail.com"
  parent_id = aws_organizations_organizational_unit.shared_ou.id
}