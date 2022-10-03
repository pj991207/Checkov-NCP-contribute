# NCP_LB_Listener_TLS12

## Description

- AWS_ID : CKV_AWS_103
- AWS_Entity : AWS::ElasticLoadBalancingV2::Listener
- Policy : Ensure ELB Policy uses only secure protocols
    
    Load Balancer Listener가 최소 TLS v1.2를 사용하는가?
    HTTPS,TLS인 경우 tls_min_version_type이 TLSV12인지 확인
    TCP,UDP,TCP_UDP인 경우 제외
    
- Resource : [VPC] ncloud_lb_listener
    - Argument : tls_min_version_type ← 얘가 TLSV12이어야 함.
- Terraform Code : main_pass.tf, main_fail.tf, main_fail_2.tf, main_fail_3.tf
- Link : https://registry.terraform.io/providers/NaverCloudPlatform/ncloud/2.2.4/docs/data-sources/lb_listener
