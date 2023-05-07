curl -sSL https://www.gstatic.com/ipranges/cloud.json -o ./tmp/gce.json
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("us"), startswith("northamerica")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterna
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("southamerica")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacentersa
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("europe")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacentereu
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-south")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterin
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-southeast")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterse
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-east1")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacentertw
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-east2")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterhk
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-northeast1"),startswith("asia-northeast2")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterjp
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("asia-northeast3")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterkr
cat ./tmp/gce.json | jq --raw-output '.prefixes[] | select(.scope | startswith("australia")) |.ipv4Prefix,.ipv6Prefix | select(. != null)' >> data/datacenterau

curl -sSL https://www.gstatic.com/ipranges/goog.json -o ./tmp/google.json
cat ./tmp/google.json | jq --raw-output '.prefixes[].ipv4Prefix,.prefixes[].ipv6Prefix | select(. != null)' >> data/anycastgoogle

curl -sSL https://ip-ranges.amazonaws.com/ip-ranges.json -o ./tmp/aws.json
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("us"), startswith("ca")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterna
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("sa")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacentersa
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("eu")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacentereu
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-south")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterin
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-southeast")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterse
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-east-1")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterhk
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-northeast-2"),startswith("ap-northeast-1")) | select( .network_border_group | endswith("ap-northeast-2"),endswith("ap-northeast-1")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterjp
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-northeast-3")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacenterkr
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("ap-northeast-1")) | select( .network_border_group | startswith("ap-northeast-1-tpe"))| .ip_prefix,.ipv6_prefix | select(. != null)' >> data/datacentertw
cat ./tmp/aws.json | jq --raw-output '.prefixes[],.ipv6_prefixes[] | select(.region | startswith("GLOBAL")) | .ip_prefix,.ipv6_prefix | select(. != null)' >> data/anycastamazon

curl -sSL https://download.microsoft.com/download/7/1/D/71D86715-5596-4529-9B13-DA13A5DE5B63/ServiceTags_Public_20230501.json -o ./tmp/azure.json
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("us"),contains("canada")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterna
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("brazil")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentersa
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("europe")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("france")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("uk")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("germany")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("norway")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("switzerland")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentereu
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("india")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterin
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("southeastasia")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterse
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | startswith("eastasia")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterhk
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | startswith("japan")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterjp
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | startswith("korea")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterkr
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | startswith("taiwan")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacentertw
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.properties.region | contains("australia")) | .properties.addressPrefixes[] | select(. != null)' >> data/datacenterau
cat ./tmp/azure.json | jq --raw-output '.values[] | select(.name | contains("Front")) | .properties.addressPrefixes[] | select(. != null)' >> data/anycastazure

curl -sSL https://raw.githubusercontent.com/SecOps-Institute/Akamai-ASN-and-IPs-List/master/akamai_ip_cidr_blocks.lst -o ./data/akamai

