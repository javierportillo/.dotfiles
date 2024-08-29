#!/usr/bin/env zsh

printfpath () {
  echo $fpath | sed 's/\s/\n/g' | fzf
}
