# Step 7 - An Alert
When handling data it makes sense to be able to do anomaly detection.
In Splunk one can use `Alerts` to get notified when there is an anomaly.

To create an real-time alert follow the following steps: 
1. Click on `Search` in the top bar
2. Create a search, e.g. to find all builds with an error status:
```
source="/mnt/data/*" build_status="error"
```
3. Press `Save As` and select `Alert`
4. Enter a title, e.g. `Build Error`
5. As permissions select `Shared in App`
6. As alert type select `Real-time`
7. As `Trigger alert` select `Per-Result`
8. There are multiple `Trigger Actions` available
    - Select `Add to Triggered Alerts` and select `High` as Severity
    - Also select `Log Event` and put "Build Error Alert" as the `Event`-text and put `build_error_alert` as `Sourcetype`
9. Click Save.

<img src="../img/steps7-8.png">
