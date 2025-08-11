aws ec2 describe-security-groups \
  --filters "Name=group-name,Values=web_sg" "Name=vpc-id,Values=vpc-052ef60fa14a33077" \
  --query "SecurityGroups[*].GroupId" \
  --output text
