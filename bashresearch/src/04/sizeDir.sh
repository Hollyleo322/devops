#!/bin/bash

echo "$(du -h $1 2>/dev/null | sort -hr | head -n 5)"