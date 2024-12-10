#!/bin/bash
mkdir frontend-code
cp -r ../frontend/* frontend-code/
cd frontend-code

cat > .env << EOL
BASE_URL=$1
CLOUDFRONT_DISTRIBUTION_URL=""
EOL

docker buildx build --tag carshub-frontend --file ./Dockerfile .
docker tag carshub-frontend:latest us-central1-docker.pkg.dev/our-mediator-443812-i8/carshub-frontend/carshub-frontend:latest
docker push us-central1-docker.pkg.dev/our-mediator-443812-i8/carshub-frontend/carshub-frontend:latest