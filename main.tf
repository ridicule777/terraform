#################################################
# ---------------- root/main.tf --------------- #
#################################################
provider "aws" {
  profile = "default"
  region  = "${var.aws_region}"
}

# Configuring Backend for out terraform state files which was created in the pre-requsites-directory.
terraform {
  backend "s3" {
    bucket         = "tf-state-store-mj"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}


# Deploy Storage Resource. All s3 Buckets and EBS Volumes come under the storage directory.
module "storage" {
  source       = "./storage"
  project_name = "${var.project_name}"
}


# # Deploy Networking Resources
# module "networking" {
#   source       = "./networking"
#   vpc_cidr     = "${var.vpc_cidr}"
#   public_cidrs = "${var.public_cidrs}"
#   accessip     = "${var.accessip}"
# }
#
# # Deploy Compute Resources
#
# module "compute" {
#   source          = "./compute"
#   instance_count  = "${var.instance_count}"
#   key_name        = "${var.key_name}"
#   public_key_path = "${var.public_key_path}"
#   instance_type   = "${var.server_instance_type}"
#   subnets         = "${module.networking.public_subnets}"
#   security_group  = "${module.networking.public_sg}"
#   subnet_ips      = "${module.networking.subnet_ips}"
# }
