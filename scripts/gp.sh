#!/bin/bash

# simple bash script to get rid of repetitive commands of git push

# future fixes
# - no logic present to handle if every thing is already up-to-date in git

# Ansi color code variables
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
white="\e[0;97m"
yellow="\e[0;33m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"

gh-help(){
# will be usefull in the future 
cat << _EOF_ 
    A script to push to any hosted version of Git!
_EOF_
}

# -e his tells echo to enable interpretation of escapes so that the color codes work
leave(){
    echo -e "${green}-------------${reset}"
    echo -e "${green}${bold}--Published--${reset}"
    echo -e "${green}-------------${reset}"
}

error-m(){
    echo -e "${red}-----------------------------${reset}"
    echo -e "${red}${bold}--Commit-Message-Can't-Be-Empty--${reset}"
    echo -e "${red}-----------------------------${reset}"
}

no-git(){
    echo -e "${red}-------------------------------------${reset}"
    echo -e "${red}${bold}--Folder-Isn't-Initialized-with-git--${reset}"
    echo -e "${red}-------------------------------------${reset}"
}


git-publish(){
    echo -e "${yellow}-- Git Status --${reset}"
    git status
    echo -e "${yellow}---------------------------${reset}"
    echo -e "${yellow}Started adding all files...${reset}"
    echo -e "${yellow}---------------------------${reset}"
    git add .
    git commit -m "${1}"
    git push
    leave

    exit
}


if [ "$1" == "--help" ]; then
    gh-help
    exit
fi

if git rev-parse --git-dir > /dev/null 2>&1; then 
    PS3='Add a custom commit message or select one from below - '
    commit=("initial commit :tada:" "refactoring code :fire:" "crash fixes :boom:" "ui changes :sparkles:" "code added" "Quit")
    select option in "${commit[@]}"
    do
        case $option in
            "initial commit :tada:") 
            git-publish "${commit[0]}"
                break
                ;;
            "refactoring code :fire:")
            git-publish "${commit[1]}"
                break
                ;;
            "crash fixes :boom:")
            git-publish "${commit[2]}"
                break
                ;;
            "ui changes :sparkles:")
            git-publish "${commit[3]}"
                break
                ;;
            "code added")
            git-publish "${commit[4]}"
                break
                ;;
            "Quit")
                break
                ;;
            *) 
            # Check for null
            if [ -z $MESSAGE ]; then
                error-m
                exit 1
            else
            # git-publish "$MESSAGE"
            echo "$MESSAGE"
            fi
            ;;
        esac
    done
else 
    no-git
    exit 1
fi
   
exit