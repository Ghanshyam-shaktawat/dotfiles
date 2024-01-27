function pipup --description 'Update all pip packages'
    pip list --outdated --format=json | jq -r '.[] | .name+"="+.latest_version'
end
