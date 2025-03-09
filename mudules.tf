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

module "managed_node_group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.eks-cluster-name
  tags              = local.tags
  subnet_private_1a = module.eks_network.fjfs-subnet-priv-1a
  subnet_private_1b = module.eks_network.fjfs-subnet-priv-1b
}

module "eks_aws_lb_controller" {
  source       = "./modules/aws-lb-controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.eks-cluster-name
}