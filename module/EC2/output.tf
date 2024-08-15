output "instance_id" {
  value = aws_instance.imentorlly_ec2_dev_01.id
}

output "public_ip" {
  value = aws_instance.imentorlly_ec2_dev_01.public_ip
}
