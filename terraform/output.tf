output "clients" {
  value = "${matchbox_profile.coreos-slave.count}"
}

output "keys" {
  value = "${data.consul_keys.app.var.enabled}"
}
