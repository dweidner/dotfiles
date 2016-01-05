#!/usr/bin/env bash

#
# Test if an array contains a certain value.
#
# Usage: array_contains array search
#
# $1 = Array to search
# $2 = Value to find
#
array_contains() {
  local len=$#
  local search=${*: -1}
  local array=(${@:1:$len-1})

  for item in "${array[@]}"; do
    if [[ "$item" == "$search" ]]; then
      return 0
    fi
  done

  return 1
}
