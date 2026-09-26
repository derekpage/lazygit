date=$(date)
time=$(git remote get-url origin | grep -o "[0-9]\+[ap]m$")
if [[ -n "$time" ]]; then
	message="$(date -d "$date" "+%a %b %d") $time Lab: Commit at $((($(date -d "$date" +%s)-$(date -d $time +%s))/60)) minutes"
else
	message="Commit at $(date)"
fi
git add .
git commit -m "$message"
git push