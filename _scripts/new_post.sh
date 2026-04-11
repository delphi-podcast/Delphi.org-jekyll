#!/bin/bash
# Creates a new Jekyll post with basic YAML front matter.

if [ -z "$1" ]; then
    echo "Usage: ./_scripts/new_post.sh \"Post Title\""
    exit 1
fi

TITLE="$1"

# Generate slug
SLUG=$(echo "$TITLE" | iconv -t ascii//TRANSLIT | sed -r s/[~\^]+//g | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z)

# Date variables
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S-06:00) # Defaulting to -06:00 as per previous posts

FILENAME="_posts/${DATE}-${SLUG}.md"

# Create file
cat << EOF > "$FILENAME"
---
title: '$TITLE'
date: '${DATE}T${TIME}'
author: 'Jim McKeeth'
layout: post
categories:
    - News
tags:
    - 
---

Write your post here...
EOF

echo "Created new post: $FILENAME"
