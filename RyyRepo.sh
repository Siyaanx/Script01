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
## This ask for private access token for the user (my github account) and here github api is used
##to decalre the local repo name to upload to github and the privacy setting

#