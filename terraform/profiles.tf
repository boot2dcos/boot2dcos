// Create a CoreOS-install profile
resource "matchbox_profile" "coreos-install" {
  name   = "coreos-install"
  kernel = "${var.matchbox_http_endpoint}/assets/coreos/1576.5.0/coreos_production_pxe.vmlinuz"

  initrd = [
    "${var.matchbox_http_endpoint}/assets/coreos/1576.5.0/coreos_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=coreos_production_pxe_image.cpio.gz",
    "coreos.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "coreos.first_boot=yes",
    "coreos.autologin=tty1",
    "console=tty0",
    "console=ttyS0",
  ]

  container_linux_config = "${file("./cl/coreos-install.yaml.tmpl")}"
}

// Create a simple profile which just sets an SSH authorized_key
resource "matchbox_profile" "simple" {
  name                   = "simple"
  container_linux_config = "${file("./cl/simple.yaml.tmpl")}"
}
