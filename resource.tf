resource "aws_instance" "webserver" {
    ami           =  "ami-0b752bf1df193a6c4"
    instance_type =  "t2.micro"
    user_data = file("./scripts/install_httpd.sh")

    vpc_security_group_ids = [aws_security_group.webserver_sg.id]
    tags = {
      Name = "Webserver"
      ENV = "Dev"
    }
}

resource "aws_security_group" "webserver_sg" {
  name        = "webserver SG"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "Webserver Port"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "SSH Port"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "webserver SG"
  }
}
