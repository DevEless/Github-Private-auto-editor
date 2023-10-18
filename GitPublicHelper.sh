#!/bin/bash

#pour utiliser ce script il vous faut jq et gh installé sur votre shell



#token : le token doit etre crée sur git hub et avoir tous les droits 

TOKEN="crée toi un token et donnes lui tous les droits"

repos=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/user/repos?per_page=1000" | jq -r '.[] | .full_name')
REPOS=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/user/repos?per_page=1000" | jq -r '.[].full_name')




echo "   
                __          ________ _      _____ ____  __  __ ______   _______ ____                               
                \ \        / /  ____| |    / ____/ __ \|  \/  |  ____| |__   __/ __ \                              
                 \ \  /\  / /| |__  | |   | |   | |  | | \  / | |__       | | | |  | |                             
                  \ \/  \/ / |  __| | |   | |   | |  | | |\/| |  __|      | | | |  | |                             
                   \  /\  /  | |____| |___| |___| |__| | |  | | |____     | | | |__| |                             
   _____ _____ _____\/ _\/  _|______|______\_____\____/|_| _|_|______|_   |_|__\____/__ _____ _______ ____  _____  
  / ____|_   _|__   __| |  | | |  | |  _ \  | |  | |  ____| |    |  __ \  |  ____|  __ \_   _|__   __/ __ \|  __ \ 
 | |  __  | |    | |  | |__| | |  | | |_) | | |__| | |__  | |    | |__) | | |__  | |  | || |    | | | |  | | |__) |
 | | |_ | | |    | |  |  __  | |  | |  _ <  |  __  |  __| | |    |  ___/  |  __| | |  | || |    | | | |  | |  _  / 
 | |__| |_| |_   | |  | |  | | |__| | |_) | | |  | | |____| |____| |      | |____| |__| || |_   | | | |__| | | \ \ 
  \_____|_____|  |_|  |_|  |_|\____/|____/  |_|  |_|______|______|_|      |______|_____/_____|  |_|  \____/|_|  \_\
                                                                                                                   
                                                                                                                  "




sleep 2

echo "Copyright (C) DevEless corporation all right reserved"
sleep 1
echo "WARNING"

sleep 1

echo "Make sur you have jq and gh installed before using this god script"

sleep 2

read -p "1/ pass all your repositories in private
2/ pass all your repositories in public
3/ im a pussy and i do that manualy" user_input

if [ "$user_input" = "1" ]; then

    for REPO in $REPOS
    do
        echo "Scan en cours du dépôt : $REPO"
        curl -X PATCH -H "Authorization: token $TOKEN" -s "https://api.github.com/repos/$REPO" -d '{"private": true}' > /dev/null
    done

    echo "Tous les dépôts publics sont en privés."

elif [ "$user_input" = "2" ]; then
for repo in $repos
do
    echo "Passage en public du dépôt: $repo"
    curl -X PATCH -H "Authorization: token $TOKEN" -d '{"private": false}' "https://api.github.com/repos/$repo"
done

echo "Tous vos dépôts ont été rendus publics."

elif [ "$user_input" = "3" ]; then

echo "go away tanished !"


else
    echo "ERROR please enter a good variable number."
fi

#Copyright (C) DevEless corporation all right reserved