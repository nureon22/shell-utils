#!/bin/bash

printlog() {
  LEVEL="$(printf $1 | tr '[:lower:]' '[:upper:]')"
  LOG_TEXT="$2"
  LOG_COLOR=(0 0 0) # (LevelBg LevelColor TextColor)

  case "$LEVEL" in
    "EMERG")   LOG_COLOR=(106 30 96) ;;
    "ALERT")   LOG_COLOR=(103 30 93) ;;
    "CRIT")    LOG_COLOR=(105 30 95) ;;
    "ERROR")   LOG_COLOR=(101 30 91) ;;
    "FAIL")    LOG_COLOR=(101 30 91) ;;
    "WARN")    LOG_COLOR=(43  30 33) ;;
    "NOTICE")  LOG_COLOR=(107 30 97) ;;
    "INFO")    LOG_COLOR=(47  30 37) ;;
    "SUCCESS") LOG_COLOR=(102 30 92) ;;
    "PASS")    LOG_COLOR=(102 30 92) ;;
    "DEBUG")   LOG_COLOR=(104 30 94) ;;
    *)
    printf "\033[01;41m ERROR \033[00;91m $LEVEL: invalid log level\033[00m\n"
    exit 1
      ;;
  esac

  printf "\033[01;${LOG_COLOR[1]};${LOG_COLOR[0]}m $LEVEL \033[00;${LOG_COLOR[2]}m ${LOG_TEXT}\033[00m\n"
}

printlog "$@"
