## Usage Instructions

### Schematics Workspace

1. Go to **Schematics** in cloud portal
2. Select Workspaces
3. Select your workspace
4. Select **Generate plan** to review plan
5. Select **View log** to review the plan execution log
6. Select **Apply plan** to provision plan
7. Select **View log** to review the apply execution log
9. Optionally review /var/log/cloud-init-output.log on each server
8. Note the **Outputs** at the end of apply execution log:

| Name | Value |
| --- | --- |
| app_name | www<area>.your-domain.com |
| bastionserver1 | bastionIP1 (public) |
| bastionserver2 | bastionIP2 (public) |
| ssh-bastionserver1 | ssh root@bastionIP1 |
| ssh-bastionserver2 | ssh root@bastionIP2 |
| replica_db | 172.21.9.4 |
| ssh-replicadb | ssh -o ProxyJump=root@bastionIP2 root@172.21.9.4 |
| source_db | 172.21.1.4 |
| ssh-sourcedb | ssh -o ProxyJump=root@bastionIP1 root@172.21.1.4 |
| webappserver1 | 172.21.0.4 |
| ssh-webappserver1 | ssh -o ProxyJump=root@bastionIP1 root@172.21.0.4 |
| webappserver2 | 172.21.8.4 |
| ssh-webappserver2 | ssh -o ProxyJump=root@bastionIP2 root@172.21.8.4 |

### Schematics Action

1. Go to **Schematics** in cloud portal
2. Select **Actions**
3. Select your action
8. Select **Run action**
9. Select **View log** to review the run action log


### Internet Services

1. Go to **Internet Services** in cloud portal
2. Select **pricing plan**
3. Enter a name for your service
4. Select **Create**
5. Select **Add domain**
6. Enter the name for your domain specified in Schematics
7. Select **Next**
9. Refer to the **New NS records** where your domain name is registered
