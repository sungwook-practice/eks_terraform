resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-cluster"
  role_arn = aws_iam_role.EKSClusterRole.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids          = flatten([var.private_subnet_ids, var.public_subnet_ids])
    security_group_ids  = flatten([for sec in var.security_groups : aws_security_group.sec_groups[sec.name].id])
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}
