#!/bin/bash

# Script to check GitHub repository visibility using GitHub CLI
# Usage: ./check_visibility.sh [OWNER/REPO]
# Example: ./check_visibility.sh snehamm-bot/ANN_Classification_Churn

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Please install it from: https://cli.github.com/"
    exit 1
fi

# Get the repository argument or use the current repository
if [ -n "$1" ]; then
    REPO="$1"
else
    # Try to detect the current repository
    REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null)
    if [ -z "$REPO" ]; then
        echo "Usage: $0 [OWNER/REPO]"
        echo "Example: $0 snehamm-bot/ANN_Classification_Churn"
        exit 1
    fi
fi

echo "Checking visibility for repository: $REPO"
echo "----------------------------------------"

# Run the gh repo view command to get visibility
VISIBILITY=$(gh repo view "$REPO" --json visibility -q .visibility 2>&1)

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "Repository: $REPO"
    echo "Visibility: $VISIBILITY"
    
    # Additional information
    if [ "$VISIBILITY" = "PUBLIC" ]; then
        echo "Status: This repository is publicly accessible"
    elif [ "$VISIBILITY" = "PRIVATE" ]; then
        echo "Status: This repository is private"
    else
        echo "Status: Unknown visibility status"
    fi
else
    echo "Error: Failed to retrieve repository visibility"
    echo "$VISIBILITY"
    exit 1
fi
