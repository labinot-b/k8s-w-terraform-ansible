resource "aws_instance" "master" {
  count         = var.master_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.tags["Project"]}-master-${count.index}" })
}

resource "aws_instance" "worker" {
  count         = var.worker_count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  tags = merge(var.tags, { Name = "${var.tags["Project"]}-worker-${count.index}" })
}
