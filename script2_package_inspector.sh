#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if Git is installed and displays information
# Concepts: conditionals, case statements, package queries

# Set the package to check (Git)
PACKAGE="git"

echo "=========================================="
echo "     FOSS PACKAGE INSPECTOR"
echo "=========================================="
echo "Inspecting package: $PACKAGE"
echo ""

# Check if package is installed
if command -v $PACKAGE &>/dev/null; then
    echo "✅ $PACKAGE is INSTALLED."
    echo ""
    
    # Get version information
    echo "Version information:"
    $PACKAGE --version 2>/dev/null | head -3
    
    # Location of binary
    echo ""
    echo "Binary location: $(which $PACKAGE 2>/dev/null)"
    
else
    echo "❌ $PACKAGE is NOT installed."
    echo ""
    echo "To install Git on Ubuntu/Debian:"
    echo "  sudo apt update && sudo apt install git"
fi

echo ""
echo "------------------------------------------"
echo "PHILOSOPHY NOTES"
echo "------------------------------------------"

# Case statement with philosophical notes about Git
case $PACKAGE in
    git)
        echo "Git: Created by Linus Torvalds in 2005 when proprietary"
        echo "version control failed the Linux kernel community."
        ;;
    httpd)
        echo "Apache: The web server that built the open internet."
        ;;
    mysql)
        echo "MySQL: Open source at the heart of millions of apps."
        ;;
    *)
        echo "Every open source tool represents sharing knowledge."
        ;;
esac

echo ""
echo "=========================================="