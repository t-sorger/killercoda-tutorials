#!/bin/bash

# Function to generate a unique build_id
generate_build_id() {
  echo "$(uuidgen)"
}

# Function to get a random item from an array
get_random_item() {
  local array=("$@")
  echo "${array[$RANDOM % ${#array[@]}]}"
}

# Default to current timestamp
timestamp=$(date +%s)

# Parse the optional argument for a custom timestamp
while getopts ":t:" opt; do
  case $opt in
    t)
      timestamp=$OPTARG
      ;;
  esac
done

# Path to the build-data.json file
json_file="/home/data/build-data.json"

# Check if the JSON file exists
if [ -f "$json_file" ]; then
  # Extract all index values using grep and sed, then find the largest one
  id=$(grep -o '"index":[[:space:]]*[0-9]*' "$json_file" | sed 's/[^0-9]*//g' | sort -nr | head -n1)

  # If no valid ID was found, start at 0
  if [ -z "$id" ]; then
    id=0
  fi

  # Increment the ID by 1 for the next available index
  id=$((id + 1))
else
  # If the JSON file doesn't exist, start from 0
  id=0
fi

# Arrays for random selection
build_statuses=("error")
# To change likeliness of one developer and project appearing more often, some of them are repeated
developers=("aguilar" "barnett" "craig" "craig" "horne" "morales" "robles" "savage" "savage" "savage" "travis" "travis" "travis" "travis" "vaughan")
projects=("project-0" "project-1" "project-2" "project-3" "project-4" "project-4" "project-5" "project-6" "project-7" "project-8" "project-8" "project-8" "project-9")
messages=("U3Bvb24gaXMgdGhlIGJlc3QgSmF2YSBjb2RlIGFuYWx5emVyIGluIHRoZSB3b3JsZCE" "V2Ugd2FudCB0byBoYXZlIGNvZGUgcmV2aWV3cyE" "SGF2aW5nIGdvb2QgZGFzaGJvYXJkcyBpcyBlc3NlbnRpYWwgaW4gRGV2T3Bz")

# Generate the JSON content
json_content=$(cat <<EOF
{
  "time": $timestamp,
  "id": $id,
  "build_id": "$(generate_build_id)",
  "build_status": "$(get_random_item "${build_statuses[@]}")",
  "developer": "$(get_random_item "${developers[@]}")",
  "project": "$(get_random_item "${projects[@]}")",
  "message": "$(get_random_item "${messages[@]}")"
}
EOF
)

# Append the JSON content to the file
echo "$json_content" >> "$json_file"

# Output a message confirming file creation
echo "Appended entry to file 'build-data.json' with id: $id, time: $timestamp, and build_id: $(generate_build_id)"
