join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(${FZF_PREFIX}g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey -M viins '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper v f b t r
unset -f bind-git-helper
