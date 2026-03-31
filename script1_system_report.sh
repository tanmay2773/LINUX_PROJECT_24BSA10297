#!/bin/bash
# Script 1: System Identity Report
# Displays basic system information as a welcome screen
# Concepts: variables, command substitution, echo, basic formatting

# Clear screen for clean display
clear

# Script title with formatting
echo "=========================================="
echo "      SYSTEM IDENTITY REPORT"
echo "=========================================="
echo ""

# Store information in variables using command substitution
DISTRO=$(cat /etc/os-release | grep "^PRETTY_NAME" | cut -d'"' -f2)
KERNEL=$(uname -r)
USER=$(whoami)
HOME_DIR=$HOME
UPTIME=$(uptime -p | sed 's/up //')
DATETIME=$(date "+%Y-%m-%d %H:%M:%S")

# Display the information with descriptive labels
echo "Linux Distribution : $DISTRO"
echo "Kernel Version     : $KERNEL"
echo "Logged-in User     : $USER"
echo "Home Directory     : $HOME_DIR"
echo "System Uptime      : $UPTIME"
echo "Current Date/Time  : $DATETIME"
echo ""

# OS License information
echo "------------------------------------------"
echo "Operating System License Information"
echo "------------------------------------------"
echo "This system runs on Linux, which is licensed under"
echo "the GNU General Public License (GPL) v2."
echo ""

echo "=========================================="