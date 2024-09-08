# Step 2 - Adding A New Data Source
In this step we will set up a new **Splunk Data Source**.
This data source can then be queried and visualized using the Splunk Search Processing Language (SPL).

To add a new data source follow these steps:

1. In the top bar on the right, press `Settings`
2. In the `DATA` section press `Data inputs`
3. In `Local inputs` select the type called `Files & Directories`
4. In the top right press `New Local File & Directory`
5. Click `Browse` next to `File or Directory`
6. Select `mnt` > `data`
7. Press `Next` on the top
8. Make sure `_json` is selected as `Source type`
    - For this in the `Source type` select `Select`
    - In `Select Source Type` filter for `_json` and select it
9. In `App context` select the following:
    - `App Context`: `Search & Reporting (search)`
10. In `Host` select the following:
    - `Constant Value`
    - `Host field value`: `demo-data`
11. In `Index` select the following:
    - `Index`: `Default`
12. Press `Review` on the top
13. The `Review` should now look like this:
    ```
    Input Type      Directory Monitor
    Source Path     /mnt/data
    Includelist     N/A
    Excludelist     N/A
    Source Type     _json
    App Context     search
    Host            demo-data
    Index           default
    ```
14. Press `Submit` on the top

After we now added a new data source we can actually use Splunk now to extract the information out of the data.

<img src="../img/step2.png">
