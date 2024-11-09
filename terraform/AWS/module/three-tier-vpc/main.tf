resource "aws_vpc" "three-tier-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "three-tier-vpc"
  }
}


resource "aws_subnet" "subnets" {
  count             = length(var.subnet_names)
  vpc_id            = aws_vpc.three-tier-vpc.id
  availability_zone = var.availability_zones[count.index % 2]
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.three-tier-vpc]


}

