#!/bin/bash
set -euxo pipefail

apt-get update -y
apt-get install -y docker.io
systemctl enable --now docker

mkdir -p /opt/site
cat > /opt/site/index.html <<'EOF'
<!doctype html>
<html>
<head><title>Terraform on AWS</title></head>
<body style="font-family:Arial;text-align:center;margin-top:80px">
  <h1>Deployed with Terraform</h1>
  <p>The VPC, subnet, security group and this EC2 server were all created by code.</p>
  <p>Project 6 by Zeeshan Haider</p>
</body>
</html>
EOF

docker run -d --name web --restart unless-stopped \
  -p 80:80 \
  -v /opt/site:/usr/share/nginx/html:ro \
  nginx:stable-alpine