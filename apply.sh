#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a git repository!"
    exit 1
fi

# Check if mods is available
if ! command -v mods &> /dev/null; then
    print_error "mods CLI tool is not installed or not in PATH"
    exit 1
fi

# Check if there are any changes to commit
if git diff --cached --quiet && git diff --quiet; then
    print_warning "No changes detected. Nothing to commit."
    exit 0
fi

# Stage all changes if nothing is staged
if git diff --cached --quiet; then
    print_info "Staging all changes..."
    git add -A
fi

# Get the git diff
print_info "Getting git diff..."
DIFF=$(git diff --cached)

if [ -z "$DIFF" ]; then
    print_error "No staged changes found!"
    exit 1
fi

# Generate commit message using mods
print_info "Generating commit message using mods..."
COMMIT_MSG=$(echo "$DIFF" | mods "Generate a concise, conventional commit message for these changes. Use conventional commit format (type(scope): description). Be specific about what changed. Return only the commit message, no extra text or formatting.")

if [ -z "$COMMIT_MSG" ]; then
    print_error "Failed to generate commit message!"
    exit 1
fi

print_info "Generated commit message:"
echo -e "${GREEN}$COMMIT_MSG${NC}"

# Ask for confirmation
read -p "Do you want to commit with this message? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_warning "Commit cancelled by user."
    exit 0
fi

# Commit the changes
print_info "Committing changes..."
git commit -m "$COMMIT_MSG"
print_success "Changes committed successfully!"

# Run NixOS switch
print_info "Running 'nh os switch .'..."
if command -v nh &> /dev/null; then
    nh os switch .
    print_success "NixOS switch completed successfully!"
else
    print_error "nh command not found! Please install nh or run 'nixos-rebuild switch --flake .' manually."
    exit 1
fi
