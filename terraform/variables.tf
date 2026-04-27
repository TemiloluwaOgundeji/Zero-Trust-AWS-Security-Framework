variable "aws_region" {
  description = "Primary AWS region"
  type        = string
  default     = "us-east-1"
}

variable "org_email" {
  description = "Master account email"
  type        = string
}

variable "dev_email" {
  description = "Dev account email"
  type        = string
  default     = "dev@gmail.com"
}

variable "prod_email" {
  description = "Prod account email"
  type        = string
  default     = "prod@gmail.com"
}

variable "security_email" {
  description = "Security account email"
  type        = string
  default     = "security@gmail.com"
}

variable "finance_email" {
  description = "Finance account email"
  type        = string
  default     = "finance@gmail.com"
}

variable "shared_email" {
  description = "Shared services account email"
  type        = string
  default     = "shared@gmail.com"
}

variable "log_bucket_name" {
  description = "Name of the org-wide CloudTrail S3 bucket"
  type        = string
  default     = "org-log-archive-bucket"
}

variable "cloudtrail_name" {
  description = "Name of the org-wide CloudTrail trail"
  type        = string
  default     = "org-wide-trail"
}