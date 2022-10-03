# NCP_LaunchconfigurationEncryption

## Decription

- AWS_ID : CKV_AWS_3
- AWS_Entity : AWS::EC2::Volume
- Policy : Ensure all data stored in the EBS is securely encrypted
    
    ncloud는 서버가 RHV이면 VPC환경에서만 기본 block storage를 암호화할 수 있음
    
- Resource : [VPC] ncloud_server
    - Argument : is_encrypted_base_block_storage_volume(Server_image가 RHV인 경우 true인지 확인하면됨)
- Terraform Code : main_pass.tf, main_fail.tf
- Link : https://registry.terraform.io/providers/NaverCloudPlatform/ncloud/latest/docs/resources/server
