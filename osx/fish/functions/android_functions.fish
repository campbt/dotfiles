# Collection of useful ADB commands
function adb_activities
    adb shell dumpsys activity | grep -i run
end

function adb_stack
    adb shell dumpsys activity activities | sed -En -e '/Stack #/p' -e '/Running activities/,/Run #0/p'
end

function adb_restart
    adb kill-server; adb start-server
end

function adb_wifi_on
    adb shell svc wifi enable
end

function adb_wifi_off
    adb shell svc wifi disable
end

function adb_communicator
    adb logcat -s ChatCommunicator
end

# ICE gradle release command (run in repo)
function gradle_release
    ./gradlew -DreleaseBuild=true clean build assemble release -x test
end
