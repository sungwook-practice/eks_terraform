resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eks.id

  tags = {
    Name = "${var.cluster_name}-public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  for_each = aws_subnet.public

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.eks.id

#   tags = {
#     Name = "${var.cluster_name}-private"
#   }
# }

# resource "aws_route" "private" {
#   route_table_id         = aws_route_table.private.id
#   destination_cidr_block = var.vpc_cidr
# }

# resource "aws_route_table_association" "private" {
#   for_each = aws_subnet.private

#   subnet_id      = aws_subnet.private[each.key].id
#   route_table_id = aws_route_table.private.id
# }
