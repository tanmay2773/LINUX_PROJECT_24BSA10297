#!/bin/bash
# Script 4: Log File Analyzer
# Analyzes log files for keyword occurrences
# Concepts: while read loop, counters, if-then, tail, grep

# Default values
LOGFILE="/var/log/syslog"
KEYWORD="error"
COUNT=0

echo "=========================================="
echo "        LOG FILE ANALYZER"
echo "=========================================="
echo "Log file: $LOGFILE"
echo "Keyword:  '$KEYWORD'"
echo ""

# Check if log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "❌ Error: File '$LOGFILE' not found."
    exit 1
fi

# Check if file is readable
if [ ! -r "$LOGFILE" ]; then
    echo "❌ Error: File '$LOGFILE' is not readable."
    echo "Try running with: sudo $0"
    exit 1
fi

# Read the file line by line and count keyword occurrences
while IFS= read -r LINE; do
    # Check if line contains the keyword (case insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

# Display summary
echo "------------------------------------------"
echo "SUMMARY"
echo "------------------------------------------"
echo "Total lines containing '$KEYWORD': $COUNT"

echo ""
echo "------------------------------------------"
echo "LAST 5 MATCHING LINES"
echo "------------------------------------------"

# Show the last 5 matching lines
grep -i "$KEYWORD" "$LOGFILE" | tail -5 | nl -w2 -s': '

echo ""
echo "=========================================="