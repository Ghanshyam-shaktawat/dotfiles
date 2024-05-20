#!/usr/bin/env bash

USER_URL='Ghanshyam-shaktawat' # Set the username or URL for the desired user

if [ -z "$USER_URL" ]; then
	echo "Please provide the username or URL!"
	exit 1
fi

REPOS=$(curl -sS -H "Accept: application/vnd.github.v3+json" \
	https://api.github.com/users/$USER_URL/repos?sort=updated)

jq '.[] | {name, html_url}' <<<"$REPOS"
