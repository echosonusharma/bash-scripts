#!/bin/bash

# simple bash script to get rid of repetitive commands of git push

# future fixes
# - this dosen't check if git is in the system
# - this dosen't check if the current dir has a .git file in it
# - no logic present to handle if every thing is up-to-date 

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
    needs a lot of work!
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

PS3='Pls add a custom commit message or select one - '
commit=("initial-commit:tada:" "refactoring-code:fire:" "crash-fixes:boom:" "ui-changes:sparkles:" "Quit")
select option in "${commit[@]}"
do
    case $option in
        "initial-commit:tada:")
            git-rest ${commit[0]}
            break
            ;;
        "refactoring-code:fire:")
            git-rest ${commit[1]}
            break
            ;;
        "crash-fixes:boom:")
            git-rest ${commit[2]}
            break
            ;;
        "ui-changes:sparkles:")
            git-rest ${commit[3]}
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
            echo -e "${red}--INPUT-IS-NULL--${reset}"   
            exit 1 
        else
           git-rest $REPLY
        fi
        ;;
    esac
done

   
exit