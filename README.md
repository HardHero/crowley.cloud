# crowley.cloud

This playbook is for my personal web server.

# Building the Server

First Time

aws cloudformation create-stack --stack-name crowley-cloud --template-body file://crowleycloud.yml --capabilities CAPABILITY_NAMED_IAM
Update
aws cloudformation update-stack --stack-name crowley-cloud --template-body file://crowleycloud.yml --capabilities CAPABILITY_NAMED_IAM

# Usage
1.  Change `hosts` to match server
2.  Run playboook `ansible-playbook site.yml -i hosts`
3.  Get that https cert: https://certbot.eff.org/lets-encrypt/centosrhel7-nginx.html

## Issues


# Future work
Certbot playbook
ELB
