# Step 1 - Setting Up the Environment
Execute the following command to set up the environment:
```
/home/infra/setup.sh
```{{exec}}

This will generate demo data as well as set up a `cronjob` which will generate more random data each minute which we can later use for our dashboards.
It will also pull and start `Splunk v9.3.0` in a `Docker` container.

After the command spinned up the Docker you can access Splunk using [this link]({{TRAFFIC_HOST1_8000}}) and log in with the following credentials:
- `Admin`
- `time2work`

<img src="../img/step1.png">
