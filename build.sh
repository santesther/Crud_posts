ECR_REGISTRY="466378788668.dkr.ecr.us-east-1.amazonaws.com"
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
docker build -t aws_posts .
docker tag aws_posts:latest $ECR_REGISTRY/aws_posts:latest
docker push $ECR_REGISTRY/aws_posts:latest

