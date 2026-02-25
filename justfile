#!/usr/bin/env just --justfile

alias dist := package

# Create unsigneed extension archive
package VER="v1.1":
    [ -e {{justfile_directory()}}/dist ]  || mkdir {{justfile_directory()}}/dist
    cd {{justfile_directory()}} && zip -r -FS dist/GruvboxDarkThemeFirefoxPlusMiku-{{VER}}.zip * --exclude '*.git*' --exclude '*.mp4' --exclude '*~' --exclude 'dist*' --exclude 'justfile' --exclude 'prev.png'

# Push the code to all remotes
push FLAGS="-u" BRANSH="aurora":
    git push {{FLAGS}} github {{BRANSH}}
    git push {{FLAGS}} gitlab {{BRANSH}}
    git push {{FLAGS}} codeberg {{BRANSH}}
    git push {{FLAGS}} disroot {{BRANSH}}
    git push {{FLAGS}} tangled {{BRANSH}}
    git push {{FLAGS}} codefloe {{BRANSH}}

# Push the git tags to all remotes
pusht: push
    git push --tags github
    git push --tags gitlab
    git push --tags codeberg
    git push --tags disroot
    git push --tags tangled
    git push --tags codefloe
