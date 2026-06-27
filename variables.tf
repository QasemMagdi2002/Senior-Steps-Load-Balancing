variable "aws_region" {
  description = "AWS region where the existing VPC and public subnets are located."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix used for AWS resources."
  type        = string
  default     = "senior-steps-web"
}

variable "vpc_id" {
  description = "ID of the existing custom VPC."
  type        = string
}

variable "public_subnet_ids" {
  description = "At least two public subnet IDs in different Availability Zones."
  type        = list(string)

  validation {
    condition     = length(var.public_subnet_ids) >= 2
    error_message = "Provide at least two public subnet IDs."
  }
}

variable "instance_type" {
  description = "EC2 instance type for the web servers."
  type        = string
  default     = "t3.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Use t2.micro or t3.micro for this lab."
  }
}
