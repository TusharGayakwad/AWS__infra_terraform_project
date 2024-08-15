provider "aws" {
  region = "us-west-2" 
}

resource "aws_instance" "imentorlly_ec2_dev_01" {
  ami           = "ami-0a0b7b240264a48d7"  
  instance_type = "t2.micro"

 
  key_name = "imentorlly_key_dev_01"  


  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "imentorlly_ec2"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

dynamic "ingress" {
  for_each = [22,80,443,3306,27017]
  iterator = port
  content {
    description      = "TLS from VPC"
    from_port        = port.value
    to_port          = port.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
}
resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("~/.ssh/id_rsa.pub") 
}
