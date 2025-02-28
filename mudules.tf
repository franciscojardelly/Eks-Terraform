module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/clustereks"
  project_name     = var.project_name
  tags             = local.tags
  public-subnet-1a = module.eks_network.fjfs-subnet-pub-1a
  public-subnet-1b = module.eks_network.fjfs-subnet-pub-1b
}