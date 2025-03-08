resource "aws_eks_cluster" "fjfs-eks-cluster" {
  name = var.project_name


  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  role_arn = aws_iam_role.fjfs-eks-cluster-role.arn
  version  = "1.32"

  ## Bloco para habilitar logs do kubernetes no cloudwatch.  
  #enabled_cluster_log_types = [
  #  "api",
  #  "audit",
  #  "authenticator",
  #  "controllerManager",
  #  "scheduler"
  #]

  vpc_config {
    subnet_ids = [
      var.public-subnet-1a,
      var.public-subnet-1b,
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  # Ensure that IAM Role permissions are created before and deleted
  # after EKS Cluster handling. Otherwise, EKS will not be able to
  # properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.fjfs-eks-role-attachement,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}"
    }
  )
}