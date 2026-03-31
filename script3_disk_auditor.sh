#!/bin/bash
# Script 3: Disk and Permission Auditor
# Audits important system directories and Git directories
# Concepts: for loops, arrays, awk parsing

echo "=========================================="
echo "     DISK AND PERMISSION AUDITOR"
echo "=========================================="
echo ""

# Define an array of important directories to audit
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "System Directories Audit"
echo "------------------------------------------"

# Format header
printf "%-15s %-30s %-15s\n" "Directory" "Permissions (Owner:Group)" "Size"
printf "%-15s %-30s %-15s\n" "----------" "------------------------" "----"

# Loop through each directory in the array
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Get permissions, owner, and group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3":"$4}')
        
        # Get directory size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        # Print formatted output
        printf "%-15s %-30s %-15s\n" "$DIR" "$PERMS" "$SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""
echo "Git-Specific Directory Audit"
echo "------------------------------------------"

# Check Git config directory
if [ -d "$HOME/.git" ]; then
    PERMS=$(ls -ld "$HOME/.git" | awk '{print $1, $3":"$4}')
    SIZE=$(du -sh "$HOME/.git" 2>/dev/null | cut -f1)
    echo "~/.git (dir)   : $PERMS | Size: $SIZE"
else
    echo "~/.git directory not found (no Git repository in home)"
fi

if [ -f "$HOME/.gitconfig" ]; then
    PERMS=$(ls -l "$HOME/.gitconfig" | awk '{print $1, $3":"$4}')
    echo "~/.gitconfig   : $PERMS"
fi

echo "=========================================="