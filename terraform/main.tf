# ==============================================================================
# AWS Infrastructure as Code (Terraform)
# Production Workflow & Cloud Storage Reference Implementation
# Project: ZODIAK TV (Channel Branding · Malawi National Terrestrial & Satellite)
# ------------------------------------------------------------------------------
# NOTE: This configuration serves as an architectural reference implementation
# demonstrating how I engineer media workflows on AWS with enterprise security,
# KMS encryption, IAM least privilege, and S3 lifecycle automation.
# ==============================================================================

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "ZODIAK TV"
      Network     = "Channel Branding · Malawi National Terrestrial & Satellite"
      Environment = var.environment
      ManagedBy   = "Terraform"
      Practice    = "N.White Systems — Cloud Architecture"
    }
  }
}

# 1. KMS Customer Managed Key for Media Encryption
resource "aws_kms_key" "media_key" {
  description             = "KMS Key for ZODIAK TV media asset encryption"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Name = "zodiak_tv_malawi_channel_branding-kms-key"
  }
}

# 2. S3 Media Vault Bucket
resource "aws_s3_bucket" "media_vault" {
  bucket        = "nwhite-zodiak-tv-malawi-channel-branding-${var.environment}"
  force_destroy = false
}

resource "aws_s3_bucket_versioning" "media_vault_versioning" {
  bucket = aws_s3_bucket.media_vault.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "media_vault_encryption" {
  bucket = aws_s3_bucket.media_vault.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.media_key.arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "media_vault_public_access" {
  bucket = aws_s3_bucket.media_vault.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# 3. Intelligent S3 Lifecycle Configuration
resource "aws_s3_bucket_lifecycle_configuration" "media_lifecycle" {
  bucket = aws_s3_bucket.media_vault.id

  rule {
    id     = "archive-raw-camera-media"
    status = "Enabled"

    filter {
      prefix = "raw/"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    transition {
      days          = 180
      storage_class = "DEEP_ARCHIVE"
    }
  }

  rule {
    id     = "proxies-retention"
    status = "Enabled"

    filter {
      prefix = "proxies/"
    }

    expiration {
      days = 120
    }
  }
}

# 4. IAM Role for Post-Production Team Members
resource "aws_iam_role" "post_production_role" {
  name = "zodiak_tv_malawi_channel_branding-post-production-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "post_production_policy" {
  name        = "zodiak_tv_malawi_channel_branding-post-production-policy"
  description = "Scoped S3 and KMS permissions for ZODIAK TV post-production workflow"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowS3MediaAccess"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.media_vault.arn,
          "${aws_s3_bucket.media_vault.arn}/*"
        ]
      },
      {
        Sid    = "AllowKMSEncryptionDecryption"
        Effect = "Allow"
        Action = [
          "kms:Decrypt",
          "kms:GenerateDataKey"
        ]
        Resource = aws_kms_key.media_key.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "post_prod_attach" {
  role       = aws_iam_role.post_production_role.name
  policy_arn = aws_iam_policy.post_production_policy.arn
}

# 5. CloudWatch Log Group for Workflow Observability
resource "aws_cloudwatch_log_group" "workflow_logs" {
  name              = "/aws/media-pipeline/zodiak_tv_malawi_channel_branding"
  retention_in_days = 90
}
