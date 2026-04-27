output "org_id" {
  description = "AWS Organization ID"
  value       = module.org.org_id
}

output "dev_account_id" {
  description = "Dev account ID"
  value       = module.org.dev_account_id
}

output "prod_account_id" {
  description = "Prod account ID"
  value       = module.org.prod_account_id
}

output "security_account_id" {
  description = "Security account ID"
  value       = module.org.security_account_id
}

output "finance_account_id" {
  description = "Finance account ID"
  value       = module.org.finance_account_id
}

output "log_bucket_arn" {
  description = "ARN of the CloudTrail log archive bucket"
  value       = module.logging.log_bucket_arn
}

output "cloudtrail_arn" {
  description = "ARN of the org-wide CloudTrail trail"
  value       = module.logging.cloudtrail_arn
}