# get the deployment id and name.
# ecctl deployment list  | jq -r '.deployments[] | .id, .name'

short_deploymnent_id=$(echo $1|  cut -b -6)

# echo $short_deploymnent_id

# credentials=$(find . -maxdepth 1 | grep --color=never $short_deploymnent_id)
credentials=$(find . -maxdepth 1 | grep --color=never $short_deploymnent_id | xargs grep -v username | sed -e s/\,/\:/ -e s/,true//)

echo $credentials



endpoint=$(ecctl deployment show $1 | jq -r '.resources.elasticsearch[0].info.metadata | (.endpoint + ":" +  (.ports.https|tostring))')

url="https://$endpoint"
echo $url
cat request.json | http -a $credentials GET $url/my-index-000004/_search
# cat request.json | http --quiet -a $credentials GET $url/my-index-000004/_search