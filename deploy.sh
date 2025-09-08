#!/bin/bash
set -e

# -------------------------------
# Deployment Script for Strapi
# -------------------------------

: "${BASE_DIR:?Need to set BASE_DIR}"
: "${BRANCH:?Need to set BRANCH}"
: "${SERVICE_NAME:?Need to set SERVICE_NAME}"
: "${TAG:=latest}"    # Docker image tag
: "${REPO_URL:?Need to set REPO_URL}"

# ----- Clean up old code -----
echo "Cleaning up existing $SERVICE_NAME directory..."
sudo rm -rf "$BASE_DIR/$SERVICE_NAME"

# ----- Clone repo -----
echo "Cloning repository $REPO_URL (branch: $BRANCH)..."
cd "$BASE_DIR"
git clone "$REPO_URL" -b "$BRANCH" "$SERVICE_NAME"

cd "$BASE_DIR/$SERVICE_NAME"

# ----- Show recent commits -----
echo "Recent git commits:"
git log -n 3 --oneline

# ----- Build Docker image -----
echo "Building Docker image $SERVICE_NAME:$TAG..."
docker build -t "$SERVICE_NAME:$TAG" .

# ----- Stop existing container if exists -----
if [ "$(docker ps -aq -f name=$SERVICE_NAME)" ]; then
  echo "Removing existing container $SERVICE_NAME..."
  docker rm -f "$SERVICE_NAME"
fi

# ----- Start service with Docker Compose -----
cd "$BASE_DIR"
echo "Starting $SERVICE_NAME service with docker-compose..."
docker-compose up -d --force-recreate --no-deps "$SERVICE_NAME"

# ----- Wait and show logs -----
echo "Waiting for container to initialize..."
sleep 15
echo "Logs from $SERVICE_NAME ($TAG):"
docker logs "$SERVICE_NAME"
