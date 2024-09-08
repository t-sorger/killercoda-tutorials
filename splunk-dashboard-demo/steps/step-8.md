# Step 8 - Trigger The Alert
To test the alert we have two possibilities:
1. Either we wait some time until a new `error` build status appears, or
2. We excecute a prepared script that will trigger the alert.

To execute the prepared scrip you can use the following command:
```
/home/infra/trigger-alert.sh
```{{exec}}

To check if the alert got triggered click in the top bar on `Activity` and press `Triggered Alerts`.
Or, as we prepared our previous more complex dashbord for this, you can see the alert in there as well. Go and check it out!

<img src="../img/steps7-8.png">
