variable "cluster_name" {
  type        = string
  description = "eks cluster name"
  default     = "eks-test"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.194.0.0/16"
}

variable "public_subnets" {
  type        = map(string)
  description = "public subnet"
  default = {
    "us-west-2a" : "10.194.0.0/24"
    "us-west-2c" : "10.194.1.0/24"
  }
}

variable "private_subnets" {
  type        = map(string)
  description = "prviate subnet"
  default = {
    "us-west-2a" : "10.194.100.0/24"
    "us-west-2c" : "10.194.101.0/24"
  }
}
