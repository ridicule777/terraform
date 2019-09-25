###########################################################
# ---------------- pre-requisites/main.tf --------------- #
###########################################################

#This file contains the terraform code to maintain a centralized state of the terraform and locking it with the dynamodb. This needs to be deployed first so that we could use the bucket and dynomodb in our root's main.tf as a backend. This is a replacement of terragrunt which was earlier used for state lock mechanism.



# Use the shared credentials file.
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


# Declare Variable for Pre-requisite Dynamo DB Table Name

variable "prerequisite_bucket_name" {
  default = "tf-state-store-mj"
  type    = "string"
}

# Create a bucket.
# SET ACL to Private.
# Enable Versioning.
# Enable Server Side Encryption.
# Set force destroy to true.
# Create Tags.

resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.prerequisite_bucket_name}"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  force_destroy = true
  tags = {
    Name = "${var.prerequisite_bucket_name}"
  }
}


# Declare Variable for Pre-requisite Dynamo DB Table Name
variable "prerequisite_dynamodb_name" {
  default = "terraform_state_lock"
  type    = "string"
}

# Create a dynamodb Table with the primary key called  LockID.

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.prerequisite_dynamodb_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
