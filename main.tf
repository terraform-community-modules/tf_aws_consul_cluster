module "ami" {
  source = "github.com/terraform-community-modules/tf_aws_ubuntu_ami/ebs"
  region = "${var.region}"
  distribution = "trusty"
  instance_type = "${var.instance_type}"
}

resource "aws_instance" "consul" {
    associate_public_ip_address = false
    count = "${var.count}"
    instance_type = "${var.instance_type}"
    subnet_id = "${element(split(\",\", var.subnet_ids), count.index)}"
    ami = "${module.ami.ami_id}"
    security_groups = [ "${var.security_group}" ]
    key_name = "${var.admin_key_name}"
    # FIXME - disk size here!
    tags {
      Name = "consul-${count.index+1}"
      role = "consul"
    }
    user_data = "${replace(file(\"${path.module}/consul.conf\"), \"__CONSUL_CLUSTER_SIZE__\", \"${var.count}\")}"
}
