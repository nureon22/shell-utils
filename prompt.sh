#!/bin/sh

# yes or no prompt
# Options:
#   --yes: Default to yes
#   --no: Default to no
prompt() {
  DEFAULT=""
  TEXT=""
  ANS=""

  for arg in $@; do
    if [ $arg = "-y" ] || [ "$arg" = "--yes" ]; then
      DEFAULT="yes"
    elif [ $arg = "-n" ] || [ "$arg" = "--no" ]; then
      DEFAULT="no"
    else
      TEXT="$arg"
    fi
  done

  if [ "$DEFAULT" = "yes" ]; then
    TEXT="$TEXT [Y/n] "
  elif [ "$DEFAULT" = "no" ]; then
    TEXT="$TEXT [y/N] "
  else
    TEXT="$TEXT [y/n] "
  fi

  while :; do
    read -r -p "$TEXT" ANS
    ANS=$(echo "$ANS" | cut -c 1 | tr '[:upper:]' '[:lower:]')

    if [ "$ANS" = "y" ]; then
      return 0
    elif [ "$ANS" = "n" ]; then
      return 1
    else
      if [ "$DEFAULT" = "yes" ]; then
        return 0
      elif [ "$DEFAULT" = "no" ]; then
        return 1
      fi
    fi
  done
}
