#!/usr/bin/env zsh

function printfpath {
  echo $fpath | sed 's/\s/\n/g' | fzf
}
