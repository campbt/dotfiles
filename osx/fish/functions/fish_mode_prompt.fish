function fish_mode_prompt
    # This removes those ugly characters when in VI mode
    #if test "$fish_key_bindings" = "fish_vi_key_bindings"
        #switch $fish_bind_mode
            #case default
                ##set_color --bold red
                #set_color green
                ##echo 🅽
            #case insert
                #set_color blue
                #echo 🅸
            #case replace-one
                #set_color red
                #echo 🆁
            #case visual
                #set_color brmagenta
                #echo 🆅
        #end
        #set_color normal
        #printf " "
    #end
end
