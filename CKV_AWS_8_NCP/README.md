# NCP_LaunchconfigurationEncryption

## Decription

- AWS_ID : CKV_AWS_8
- AWS_Entity : AWS::AutoScaling::LaunchConfiguration
- Policy : Ensure all data stored in the Launch configuration EBS is securely encrypted
    
    ncloud인 경우 VPC환경에서만 Launch Configuration시, Storage 암호화를 할 수 있음
    
- Resource : [VPC] ncloud_launch_configuration
    - Argument : is_encrypted_volume(Server_image가 RHV인 경우 true인지 확인하면됨)
- Terraform Code : main_pass.tf, main_fail.tf, main_fail_2.tf, main_fail_3.tf
- Link : https://registry.terraform.io/providers/NaverCloudPlatform/ncloud/latest/docs/resources/launch_configuration