variable "username" {}
variable "password" {}
variable "eb_solution_stack" {}

variable "instance_type" {}
#vpc module variable
variable "vpc_cidr_block" {}
variable "project_name" {}
variable "az_count" {}


#CICD-Module

variable "region" {}
variable "source_bucket" {}
variable "source_object_key" {} #update
variable "s3_location" {}