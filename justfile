#!/usr/bin/env just --justfile

alias dist := package

# Create unsigneed extension archive
package VER="v1":
    [ -e {{justfile_directory()}}/dist ]  || mkdir {{justfile_directory()}}/dist
    zip -r -FS {{justfile_directory()}}/dist/GruvboxDarkThemeFirefoxPluskMiku-{{VER}}.zip {{justfile_directory()}}/* --exclude '*.git*' --exclude '*.mp4' --exclude '*~' --exclude 'dist' --exclude 'justfile'

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
