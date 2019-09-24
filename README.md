# Terraform code for personal learning.

This repository is created for personal use.
Infrastructure consists of :

* S3 bucket
* VPC
  * IGW
  * 3 PUBLIC SUBNETS
  * 3 NAT GATEWAYS
  * ELASTIC IP's for all 3 NAT GATEWAYS
  * 3 PRIVATE SUBNETS
  * CORRESPONDING ROUTE TABLES

The pre-requsites folders conists of terraform code to create a s3 bucket and a DynamoDB table which would be used as a centralized state store repostiry  as described in this [blog post](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa).

# INFRA DIAGRAM HERE:




Here is a list of important documents which I have followed: (Bookmarking it here)
1) [Authenticating to AWS using credewntials file](https://blog.gruntwork.io/authenticating-to-aws-with-the-credentials-file-d16c0fbcbf9e)
2) [Terraform Locking State in S3](https://medium.com/@jessgreb01/how-to-terraform-locking-state-in-s3-2dc9a5665cb6)
3) [State Management with Terraform](https://medium.com/@mitesh_shamra/state-management-with-terraform-9f13497e54cf)
4) [How to Manage Terraform State](https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa)
5) [Centeralized State File and State Lock](https://blog.powerupcloud.com/terraform-centralize-statefile-and-state-lock-part-ii-e6d8fce9850c)