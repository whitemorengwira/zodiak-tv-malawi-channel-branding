output "s3_bucket_name" {
  description = "S3 Media Vault Bucket Name"
  value       = aws_s3_bucket.media_vault.id
}

output "s3_bucket_arn" {
  description = "S3 Media Vault Bucket ARN"
  value       = aws_s3_bucket.media_vault.arn
}

output "kms_key_arn" {
  description = "KMS Encryption Key ARN"
  value       = aws_kms_key.media_key.arn
}
