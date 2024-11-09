region       = "ap-south-1"
vpc_cidr     = "10.100.0.0/16"
subnet_names = ["public-subnet-1", "public-subnet-2", "app-subnet-1", "app-subnet-2", "db-subnet-1", "db-subnet-2"]
ingress_ports = [ "22", "80", "4000", "3366" ]
