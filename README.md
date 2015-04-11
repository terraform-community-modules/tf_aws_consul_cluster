# tf_aws_consul_cluster

An *experimental* module to run a consul cluster for you

# Inputs

  * region - AWS region. E.g. eu-central-1
  * instance_type - AWS instance type. E.g. t2.small
  * count - The number of consul instances. This should be 3 or 5!
  * subnet_ids - A comma seperated list of subnet IDs to place the machines into
  * admin_key_name - And SSH key name
  * security-group - The security group for the instances

# Outputs

  * private_ips - A comma seperated list of private IPs belonging to the cluster members
  * ids - A comma seperated list of the terraform instance IDs belonging to the cluster members

# LICENSE

Apache 2 - See the included LICENSE file for more details.

