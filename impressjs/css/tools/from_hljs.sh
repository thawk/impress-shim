#!/usr/bin/env bash
# Time: 2021-09-23 09:55:32

if [[ -z "$1" ]]; then
  echo "need ONE argument: css file name" 1>&2
  exit 1
fi

filename="$1"
bg_color=$(sed -n -e '1,/^\.hljs/d; /^[ \t]*background:[ \t]*\(#[0-9a-fA-F]*\).*/{s//\1/;p;q;}' "$filename")

get_color() {
  local filename="$1"
  local class="$2"
  local attr="$3"
  cat "$filename" |
    sed -nE -e "1,/^\.${class}/d; /^[ \t]*${attr}:[ \t]*(#?[[:alnum:]]+).*/{s//\1/;p;q;}"
}

color_line() {
  local dest="$1"
  local filename="$2"
  local class="$3"
  local attr="$4"

  local color=$(get_color "$filename" "$class" "$attr")
  if [[ -n "$color" ]]; then
    echo "\$${dest}: ${color},"
  fi
}

cat <<-EOS
// from $(basename "$filename")
@use 'common' with (
    $(color_line bg-color       "$filename" "hljs"         "background")
    $(color_line text-color     "$filename" "hljs"         "color")
    $(color_line title-color    "$filename" "hljs-title"   "color")
    $(color_line list-alt-color "$filename" "hljs-built_in" "color")
    $(color_line accent-color   "$filename" "hljs-keyword" "color")
    $(color_line border-color   "$filename" "hljs-comment" "color")
    $(color_line link-color     "$filename" "hljs-link"    "color")
);
EOS
