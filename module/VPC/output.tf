output "vpc_id" {
  value = aws_vpc.imentorlly_vpc_dev_01.id
}

output "public_subnet_id" {
  value = aws_subnet.imentorlly_public_subnet.id
}
