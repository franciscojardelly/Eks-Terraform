output "eks-vpc-config" {
  value = aws_eks_cluster.fjfs-eks-cluster.vpc_config
}

#output "oidc" {
#  value = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
#}

output "eks-cluster-name" {
  value = aws_eks_cluster.fjfs-eks-cluster.id
}

output "oidc" {
  value = aws_eks_cluster.fjfs-eks-cluster.identity.0.oidc.0.issuer
}

output "certificate_authority" {
  value = aws_eks_cluster.fjfs-eks-cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.fjfs-eks-cluster.endpoint
}

