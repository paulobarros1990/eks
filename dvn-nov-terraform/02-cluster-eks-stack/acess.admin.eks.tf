#######################################################
# Acesso ADMIN ao EKS
# Usuário: tcb-automation-admin
# Cluster: workshop-nov-eks-cluster
#######################################################

resource "aws_eks_access_entry" "tcb_admin" {
  cluster_name  = "workshop-nov-eks-cluster"
  principal_arn = "arn:aws:iam::649795374786:user/tcb-automation-admin"
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "tcb_admin_policy" {
  cluster_name  = "workshop-nov-eks-cluster"
  principal_arn = aws_eks_access_entry.tcb_admin.principal_arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  access_scope {
    type = "cluster"
  }
}

