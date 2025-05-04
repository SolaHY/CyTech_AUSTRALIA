#!/bin/bash

# Set your production proxy URL here
PROD_PROXY_URL="https://cytech-australia.com/api/slack"

echo "Building Flutter web app for production..."
flutter build web --dart-define=PROXY_URL=$PROD_PROXY_URL

echo "Build complete! Production files are in build/web"
echo "You can now deploy the contents of build/web to your web hosting service" 