resource "helm_release" "eks_helm_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.11.0"

  set = [
    {
      name  = "clusterName"
      value = var.cluster_name
    },
    {
      name  = "serviceaccount.create"
      value = "false"
    },
    {
      name  = "serviceaccount.name"
      value = "aws-load-balancer-controller"
    },
  ]
}