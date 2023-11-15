# Configure RHEL machine

```sh
ansible-playbook playbook.yaml -i "<host-ip,", -e username=<rhel_subscription_username> -e passsword=<rhel_subscription_password>
```