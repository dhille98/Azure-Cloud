variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"

}
variable "subnet_count" {
  type    = number
  default = 6

}
variable "availability_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]

}

variable "subnet_names" {
  type    = list(string)
  default = ["public-subnet-1", "public-subnet-2", "app-subnet-1", "app-subnet-2", "db-subnet-1", "db-subnet-2"]

}

