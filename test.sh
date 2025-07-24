#!/bin/bash
set -e

# Start PHP server in the background
php -S localhost:8000 > /dev/null 2>&1 &
SERVER_PID=$!

# Give the server time to start
sleep 2

# Make request to index.php
RESPONSE=$(curl -s http://localhost:8000)

# Stop the server
kill $SERVER_PID

# Check the response
if [[ "$RESPONSE" == *"Hello, World"* ]]; then
    echo "✅ Test passed"
    exit 0
else
    echo "❌ Test failed. Got: $RESPONSE"
    exit 1
fi
