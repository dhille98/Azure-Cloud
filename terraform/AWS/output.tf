output "vpc_id" {
  value = module.three-tier-vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.three-tier-vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.three-tier-vpc.private_subnet_ids
}

output "igw_id" {
  value = module.three-tier-vpc.igw_id
}

output "nat_ip" {
  value = module.three-tier-vpc.nat_ip
}
