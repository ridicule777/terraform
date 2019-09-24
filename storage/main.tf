####################################################
# ---------------- storage/main.tf --------------- #
####################################################

# Creating a bucket to use with kops as kops state store.

resource "aws_s3_bucket" "kops_store" {
  bucket = "${var.project_name}-kops-store"
  versioning {
    enabled = true
  }
  force_destroy = true
  tags = {
    Name = "kops-state-store"
  }
}
