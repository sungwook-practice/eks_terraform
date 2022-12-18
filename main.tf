module "vpc" {
  source = "./vpc"

  cluster_name = var.cluster_name
}

# module "eks" {
#   source = "terraform-aws-modules/eks/aws"

#   cluster_name                    = var.cluster_name
#   cluster_version                 = "1.21"
#   cluster_endpoint_private_access = true
#   cluster_endpoint_public_access  = true

#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   cloudwatch_log_group_retention_in_days = 1

# }
