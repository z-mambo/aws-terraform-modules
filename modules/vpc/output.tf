output "keenVpc-id" {
  value = aws_vpc.keenVpc.id
}

output "pubSn-id" {
  value = aws_subnet.pubSn.id
}

output "privSn-id" {
  value = aws_subnet.privSn.id
}