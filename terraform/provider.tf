// Configure the matchbox provider
provider "matchbox" {
  endpoint    = "${var.matchbox_rpc_endpoint}"
  client_cert = "${file("/terraform/certs/client.crt")}"
  client_key  = "${file("/terraform/certs/client.key")}"
  ca          = "${file("/terraform/certs/ca.crt")}"
}

provider "consul" {
  address    = "192.168.99.100:8500"
  datacenter = "baremetal"
}
