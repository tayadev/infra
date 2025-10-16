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

# Check if there are any changes to stage
if git diff --cached --quiet && git diff --quiet; then
    print_warning "No changes detected. Nothing to stage."
    exit 0
fi

# Stage all changes if nothing is staged
if git diff --cached --quiet; then
    print_info "Staging all changes..."
    git add -A .
    print_success "Changes staged successfully!"
else
    print_info "Changes already staged."
fi

# Run NixOS switch
print_info "Running 'nh os switch .'..."
if command -v nh &> /dev/null; then
    nh os switch .
    print_success "NixOS switch completed successfully!"
else
    print_error "nh command not found! Please install nh or run 'nixos-rebuild switch --flake .' manually."
    exit 1
fi
