variable "ec2_emi" {
  default = "ami-0e35ddab05955cf57"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_count" {
  default = 2
}

variable "ec2_foreach" {
  default = {
    "dev_Server" = {
      "instance_type" = "t2.micro"
    }
    "qa_server" = {
      "instance_type" = "t2.small"
    }
  }
}