resource "aws_security_group" "k8s" {
  name        = "${var.tags["Project"]}-k8s-sg"
  description = "Security group for Kubernetes nodes"
  vpc_id      = var.vpc_id
  tags        = merge(var.tags, { Name = "${var.tags["Project"]}-k8s-sg" })
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.allowed_ssh_cidr]
  security_group_id = aws_security_group.k8s.id
  description       = "Allow SSH"
}

resource "aws_security_group_rule" "kube_api" {
  type              = "ingress"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.k8s.id
  description       = "Allow kube-apiserver"
}

resource "aws_security_group_rule" "node_comm" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.k8s.id
  security_group_id        = aws_security_group.k8s.id
  description              = "Allow node-to-node communication"
}
