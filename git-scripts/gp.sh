#!/bin/bash

# simple bash script to get rid of repetitive commands of git push

# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

gh-help(){
# will be usefull in the future 
cat << _EOF_ 
    it's just a script to push to github
_EOF_
}

leave(){
    echo -e "${green}----------------------${reset}"
    echo -e "${green}--PUSHED-TO-GITHUB-!--${reset}"
    echo -e "${green}----------------------${reset}"
}

# -e his tells echo to enable interpretation of escapes so that the color codes work
error-m(){
    echo -e "${red}-----------------------------${reset}"
    echo -e "${red}--COMMIT-MESSAGE-IS-EMPTY-!--${reset}"
    echo -e "${red}-----------------------------${reset}"
}

# git push asd
git-rest(){
    git commit -m $1
    git push
    leave

    exit
}


if [ "$1" == "--help" ]; then
    gh-help
    exit
fi

echo -e "${blue}started pusing all files to github...${reset}"
git add .

PS3='pls add a custom commit message or select one - '
commit=(":tada: initial commit" ":fire: refactoring code" ":boom: crash fixes" ":sparkles: ui changes" "Quit")
select option in "${commit[@]}"
do
    case $option in
        ":tada: initial commit")
            git-rest ${commit[$1]}
            break
            ;;
        ":fire: refactoring code")
            git-rest ${commit[$2]}
            break
            ;;
        ":boom: crash fixes")
            git-rest ${commit[$3]}
            break
            ;;
        ":sparkles: ui changes")
            git-rest ${commit[$4]}
            break
            ;;
        "Quit")
            break
            ;;
        *) 
        # Check for Space
        if [[ $REPLY =~ \ + ]]; then
            error-m
            exit 1
        # Check if input is NULL (probably don't need one )
        elif [[ -z "$REPLY" ]]; then
            echo -e "${red}--input-is-NULL--${reset}"   
            exit 1 
        else
           git-rest $REPLY
        fi
        ;;
    esac
done

   
exit