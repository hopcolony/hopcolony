# Getting started

First of all, you need to create a new project at the [console](https://console.hopcolony.io). You can use a new hopcolony account or you can sign in with Google.

# How to use the backend

=== "Python"

    [![Pypi](https://img.shields.io/pypi/v/hopcolony?color=%2334D058&label=pypi%20package)](https://pypi.org/project/hopcolony)
    [![Test](https://github.com/hopcolony/python-hopcolony/workflows/Test/badge.svg)](https://github.com/hopcolony/python-hopcolony/actions?query=workflow%3ATest)

    <div class="termy">
    ```console
    $ pip install hopcolony

    ---> 100%
    ```
    </div>

=== "Asyncio Python"

    [![Pypi](https://img.shields.io/pypi/v/aiohopcolony?color=%2334D058&label=pypi%20package)](https://pypi.org/project/aiohopcolony)
    [![Test](https://github.com/hopcolony/python-aiohopcolony/workflows/Test/badge.svg)](https://github.com/hopcolony/python-aiohopcolony/actions?query=workflow%3ATest)

    <div class="termy">
    ```console
    $ pip install aiohopcolony

    ---> 100%
    ```
    </div>

=== "Flutter"

    |Init|Authentication|Documents|Drive|Topics|
    |---|---|---|---|---|
    |[![pub package](https://img.shields.io/pub/v/hop_init.svg)](https://pub.dev/packages/hop_init)|[![pub package](https://img.shields.io/pub/v/hop_auth.svg)](https://pub.dev/packages/hop_auth)|[![pub package](https://img.shields.io/pub/v/hop_doc.svg)](https://pub.dev/packages/hop_doc)|[![pub package](https://img.shields.io/pub/v/hop_drive.svg)](https://pub.dev/packages/hop_drive)|[![pub package](https://img.shields.io/pub/v/hop_topic.svg)](https://pub.dev/packages/hop_topic)|

    You will always need to add at least the hop_init package to your flutter project in the `pubspec.yaml`:

    ```yaml
    dependencies:
        hop_init:
    ```

    Then, depending on the service you are willing to use, add the corresponding:

    ```yaml
    dependencies:
        hop_auth:
        hop_doc:
        hop_drive:
        hop_topic:
    ```