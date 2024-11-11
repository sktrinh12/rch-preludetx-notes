#!/bin/bash

current_date=$(date +"%Y-%m-%d")
next_date=$(date -d "$current_date +1 day" +"%Y-%m-%d")
formatted_date=$(date +"%d %b %Y" | sed 's/\b\(.\)/\u\1/g' )
new_file="notes_${current_date}.md"

day_number=$(find . -type f -name 'notes_*.md' | wc -l)
next_day=$((day_number + 1))

year=$(date +'%Y')
month=$(date +'%m')
day=$(LC_TIME=en_US.UTF-8 date +'%A')
mkdir -p "$year/$month"
new_file="./${year}/${month}/notes_${current_date}.md"
previous_day_file=$(ls ./${year}/${month}/notes_*.md | tail -n 1 | xargs -n 1 basename)

cat <<EOF > $new_file
[Home](../../main.md) | [Prev: Day $day_number](${previous_day_file}) | [Next: Day $((next_day + 1))](./notes_${next_date}.md)

## 📝 Day $next_day, $day - \`notes_${current_date}.md\`

EOF

summary_file="$year/${month}_${year}.md"
echo "Created $new_file with the header."

echo "- 📝[Day ${next_day}: $formatted_date](./${month}/notes_${current_date}.md) \`notes_$current_date\`" >> $summary_file

echo "Updated $summary_file with a link to $new_file."
