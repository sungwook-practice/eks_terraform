module "vpc" {
  source = "./vpc"

  cluster_name = var.cluster_name
}

module "eks" {
  source = "./eks"

  cluster_version    = "1.22"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.vpc_public_subnet_ids
  private_subnet_ids = module.vpc.vpc_private_subnet_ids

}
