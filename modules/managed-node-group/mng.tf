resource "aws_eks_node_group" "fjfs-eks-mng" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.fjfs-eks-mng-role.arn
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b

  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.fjfs-eks-mng-role-attachement_worker,
    aws_iam_role_policy_attachment.fjfs-eks-mng-role-attachement_cni,
    aws_iam_role_policy_attachment.fjfs-eks-mng-role-attachement_ecr,
  ]
}