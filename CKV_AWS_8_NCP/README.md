# NCP_LaunchconfigurationEncryption

## Decription

- AWS_ID : CKV_AWS_8
- AWS_Entity : AWS::AutoScaling::LaunchConfiguration
- Policy : Ensure all data stored in the Launch configuration EBS is securely encrypted
    
    서버에 암호화를 할 수 있는가, ncloud인 경우 RHV만 암호화가 가능
    
- Resource : [VPC] ncloud_launch_configuration
    - Argument : is_encrypted_volume(centos인 경우 True인지 확인하면됨)
- Terraform Code : main_pass.tf, main_fail.tf, main_fail_2.tf, main_fail_3.tf
## Custom Rule : NCP

```python
from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck

class NCP_LaunchConfigurationEncryption(BaseResourceCheck):
    def __init__(self):
        name = "you can set whether to encrypt basic block storage if server image is RHV. Default false."
        id = "NCP_LaunchConfigurationEncryption"
        supported_resources = ['ncloud_launch_configuration']
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        RHV = [["SPSW0LINUX000046"],["SPSW0LINUX000045"],["SPSW0LINUX000044"],["SPSW0LINUX000043"],["SPSW0LINUX000032"],["SPSW0LINUX000031"],
               ["SPSW0LINUX000050"],["SPSW0LINUX000049"],["SPSW0LINUX000048"],["SPSW0LINUX000047"],["SPSW0LINUX000060"],["SPSW0LINUX000056"],
               ["SPSW0LINUX000062"],["SPSW0LINUX000061"],["SPSW0LINUX000074"],["SPSW0LINUX000046"],["SPSW0LINUX000069"],["SPSW0LINUX000070"],
               ["SPSW0LINUX000076"],["SPSW0LINUX000078"],["SPSW0LINUX000066"],["SPSW0LINUX000068"],["SPSW0LINUX000072"]]
        if 'server_image_product_code' in conf.keys():
            server_image_product_code = conf['server_image_product_code']
            if server_image_product_code in RHV:
                if 'is_encrypted_volume' in conf.keys():
                    is_encrypted_volume = conf['is_encrypted_volume']
                    if is_encrypted_volume == [True]:
                        return CheckResult.PASSED
                    else:
                        return CheckResult.FAILED
                else:
                    return CheckResult.FAILED
            else:
                return CheckResult.FAILED#skipped 인지 failed 인지 고민.

check = NCP_LaunchConfigurationEncryption()
```

## Example.tf

**passed**

```python
resource "ncloud_launch_configuration" "lc" {
  name = "my-lc"
  server_image_product_code = "SPSW0LINUX000045"
  server_product_code = "SPSVRSSD00000003"
  is_encrypted_volume = true
}
```

**Failed**

```python
resource "ncloud_launch_configuration" "lc" {
  name = "my-lc"
  server_image_product_code = "SPSW0LINUX000001"
  server_product_code = "SPSVRSSD00000003"
}
```

```python
resource "ncloud_launch_configuration" "lc" {
  name = "my-lc"
  server_image_product_code = "SPSW0LINUX000045"
  server_product_code = "SPSVRSSD00000003"
  is_encrypted_volume = false
}
```

```python
resource "ncloud_launch_configuration" "lc" {
  name = "my-lc"
  server_image_product_code = "SPSW0LINUX000045"
  server_product_code = "SPSVRSSD00000003"
}
```