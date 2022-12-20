resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "${var.cluster_name}"
  }
}

resource "aws_eip" "nat" {
  vpc = true

  lifecycle {
    # prevent_destroy = true
  }

  tags = {
    Name = "${var.cluster_name}"
  }
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

  tags = {
    Name        = "${var.cluster_name}-ngw"
  }
}
