module "three-tier-vpc" {
  source = "./module/three-tier-vpc"
  vpc_cidr          = "10.100.0.0/16"
  subnet_names      = ["public-subnet-1", "public-subnet-2", "app-subnet-1", "app-subnet-2", "db-subnet-1", "db-subnet-2"]
  availability_zones = ["ap-south-1a", "ap-south-1b"]
}
