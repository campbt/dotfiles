function fish_user_key_bindings
    # Without an argument, fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    #fish_vi_key_bindings insert

    # Maps Ctrl-_ to escape the vim. Map iTerm2 to send Ctrl-Space to Ctrl-_
    # Intended to use something other than Esc since tmux doesn't play nicely with Escape)
    # To map Ctrl+Space to Ctrl+_ in iTerm2, go to Profile -> Keys, and add a mapping of ^Space -> Send Hex Codes 0x1F
    bind --mode insert --sets-mode default \c_ force-repaint
    bind --mode visual --sets-mode default \c_ end-selection force-repaint
    #bind --mode default --sets-mode default \c_ force-repaint

    bind -M insert \cn nextd-or-forward-word
    bind -M insert \cp prevd-or-backward-word
    bind -M insert \cf accept-autosuggestion
end
