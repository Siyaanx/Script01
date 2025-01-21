#! /bin/sh
repoName=$1
repoName=$2
repoName=$newfile

#to allow user to input the name of their repository
while [ -z "$repoName" ]
do 
    echo "Provide a repository name"
    read -r -p $'Repository name:' repoName
done

##Concl: A local file created by asking the user to input the name of the repo of their choice

#TO create local Git repo 
echo "# $repoName" >> README.md
git init
git status
git add .
git commit -m "First ever commit"

##Concl: A readme file is created while giving the output that its created with the name of the 
## inserted repo name (by the user) and then initialization and commit with the commit message

#To upload local repo to Github
curl -u siyaanx
https://api.github.com/user/repos -d {"name": "'"$repoName"'":, "private":false}

## Concl:This ask for private access token for the user (my github account) and here github api is used
##to decalre the local repo name to upload to github and the privacy setting

#Now to generate a remote url: this is going to be in form of declaring a new variable GIT_URL Aand use curl
#and github api actions to get the remote Url of the new repo
GIT_URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/Siyaanx/"$repoName" | jq -r '.clone_url') 

##Concl: -H sets the header of the request, and then passing the github api endpoint. With Piping using "|"
##the output of the LHS before | is passed as the input of the RHS of the |. And then, jq (a tool for reading)
## json file is used to get the value of the .clone_url, that is the remote URL

#Lastly, to rename the master branch on github, add the remote origin, and push our codes to Github
git branch -M  main
git remote add origin $GIT_URL
git push -u origin main

##Concl: Renaming the branch as main branch, adding the remote origin and then pushing codes
