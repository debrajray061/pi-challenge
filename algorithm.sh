#!/bin/bash
if command -v bc >/dev/null 2>&1; then
    echo "scale=1000; 4*a(1)" | bc -l | tee report.txt
else
    echo "bc not found. Please install bc to compute π." | tee report.txt
fi
