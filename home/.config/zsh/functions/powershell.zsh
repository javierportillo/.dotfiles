#!/usr/bin/env zsh

function pw {
  command=${@:?"The command must be specified."}

  powershell.exe -command "$command"
}
