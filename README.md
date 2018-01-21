# crowley.cloud
This playbook is for my personal website.

# System Requirements
1.  Ubunutu 16.XX
2.  Install python `apt-get install python`
3.  On your `from` macheine, you need at least boto 2.5
        pip install boto==2.5.2
4.  Install additional roles on `from` machine
        ansible-galaxy install geerlingguy.nginx geerlingguy.git geerlingguy.letsencrypt kbrebanov.pip
# Usage

## Production
1.  Change `hosts` to match server
2.  Run playboook `ansible-playbook aws-infrastructure.yml -i hosts --vault-password-file .vault_pass`
2.  Run playboook `ansible-playbook site.yml -i hosts`
3.  Due to the limitations of `geerlingguy.letsencrypt`, you have to log on to the server and run the following to on the server
        /opt/certbot/certbot-auto --nginx --redirect
NOTE: Cert will renew every week on Sunday


#Future work
Figure out AWS credentials
ELB
Multiple web servers
