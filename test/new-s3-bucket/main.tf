provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AWS S3 BUCKET TO USE AS BACKEND WITH VERSIONING AND ENCRYPTION ENABLED
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_s3_bucket" "backend" {
  # CHANGE TO NAME OF YOUR OWN BUCKET
  bucket = "terraform-backend-00bcd6c1cc"
  # enable versioning so we can see the full revision history of our state files
  versioning {
    enabled = true
  }
  # enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}