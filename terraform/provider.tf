// Configure the matchbox provider
provider "matchbox" {
  endpoint    = "${var.matchbox_rpc_endpoint}"
  client_cert = "${file("/terraform/certs/client.crt")}"
  client_key  = "${file("/terraform/certs/client.key")}"
  ca          = "${file("/terraform/certs/ca.crt")}"
}
