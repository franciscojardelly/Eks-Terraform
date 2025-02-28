output "subnet-pub-1a" {
  value = module.eks_network.fjfs-subnet-pub-1a
}

output "subnet-pub-1b" {
  value = module.eks_network.fjfs-subnet-pub-1b
}

output "subnet-priv-1a" {
  value = module.eks_network.fjfs-subnet-priv-1a
}

output "subnet-priv-1b" {
  value = module.eks_network.fjfs-subnet-priv-1b
}

output "eks-vpc-config" {
  value = module.eks_cluster.eks-vpc-config
}

output "oidc" {
  value = module.eks_cluster.oidc
}