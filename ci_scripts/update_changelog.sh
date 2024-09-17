#!/bin/bash

# Fetch the latest release information in JSON format
release_info=$(gh release view --json tagName,publishedAt,body)

# Extract the tag, published date, and body using jq
tag=$(echo "$release_info" | jq -r '.tagName')
published=$(echo "$release_info" | jq -r '.publishedAt')
body=$(echo "$release_info" | jq -r '.body')

# Format the release information
formatted_release_info=$(cat <<EOF
## Tag: $tag
**Published**: $published
$body
EOF
)

# Append the formatted release information to CHANGELOG.md
echo "$formatted_release_info" >> CHANGELOG.md

# Append a line of dashes to CHANGELOG.md
echo """
---
""" >> CHANGELOG.md