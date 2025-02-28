data "tls_certificate" "eks_oidc_tls_certificate" {
  url = aws_eks_cluster.fjfs-eks-cluster.identity[0].oidc[0].issuer
}


resource "aws_iam_openid_connect_provider" "fjfs-eks-oidc" {
  url = data.tls_certificate.eks_oidc_tls_certificate.url

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = data.tls_certificate.eks_oidc_tls_certificate.certificates[*].sha1_fingerprint
  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-oidc"
    }
  )

}