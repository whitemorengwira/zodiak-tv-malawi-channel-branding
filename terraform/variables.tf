variable "aws_region" {
  description = "Target AWS region for media infrastructure"
  type        = string
  default     = "af-south-1" # Cape Town primary, or us-east-1
}

variable "environment" {
  description = "Target deployment environment"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Production project identifier"
  type        = string
  default     = "zodiak-tv-malawi-channel-branding"
}
