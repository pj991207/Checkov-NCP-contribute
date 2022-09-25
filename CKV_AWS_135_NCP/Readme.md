# CheckOV_NCP_Rules
BoB11_Project
## AWS_Rule

- ID : CKV_AWS_213
- Entity : aws_load_balancer_policy
- Policy : Ensure ELB Policy uses only secure protocols
    
    loadbalancer는 안전한 프로토콜만을 사용하는가?
    
- Resource : [VPC] ncloud_lb_listener
    - Argument : tls_min_version_type ← 얘가 TLSV12이어야 함.

## Custom Rule : NCP

```python
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck
from checkov.common.models.enums import CheckResult, CheckCategories

class LBSecureProtocols(BaseResourceCheck):
    def __init__(self):
        name = "Ensure ELB Policy uses only secure protocols"
        id = "CKV_NCP_213"
        supported_resources = ['ncloud_lb_listener']

        categories = [CheckCategories.BACKUP_AND_RECOVERY]
        guideline = "You should Ensure ELB Policy uses only secure protocols"
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources, guideline=guideline)

    def scan_resource_conf(self, conf):
        if 'protocol' in conf.keys():
          protocol = conf['protocol'][0]
          if protocol == 'HTTPS' or protocol == 'TLS':
            if 'tls_min_version_type' in conf.keys():
              TLSVersion = conf['tls_min_version_type'][0]
              if TLSVersion == 'TLSV12': #TLS12 is vulnerable
                return CheckResult.PASSED
        return CheckResult.FAILED

scanner = LBSecureProtocols()
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
