

// Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.three-tier-vpc.id
}

// Output the IDs of public subnets
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.subnets : subnet.id if subnet.tags["Name"] == "public"]
}

// Output the IDs of private subnets
output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.subnets : subnet.id if subnet.tags["Name"] != "public"]
}

// Output the ID of the Internet Gateway
output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

// Output the Public IP of the NAT Gateway
output "nat_ip" {
  description = "The Public IP of the NAT Gateway"
  value       = aws_nat_gateway.nat.public_ip
}
