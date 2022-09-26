# NCP_LaunchconfigurationEncryption

## Decription

- AWS_ID : CKV_AWS_8
- AWS_Entity : AWS::AutoScaling::LaunchConfiguration
- Policy : Ensure all data stored in the Launch configuration EBS is securely encrypted
    
    서버에 암호화를 할 수 있는가, ncloud인 경우 RHV만 암호화가 가능
    
- Resource : [VPC] ncloud_launch_configuration
    - Argument : is_encrypted_volume(centos인 경우 True인지 확인하면됨)
- Terraform Code : main_pass.tf, main_fail.tf, main_fail_2.tf, main_fail_3.tf
