#!/bin/bash

# Get the current UNIX timestamp
current_time=$(date +%s)

# Go back 10 hours (3600 seconds in an hour)
start_time=$((current_time - 10 * 3600))

# Loop over each hour from 10 hours ago until now
for ((time=$start_time; time<=current_time; time+=3600)); do
  # Generate a random number between 50 and 1000
  random_count=$((RANDOM % 951 + 50))

  # Call the generate-data.sh script for the random number of times
  for ((i=0; i<random_count; i++)); do
    /home/infra/generate-data.sh -t $time > /dev/null
  done
done
