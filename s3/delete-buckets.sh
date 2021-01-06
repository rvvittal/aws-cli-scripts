buckets=($(aws2 s3api list-buckets --query 'Buckets[?starts_with(Name, `auth-at-edge-`) == `true`].Name' --output text))

# delete them
for b in ${buckets[@]}
do
  aws2 s3 rb --force s3://${b}
done
