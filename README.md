# Checkov NCP
![image](https://github.com/pj991207/Checkov_ncp_contribute/assets/46809528/6b310073-8805-4232-a778-a3463b80bfd2)<br>
checkov 오픈소스에 Contribute한 내역 정리

# Contribute 내역

| Number | Description | about | Link |
| --- | --- | --- | --- |
| CKV_NCP_1 | Ensure HTTP HTTPS Target group defines Healthcheck | lb_target_group | [Link](https://github.com/bridgecrewio/checkov/pull/3624) |
| CKV_NCP_3 | Ensure no security group rules allow outbound traffic to 0.0.0.0/0 | lb_listener | [Link](https://github.com/bridgecrewio/checkov/pull/3624) |
| CKV_NCP_4 | Ensure no access control groups allow inbound from 0.0.0.0:0 to port 22 | ncloud_access_control_group_rule | [Link](https://github.com/bridgecrewio/checkov/pull/3627) |
| CKV_NCP_5 | Ensure no access control groups allow inbound from 0.0.0.0:0 to port 3389 | ncloud_access_control_group_rule | [Link](https://github.com/bridgecrewio/checkov/pull/3627) |
| CKV_NCP_13 | Ensure LB Listener uses only secure protocols | ncloud_lb_listener | [Link](https://github.com/bridgecrewio/checkov/pull/3782/files) |
| CKV_NCP_14 | Ensure NAS is securely encrypted | ncloud_nas_volume | [Link](https://github.com/bridgecrewio/checkov/pull/3796/files) |
| CKV_NCP_15 | Ensure Load Balancer Target Group is not using HTTP | ncloud_lb_target_group | [Link](https://github.com/bridgecrewio/checkov/pull/3797) |
| CKV_NCP_16 | Ensure Load Balancer isn't exposed to the internet | ncloud_lb | [Link](https://github.com/bridgecrewio/checkov/pull/3819) |
| CKV_NCP_17 | Ensure no hard coded NCP access key and secret key exists in provider | ncloud | [Link](https://github.com/bridgecrewio/checkov/pull/3820) |
| CKV_NCP_18 | Ensure that auto Scaling groups that are associated with a load balancer, are using Load Balancing health checks. | ncloud_auto_scaling_group | [Link](https://github.com/bridgecrewio/checkov/pull/3821) |
| CKV_NCP_19 | Ensure Naver Kubernetes Service public endpoint disabled | ncloud_nks_cluster | [Link](https://github.com/bridgecrewio/checkov/pull/3822) |
| CKV_NCP_20 | Ensure Routing Table associated with Web tier subnet have the default route (0.0.0.0/0) defined to allow connectivity | ncloud_route | [Link](https://github.com/bridgecrewio/checkov/pull/3854) |
| CKV_NCP_21 | Ensure NKS control plane logging enabled for all log types | ncloud_nks_cluster | [Link](https://github.com/bridgecrewio/checkov/pull/3855) |
| CKV_NCP_22 | Ensure a route table for the public subnets is created. | ncloud_route_table_association | [Link](https://github.com/bridgecrewio/checkov/pull/3856) |
| CKV_NCP_23 | Ensure Server instance should not have public IP. | ncloud_public_ip | [Link](https://github.com/bridgecrewio/checkov/pull/3857) |
| CKV_NCP_24 | Ensure Load Balancer Listener Using HTTPS. | ncloud_lb_listener | [Link](https://github.com/bridgecrewio/checkov/pull/3858) |
| CKV_NCP_25 | This rule suggests no access control groups allow inbound from 0.0.0.0 to port 80. | ncloud_access_control_group_rule | [Link](https://github.com/bridgecrewio/checkov/pull/3859) |
| CKV_NCP_26 | Ensure Access Control Group has Access Control Group Rule attached | ncloud_access_control_group | [Link](https://github.com/bridgecrewio/checkov/pull/3860) |
