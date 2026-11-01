#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time period (years): " time

if ! [[ $principal =~ ^[0-9]+([.][0-9]+)?$ && $rate =~ ^[0-9]+([.][0-9]+)?$ && $time =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  printf 'Please enter nonnegative numeric values.\n' >&2
  exit 1
fi

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
  printf "Simple interest: %.2f\n", p * r * t / 100
  printf "Total amount: %.2f\n", p + p * r * t / 100
}'
