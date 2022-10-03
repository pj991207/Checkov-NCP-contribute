resource "ncloud_login_key" "loginkey" {
  key_name = "test-key"
}

resource "ncloud_vpc" "test" {
  ipv4_cidr_block = "10.0.0.0/16"
}

resource "ncloud_subnet" "test" {
  vpc_no         = ncloud_vpc.test.vpc_no
  subnet         = cidrsubnet(ncloud_vpc.test.ipv4_cidr_block, 8, 1)
  zone           = "KR-2"
  network_acl_no = ncloud_vpc.test.default_network_acl_no
  subnet_type    = "PUBLIC"
  usage_type     = "GEN"
}

resource "ncloud_server" "server" {
  subnet_no                 = ncloud_subnet.test.id
  name                      = "my-tf-server"
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0703.B050"
  server_product_code = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
  login_key_name            = ncloud_login_key.loginkey.key_name
  is_encrypted_base_block_storage_volume = true
}
