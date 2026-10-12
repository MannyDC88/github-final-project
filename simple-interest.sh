#!/bin/bash
# Simple Interest Calculator
# Calculates simple interest from principal, annual rate, and time period.
# Formula: Simple Interest = (Principal x Rate x Time) / 100

echo "Simple Interest Calculator"
echo "--------------------------"

read -p "Enter the principal amount: " principal
read -p "Enter the annual rate of interest (%): " rate
read -p "Enter the time period (in years): " time

# Make sure every input is a positive number
for value in "$principal" "$rate" "$time"; do
  if ! [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: please enter positive numbers only."
    exit 1
  fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p + i }')

echo ""
echo "Simple interest: $interest"
echo "Total amount (principal + interest): $total"
