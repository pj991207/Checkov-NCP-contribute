resource "ncloud_lb_listener" "listener" {
    load_balancer_no = ncloud_lb.lb.id
    protocol = "HTTPS"
    tls_min_version_type = "TLSV12"
    port = 80
    target_group_no = ncloud_lb_target_group.tg.id
}