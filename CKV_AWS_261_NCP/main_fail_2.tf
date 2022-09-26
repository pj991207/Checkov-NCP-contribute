resource "ncloud_lb_target_group" "test" {
  vpc_no   = ncloud_vpc.test.vpc_no
  protocol = "TLS"
  target_type = "VSVR"
  port        = 8080
  description = "for test"
  health_check {
    protocol = "TLS"
    port           = 8080
    cycle          = 30
    up_threshold   = 2
    down_threshold = 2
  }
  algorithm_type = "RR"
}