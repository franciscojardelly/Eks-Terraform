resource "aws_iam_policy" "aws_lb_controller_policy" {
  name = "${var.project_name}-aws-lb-controller-policy"

  policy = file("${path.module}/iam_policy.json")
  tags   = var.tags
}