# get the deployment id and name.
# ecctl deployment list  | jq -r '.deployments[] | .id, .name'

short_deploymnent_id=$(echo $1|  cut -b -6)

# echo $short_deploymnent_id

# credentials=$(find . -maxdepth 1 | grep --color=never $short_deploymnent_id)
credentials=$(find . -maxdepth 1 | grep --color=never $short_deploymnent_id | xargs grep -v username | sed -e s/\,/\:/ -e s/,true//)

export credentials=$credentials
# echo $credentials
