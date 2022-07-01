# nat gw
resource "aws_eip" "nat" {
  vpc      = true
}
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = "${aws_eip.nat.id}"
  
  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id

  depends_on = [aws_internet_gateway.main-gw]
}

# VPC setup for NAT
resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.main.id}"
    
    tags = {
        Name = "main-private-1"
    }
}

# Private Route
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat-gw.id
}

# route associations private

resource "aws_route_table_association" "private" {
  for_each  = aws_subnet.private
  subnet_id = aws_subnet.private[each.key].id
 
  route_table_id = aws_route_table.private.id
}





