#!/bin/bash

find $1 -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10