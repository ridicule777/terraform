# INFRA DIAGRAM




This repository is created to soley learn terraform which would be used with KOPS. 
Infrastructure consists of 
* S3 bucket
* VPC
  * IGW
  * 3 PUBLIC SUBNETS
  * 3 NAT GATEWAYS
  * ELASTIC IP's for all 3 NAT GATEWAYS
  * 3 PRIVATE SUBNETS
  * CORRESPONDING ROUTE TABLES

Later whenever required it would be upgraded.
