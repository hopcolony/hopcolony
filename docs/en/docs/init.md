# Initialize

You will need to initialize your app via some credentials you can get from the [console](https://console.hopcolony.io).

## Hardcoding the credentials

=== "Python"

    ``` Python
    import hopcolony

    hopcolony.initialize(username="your-user-name", project="your-project", token="your-project-token")
    ```

=== "Asyncio Python"

    ```Python
    import aiohopcolony
    import asyncio

    async def main():
        await aiohopcolony.initialize(username="your-user-name", project="your-project", token="your-project-token")
    
    asyncio.run(main())
    ```

    <details markdown="1">
    <summary>About the command <code>asyncio.run(main())</code>...</summary>

    Whenever we want to use aiohopcolony, we need to do it inside a coroutine.
    
    In this example, we create a new coroutine called main and run it using asyncio.

    </details>

=== "Flutter"

    ```Dart
    import 'package:hop_init/hop_init.dart' as init;

    void main() async {
        await init.initialize(
            username: "your-user-name",
            project: "your-project",
            token: "your-project-token");

        runApp(MyApp());
    }
    ```

    <details markdown="1">
    <summary>Always run <code>init.initialize</code> before running the app...</summary>

    Once the app starts with the call <code>runApp</code>, all the hopcolony instances you define will access the init package. Therefore, it is important that <code>hop_init</code> knows about the credentials before the app starts. 

    </details>

## Using a file

The file you need to have the following syntax:

```yaml
username: your-user-name
project: your-project
token: your-project-token
```

=== "Python"
    Place the config file with the name `.hop.config` in the directory where you are running the script:


    ``` Python
    import hopcolony

    hopcolony.initialize()
    ```

    You can also have the config file in another location and with another name and reference it running:

    ``` Python
    import hopcolony

    hopcolony.initialize(config_file="~/hop-credentials/config")
    ```

=== "Asyncio Python"

    Place the config file with the name `.hop.config` in the directory where you are running the script:

    ```Python
    import aiohopcolony
    import asyncio

    async def main():
        await aiohopcolony.initialize()
    
    asyncio.run(main())
    ```

    You can also have the config file in another location and with another name and reference it running:

    ```Python
    import aiohopcolony
    import asyncio

    async def main():
        await aiohopcolony.initialize(config_file="~/hop-credentials/config")
    
    asyncio.run(main())
    ```

=== "Flutter"

    Place the config file with the name `.hop.config` in the root of your app (at the level of the `pubspec.yaml`). Then add this file to the assets of your appplication:

    ```yaml
    flutter:
        ...
        assets:
        - .hop.config
    ```

    Then, you can just call `init.initialize` without any argument:

    ```Dart
    import 'package:hop_init/hop_init.dart' as init;

    void main() async {
        await init.initialize();

        runApp(MyApp());
    }
    ```

    <details markdown="1">
    <summary>About waiting the <code>initialize</code> again...</summary>

    Now it becomes more evident why we need to await the initialization before starting the app: we need to read a file from memory, which is an asynchronous operation.

    </details>

!!! tip
    Try to use the file method and add it to `.gitignore` if you don't want to expose the credentials in your git repo.