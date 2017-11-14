function hidden_files_on
    defaults write com.apple.finder AppleShowAllFiles "TRUE"
    killall Finder
end

function hidden_files_off
    defaults write com.apple.finder AppleShowAllFiles "FALSE"
    killall Finder
end
