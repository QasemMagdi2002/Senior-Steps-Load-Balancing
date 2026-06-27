#!/bin/bash
yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -s -X PUT http://169.254.169.254/latest/api/token -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<EOF
<html>
  <body>
    <h1>Welcome to my web application</h1>
    <p>This page is running on EC2 instance: $INSTANCE_ID</p>
    <p>Availability Zone: $AZ</p>
  </body>
</html>
EOF
