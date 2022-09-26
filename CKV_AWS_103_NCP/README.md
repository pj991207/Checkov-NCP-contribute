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
## Custom Rule : NCP

```python
from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck

class NCP_ALBListenerTLS12(BaseResourceCheck):

    def __init__(self):
        name = "Ensure that Load Balancer Listener is using at least TLS v1.2"
        id = "NCP_ALBListenerTLS12"
        supported_resources = ['ncloud_lb_listener']
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        # Check SslPolicy only if protocol is HTTPS (ALB) or TLS (NLB).
        # Other protocols are not interesting within the context of this check.
        if 'protocol' in conf.keys():
            protocol = conf['protocol'][0]
            if protocol in ('HTTPS', 'TLS'):
                if 'tls_min_version_type' in conf.keys():
                    if conf['tls_min_version_type'][0] == 'TLSV12':
                        return CheckResult.PASSED
                return CheckResult.FAILED
            elif protocol in ('TCP', 'UDP', 'TCP_UDP'):
                return CheckResult.PASSED

check = NCP_ALBListenerTLS12()
```

## Example.tf

**passed**

```python
resource "ncloud_lb_listener" "listener" {
    load_balancer_no = ncloud_lb.lb.id
    protocol = "HTTPS"
    tls_min_version_type = "TLSV12"
    port = 80
    target_group_no = ncloud_lb_target_group.tg.id
}
```

**Failed**

```python
resource "ncloud_lb_listener" "listener" {
    load_balancer_no = ncloud_lb.lb.id
    protocol = "HTTP"
    port = 80
    target_group_no = ncloud_lb_target_group.tg.id
}
```

```python
resource "ncloud_lb_listener" "listener" {
    load_balancer_no = ncloud_lb.lb.id
    protocol = "HTTPS"
    port = 80
    target_group_no = ncloud_lb_target_group.tg.id
}
```

```python
resource "ncloud_lb_listener" "listener" {
    load_balancer_no = ncloud_lb.lb.id
    protocol = "TLS"
    tls_min_version_type = "TLSV10"
    port = 80
    target_group_no = ncloud_lb_target_group.tg.id
}
```