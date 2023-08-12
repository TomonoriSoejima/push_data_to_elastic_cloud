short_deploymnent_id=$(echo $1 | cut -b -6)

credentials=$(find . -maxdepth 1 | grep --color=never $short_deploymnent_id | tail -1 | xargs grep -v username | sed -e s/\,/\:/ -e s/,true//)
export credentials=$credentials

endpoint=$(ecctl deployment show $1 --output json | jq -r '.resources.elasticsearch[0].info.metadata | (.endpoint + ":" +  (.ports.https|tostring))')
export endpoint=https://$endpoint

