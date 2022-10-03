resource "ncloud_launch_configuration" "lc" {
  name = "my-lc"
  server_image_product_code = "SW.VSVR.OS.LNX64.CNTOS.0703.B050"
  server_product_code = "SVR.VSVR.HICPU.C002.M004.NET.SSD.B050.G002"
  is_encrypted_volume = true
}