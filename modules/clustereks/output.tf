output "eks-vpc-config" {
  value = aws_eks_cluster.fjfs-eks-cluster.vpc_config
}

output "oidc" {
  value = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
}