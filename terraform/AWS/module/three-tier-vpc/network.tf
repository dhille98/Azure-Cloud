


# create a Igw
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.three-tier-vpc.id

  tags = {
    Name = "app-igw"
  }
}

/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {

  depends_on = [aws_internet_gateway.igw]
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets[0].id
  depends_on    = [aws_internet_gateway.igw]
  tags = {
    Name = "nat"

  }
}
# cretate aws rote table with public
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}
# cretate aws rote table with pvt

resource "aws_route_table" "pvt-rt" {
  vpc_id = aws_vpc.three-tier-vpc.id
  

  tags = {
    Name = "pvt-rt"
  }
}

resource "aws_route" "pvt-table" {
  route_table_id = aws_route_table.pvt-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.nat.id
}
# public subnet associate with public route 
resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.subnets[0].id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-1b" {
  subnet_id      = aws_subnet.subnets[1].id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-igw" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.public-rt.id
}

# private subnet associate with pvt route
resource "aws_route_table_association" "pvt-1a" {
  subnet_id      = aws_subnet.subnets[2].id
  route_table_id = aws_route_table.pvt-rt.id
}
resource "aws_route_table_association" "pvt-1b" {
  subnet_id      = aws_subnet.subnets[3].id
  route_table_id = aws_route_table.pvt-rt.id
}

resource "aws_route_table_association" "pvt-1c" {
  subnet_id      = aws_subnet.subnets[4].id
  route_table_id = aws_route_table.pvt-rt.id
}

resource "aws_route_table_association" "pvt-1d" {
  subnet_id      = aws_subnet.subnets[5].id
  route_table_id = aws_route_table.pvt-rt.id
}


