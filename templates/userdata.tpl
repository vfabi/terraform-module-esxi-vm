#cloud-config
# More examples: https://cloudinit.readthedocs.io/en/latest/topics/examples.html


ssh_pwauth: True
# package_upgrade: true  # Upgrade the instance on first boot (ie run apt-get upgrade)
# package_update: true  # Update apt database on first boot (run 'apt-get update')


# packages:
#  - ntp
#  - ntpdate


users:
  - default
  - name: ${SSH_USER_NAME}
    primary_group: ${SSH_USER_NAME}
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: sudo, wheel
    gecos: Default admin user
    lock_passwd: False
    shell: /bin/bash
    plain_text_passwd: '${SSH_USER_PASSWORD}'
    # ssh_authorized_keys:
    # - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE0c5FczvcGSh/tG4iw+Fhfi/O5/EvUM/96js65tly4++YTXK1d9jcznPS5ruDlbIZ30oveCBd3kT8LLVFwzh6hepYTf0YmCTpF4eDunyqmpCXDvVscQYRXyasEm5olGmVe05RrCJSeSShAeptv4ueIn40kZKOghinGWLDSZG4+FFfgrmcMCpx5YSCtX2gvnEYZJr0czt4rxOZuuP7PkJKgC/mt2PcPjooeX00vAj81jjU2f3XKrjjz2u2+KIt9eba+vOQ6HiC8c2IzRkUAJ5i1atLy8RIbejo23+0P4N2jjk17QySFOVHwPBDTYb0/0M/4ideeU74EN/CgVsvO6JrLsPBR4dojkV5qNbMNxIVv5cUwIy2ThlLgqpNCeFIDLCWNZEFKlEuNeSQ2mPtIO7ETxEL2Cz5y/7AIuildzYMc6wi2bofRC8HmQ7rMXRWdwLKWsR0L7SKjHblIwarxOGqLnUI+k2E71YoP7SZSlxaKi17pqkr0OMCF+kKqvcvHAQuwGqyumTEWOlH6TCx1dSPrW+pVCZSHSJtSTfDW2uzL6y8k10MT06+pVunSrWo5LHAXcS91htHV1M1UrH/tZKSpjYtjMb5+RonfhaFRNzvj7cCE1f3Kp8UVqAdcGBTtReoE8eRUT63qIxjw03a7VwAyB2w+9cu1R9/vAo8SBeRqw== sakutz@gmail.com

# manage_resolv_conf: true
# resolv_conf:
#   nameservers: ['8.8.4.4', '8.8.8.8']
#   searchdomains:
#     - foo.example.com
#     - bar.example.com
#   domain: example.com
#   options:
#     rotate: true
#     timeout: 1


runcmd:
    - hostnamectl set-hostname ${HOSTNAME}