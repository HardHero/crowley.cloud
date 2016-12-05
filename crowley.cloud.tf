# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "crowley.cloud"
provider "aws" {
    access_key = ""
    secret_key = ""
    region = "us-east-1"
}


resource "aws_instance" "crowley-cloud" {
    ami = "ami-40d28157"
    instance_type = "t2.micro"
    key_name = "crowley.cloud"
    vpc_security_group_ids = ["${aws_security_group.crowley-cloud.id}"]
    iam_instance_profile = "${aws_iam_instance_profile.s3-admin.name}"
    tags {
        Name = "crowley.cloud"
        Creator = "Terraformed"
    }
}

resource "aws_eip" "cc-ip" {
  instance = "${aws_instance.crowley-cloud.id}"
  vpc      = true
}

resource "aws_route53_zone" "primary"{
  name = "crowley.cloud"
}

resource "aws_route53_record" "crowley-cloud-domain-record" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "crowley.cloud"
   type = "A"
   ttl = "300"
   records = ["${aws_eip.cc-ip.public_ip}"]
}

resource "aws_iam_instance_profile" "s3-admin" {
    name = "s3_admin"
    roles = ["${aws_iam_role.role.name}"]
}

variable "s3_admin_policy" {
  description = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "s3:*",
          "Resource": "*"
        }
      ]
    }
EOF
  default_server = {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": "*"
      }
    ]
  }
}

resource "aws_iam_role" "role" {
    name = "s3_admin"
    path = "/"
    assume_role_policy = ${var.s3_admin_policy}
}

resource "aws_security_group" "crowley-cloud" {
  name = "crowely.cloud"
  description = "Allow all inbound traffic"

  ingress {
      from_port = 0
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 0
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 0
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["xx.xx.xx.xx/0"]
  }
  tags {
    Name = "crowley.cloud"
  }
}
