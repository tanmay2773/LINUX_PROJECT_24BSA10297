#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Generates a personalized open source philosophy statement
# Concepts: read for user input, string concatenation, file output, date

# Clear screen
clear

echo "=========================================="
echo "    OPEN SOURCE MANIFESTO GENERATOR"
echo "=========================================="
echo ""
echo "This tool will generate your personal open source"
echo "philosophy statement based on your answers."
echo ""

# Get current date and username
DATE=$(date "+%B %d, %Y")
USERNAME=$(whoami)

# Ask questions using read with prompt
echo "Please answer the following questions:"
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

echo ""
echo "Generating your manifesto..."
sleep 1

# Define output filename
OUTPUT="manifesto_${USERNAME}_$(date +%Y%m%d).txt"

# Create the manifesto content
cat > "$OUTPUT" << EOF
========================================
        OPEN SOURCE MANIFESTO
          Generated: $DATE
            by: $USERNAME
========================================

I use $TOOL every day. It is not just a tool to me — it is a 
statement that software should be shared, not hoarded.

When I think of freedom, one word comes to mind: $FREEDOM.
This is what open source means: the freedom to use, study,
share, and improve the software that runs our lives.

If I could build one thing and share it freely with the world,
I would build $BUILD. Not for profit, but because sharing
knowledge benefits everyone.

----------------------------------------
I stand with the open source community. I believe that code
should be transparent and knowledge should be free.
----------------------------------------

This is my manifesto.
This is my commitment.

${USERNAME^^}
EOF

echo ""
echo "✅ Manifesto generated successfully!"
echo "File saved as: $OUTPUT"
echo ""
echo "----------------------------------------"
echo "PREVIEW:"
echo "----------------------------------------"
cat "$OUTPUT"
echo ""
echo "=========================================="