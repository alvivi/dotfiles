
# Git Utils

function gsina {
  git status --porcelain \
  | awk '{ if (substr($0, 0, 2) ~ /^[ ?].$/) print $0 }' \
  | peco \
  | awk '{ print "'`git rev-parse --show-toplevel`'/"$2 }'
}
