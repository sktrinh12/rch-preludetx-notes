#!/bin/bash
PARENT_DIR="."

find "$PARENT_DIR" -type f -name "notes_2024*.md" | while read -r file; do
    filename=$(basename "$file")
    date_str=${filename:6:10} # Extracts 'YYYY-MM-DD'
    
    day_of_week=$(LC_TIME=en_US.UTF-8 date -d "$date_str" +%A)
    third_line=$(sed -n '3p' "$file")
    
    if [[ "$third_line" == "## 📝 Day"* ]]; then
        day_number=$(echo "$third_line" | grep -o 'Day [0-9]*')
        new_third_line="## 📝 $day_number, $day_of_week - \`$filename\`"
        
        sed -i "3s/.*/$new_third_line/" "$file"
        
        echo "Updated $file"
    else
        echo "Skipping $file: third line doesn't match expected format"
    fi
done
