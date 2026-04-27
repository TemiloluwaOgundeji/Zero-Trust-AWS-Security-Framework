module "logging" {
  source          = "./modules/logging"
  log_bucket_name = var.log_bucket_name
  cloudtrail_name = var.cloudtrail_name
}

module "iam" {
  source = "./modules/iam"
}

module "org" {
  source         = "./modules/org"
  dev_email      = var.dev_email
  prod_email     = var.prod_email
  security_email = var.security_email
  finance_email  = var.finance_email
  shared_email   = var.shared_email
}