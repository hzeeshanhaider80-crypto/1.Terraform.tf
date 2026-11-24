variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefixes for all the resources"
  type        = string
  default     = "haider-terraform"

}

variable "owner" {
  description = "Owner of the resources"
  type        = string

}

variable "vpc_cidr" {
  description = "IP range of the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "IP range of the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "Ec2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "my_ip" {
  description = "My Ip address to allow ssh access"
  type        = string
  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "The provided IP must be in CIDR format, e.g., 192.168.1.0/24"

  }
}
variable "public_key_path" {
  description = "path of your public ssh key"
  type        = string
  default     = "~/.ssh/tf_key.pub"

}







