#!/bin/bash
set -eo pipefail

# Build the Docker image with the correct context
echo "Building Docker image with Dockerfile: $SCRIPT_DIR/Dockerfile"
sudo docker build -f ./container_images/webapp_container_image/Dockerfile -t webapp_container_image .

# Generate a unique tag for the image
tag=$(date -u +"%Y%m%d-%H%M%S")
echo "Tagging image with: $tag"
sudo docker tag webapp_container_image webapp_container_image:$tag

# Output the tag to a file to be used in deployment
echo -n "$tag" > ./container_images/webapp_container_image/image_tag.txt

echo "Build and tagging complete. Tag: $tag"