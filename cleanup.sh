. get_cred_endpoint.sh $1

http -a $credentials GET $endpoint/_data_stream | jq -r .data_streams[].indices[0:-1][].index_name > delete.txt

for i in $(cat delete.txt); do
    http -a $credentials DELETE $endpoint/$i    
done


