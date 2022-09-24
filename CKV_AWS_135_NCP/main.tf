resource "ncloud_block_storage" "storage" {
    server_instance_no = "812345"
    name = "tf-test-storage1"
    size = "10"
}