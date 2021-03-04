#!/bin/bash
mkdir -p test-logs
rspec --format documentation --no-color --out ./test-logs/$(date "+%Y%m%d%H%M").txt