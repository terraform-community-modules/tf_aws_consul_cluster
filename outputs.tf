output "private_ips" {
  value = "${join(\",\", aws_instance.consul.*.private_ip)}"
}
output "ids" {
    value = "${join(\",\", aws_instance.consul.*.id)}"
}

