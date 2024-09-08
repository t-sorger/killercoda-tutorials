#!/bin/bash

RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
MAGENTA='\033[35m'
NC='\033[0m'

echo -e "${YELLOW}$(date) - Running this script might take some time. Please wait...${NC}" | tee -a /home/infra/infra-setup.log
echo -e "${YELLOW}$(date) - In case you experience issues, the log data can be found at ${MAGENTA}'/home/infra/infra-setup.log'.${NC}" | tee -a /home/infra/infra-setup.log

echo -e "${YELLOW}$(date) - Generating demo data...${NC}" | tee -a /home/infra/infra-setup.log
/home/infra/set-up-data.sh
echo -e "${GREEN}$(date) - Demo data created.${NC}" | tee -a /home/infra/infra-setup.log

# Define the cron schedule to generate data
CRON_SCHEDULE="* * * * *"
COMMAND="/home/infra/generate-data.sh"
echo -e "${YELLOW}$(date) - Creating cron job: $CRON_SCHEDULE $COMMAND${NC}" | tee -a  /home/infra/infra-setup.log

# Make the script executable (just in case)
chmod +x "$COMMAND"

# Add the cron job to the user's crontab
(crontab -l 2>/dev/null; echo "$CRON_SCHEDULE $COMMAND") | crontab -

# Confirmation message
echo -e "${GREEN}$(date) - Cron job created: $CRON_SCHEDULE $COMMAND${NC}" | tee -a  /home/infra/infra-setup.log

## Install and run Splunk

# Pull the required docker images with progress bars
echo -e "${BLUE}$(date) - Pulling Docker Image 'splunk/splunk:9.3.0'...${NC}" | tee -a /home/infra/infra-setup.log
docker pull splunk/splunk:9.3.0

# Run the splunk docker container
echo -e "${YELLOW}$(date) - Starting Splunk...${NC}" | tee -a /home/infra/infra-setup.log

# Run Splunk container
docker run -v /root/filesystem/home:/mnt -p 8000:8000 \
           -e "SPLUNK_PASSWORD=time2work" \
           -e "SPLUNK_START_ARGS=--accept-license" \
           -it splunk/splunk:9.3.0
