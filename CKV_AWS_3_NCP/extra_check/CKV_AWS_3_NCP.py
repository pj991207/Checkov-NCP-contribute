
from checkov.common.models.enums import CheckResult, CheckCategories
from checkov.terraform.checks.resource.base_resource_check import BaseResourceCheck


class NCP_LaunchConfigurationEBSEncryption(BaseResourceCheck):
    def __init__(self):
        name = "Ensure that EC2 is EBS optimized"
        id = "CKV_AWS_8_NCP"
        supported_resources = ['ncloud_block_storage']
        categories = [CheckCategories.GENERAL_SECURITY]
        super().__init__(name=name, id=id, categories=categories, supported_resources=supported_resources)

    def scan_resource_conf(self, conf):
        print(conf)
        if 'inbound' in conf.keys():
            inbound_block = conf['inbound'][0]
            ip_block = inbound_block['ip_block']
            if ip_block in [["0.0.0.0/0"]]:
                return CheckResult.FAILED
        return CheckResult.PASSED

check = NCP_LaunchConfigurationEBSEncryption()