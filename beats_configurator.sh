short_deploymnent_id=$(echo $1 | cut -b -6)

auth=$(find . | grep --color=never $short_deploymnent_id | xargs grep -v username | sed -e s/\,/\:/ -e s/,true// | tr -d ' ')
cloud_id=$(ecctl deployment list  | jq --arg v "$1" -r '.deployments[] | select (.id == $v)  | .resources[0].cloud_id')

yq eval --null-input  "(.monitoring.enabled = "true") | (.monitoring.cloud.id = \"$cloud_id\") | (.monitoring.cloud.auth = \"$auth\") | (.cloud.id = \"$cloud_id\") | (.cloud.auth = \"$auth\") | (.. style=\"double\")"