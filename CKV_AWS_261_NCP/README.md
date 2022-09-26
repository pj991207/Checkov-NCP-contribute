# NCP_LaunchconfigurationEncryption

## Decription

- AWS_ID : CKV_AWS_216
- AWS_Entity : aws_lb_target_group,aws_alb_target_group
- Policy : Ensure HTTP HTTPS Target group defines Healthcheck
    
    Target group이 HTTP/HTTPS를 사용하는 경우, Healthcheck를 정의해야 합니다.(Application loadbalancer)
    
- Resource : [VPC] ncloud_lb_target_group
    - Argument : protocol -> http/https, health_check->url_path 존재
- Terraform Code : main_pass.tf, main_fail.tf, main_fail_2.tf, main_fail_3.tf
