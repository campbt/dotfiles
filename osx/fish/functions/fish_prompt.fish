# Available Colors:
# black, red, green, yellow, blue, magenta, cyan, white
# brblack, brred, brgreen, bryellow, brblue, brmagenta, brcyan, brwhite

function fish_prompt
    set -l status_copy $status
    set -l dir
    set -l base

    set -l color (set_color white)
    set -l color2 (set_color normal)

    set -l color_error (set_color $fish_color_error)
    set -l color_normal (set_color $fish_color_normal)

    echo -sn " "

    if test "$status_copy" -ne 0
        set color "$color_error"
        set color2 "$color_error"
    end

    if test 0 -eq (id -u "$USER")
        echo -sn "$color_error\$ $color_normal"
    end

    if test ! -z "$SSH_CLIENT"
        set -l color "$color2"

        if test 0 -eq (id -u "$USER")
            set color "$color_error"
        end

        echo -sn "$color"(host_info "usr@")"$color_normal"
    end

    #set -l pwd_info (pwd_info "/")
    #if test "$PWD" = ~
        #set base (set_color cyan)"~"
    #else if pwd_is_home
        #set dir
    #else
        #if test "$PWD" != /
            #set dir "/"
        #end

        #set base "$color_error/"
    #end

    #if test ! -z "$pwd_info[1]"
        #set base "$pwd_info[1]"
    #end

    #if test ! -z "$pwd_info[2]"
        #set dir "$dir$pwd_info[2]/"
    #end

    #echo -sn "$color2$dir$color$base$color_normal"

    #if test ! -z "$pwd_info[3]"
        #echo -sn "$color/$pwd_info[3]"
    #end

    set -l dir (echo $PWD | sed -e "s|^$HOME|~|")
    set -l arrow_color (set_color green)
    set -l directory_color (set_color blue)
    set -l mode (echo "-")

    # Change directory color based on VI mode (if in one)
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set arrow_color (set_color blue)
                set directory_color (set_color green)
            case insert
                set arrow_color (set_color green)
                set directory_color (set_color blue)
            case replace_one
                set arrow_color (set_color magenta)
                set directory_color (set_color red)
            case visual
                set arrow_color (set_color red)
                set directory_color (set_color magenta)
        end
    end

    #echo -sn "$directory_color▸ $dir"
    echo -sn "$arrow_color⟩ "
    echo -sn "$directory_color$dir"

    if set branch_name (git_branch_name)
        set -l git_color
        set -l git_glyph "╍"

        if git_is_dirty
            set git_color (set_color red)
        else if git_is_staged
            set git_color (set_color green)
        else if [ (git_untracked_files) -ne 0 ]
            set git_color (set_color yellow)
        else
            set git_color (set_color brblack)
        end

        #set -l git_ahead (git_ahead "+" "-" "±")

        echo -sn " $git_color$git_glyph"
    else
        # Not in git repo.
        switch "$PWD"
            case ~
                # Special Case: If at home, don't add glyph
            case '*'
                # Add git glyph
                set -l caret_glyph "▸"
                echo -sn " $arrow_color$caret_glyph"
        end

    end

    echo -sn "$color_normal "
end
