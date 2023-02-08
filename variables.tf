variable "region" {
  default = "ap-south-1"
  type    = string
}

variable "image_id" {
  default = "ami-01a4f99c4ac11b03c"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "server_ports" {
  type    = list
  default = [22,80,8080]
}

variable "destination_cidr" {
  default = "0.0.0.0/0"
}

variable "custom_tags" {
  type = map(any)
  default = {
    Name = "Webserver"
    ENV  = "Dev"
  }
}
