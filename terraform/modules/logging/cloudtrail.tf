resource "aws_cloudtrail" "org_trail" {
  name                          = "org-wide-trail"
  s3_bucket_name                = aws_s3_bucket.log_archive.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
  enable_log_file_validation    = true
}