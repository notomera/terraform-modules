variable "cluster_name" {
    description = "The name to use for all of the cluster resrouces"
    type = string
}

variable "db_remote_state_bucket" {
    description = "the name of the s3 bucket for the database's remote state"
    type = string
}

variable "db_remote_state_key" {
    description = "the path for the database's remote state in S3"
    type = string
}

variable "instance_type" {
    description = "the type of ec2 isntance to run (e.g. t2.micro)"
    type = string
}

variable "min_size" {
    description = "the minimum number of ec2 instance is the ASG"
    type = number
}

variable "max_size" {
    description = "the maximum number of ec2 instances in the ASG"
    type = number
}

variable "env" {
    description = "this is the working env"
    type = string
  
}