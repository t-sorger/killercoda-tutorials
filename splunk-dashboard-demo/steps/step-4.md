# Step 4 - Explore Splunk And The Data You Have
One simple metric is nice to have but there is even more information to extract.
But to add other metrics to the Dashboard you must know the data first.
Make yourself therefore a bit more familiar with the data you have.

To query the data press `Apps` in the top left and select `Search & Reporting`.

Here you can get familiar with the data we have uisng the `Splunk Search Processing Language (SPL)`.
For more information about SPL check out its [documentation](https://docs.splunk.com/Documentation/Splunk/9.3.0/SearchTutorial/Usethesearchlanguage).

To see all the data, yu can use the following query:
```
source="/mnt/*" sourcetype="_json"
```

<img src="../img/steps3-5.png">
