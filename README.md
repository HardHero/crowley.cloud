# crowley.cloud
This playbook is for my personal website.

# System Requirements
1.  Ubunutu 16.XX
2.  Install python `apt-get install python`
3.  On your `from` macheine, you need at least boto 2.5
        pip install boto==2.5.2
4.  Install additional roles on `from` machine
        ansible-galaxy install geerlingguy.nginx geerlingguy.git geerlingguy.certbot kbrebanov.pip

# Usage
1.  Change `hosts` to match server
2.  Run playboook `ansible-playbook aws-infrastructure.yml -i hosts --vault-password-file .vault_pass`
2.  Run playboook `ansible-playbook site.yml -i hosts`
3. Do this because I can't automate it: https://certbot.eff.org/#ubuntuxenial-nginx

## Issues
Ansible copy is not working correctly so running those copy command manually. Seems to be a problem with the lookups.

# Future work
Certbot playbook
Figure out AWS credentials
ELB
Multiple web servers
