# Getting Started

## Creating the client

=== "Python"

    ``` Python
    import hopcolony
    from hopcolony import docs

    hopcolony.initialize()
    client = docs.client()
    ```

=== "Asyncio Python"

    ```Python
    import aiohopcolony
    from aiohopcolony import docs
    import asyncio

    async def main():
        await aiohopcolony.initialize()
        client = docs.client()
    
    asyncio.run(main())
    ```

=== "Flutter"

    ```Dart
    import 'package:hop_doc/hop_doc.dart';

    final HopDoc client = HopDoc.instance;
    ```

    `initialize` has been called before, that's why we can use the HopDoc client wherever in the app and the credentials will be resolved.

## Getting the existing indices in the database

=== "Python"
    ``` Python
    indices = client.get()

    print(type(indices))
    # List<Index>

    for index in indices:
        print(index.name) # name of the index
        print(index.num_docs) # number of documents inside the index
    ```

=== "Asyncio Python"
    ``` Python
    indices = await client.get()

    print(type(indices))
    # List<Index>

    for index in indices:
        print(index.name) # name of the index
        print(index.num_docs) # number of documents inside the index
    ```

    <details markdown="1">
    <summary>Remember to run this in a coroutine...</summary>

    Async-await keywords can only be used inside asyncio coroutines.

    </details>

=== "Flutter"
    ```Dart

    List<Index> indices = await client.get();
    for (Index index : indices) {
        print(index.name); // name of the index
        print(index.numDocs); // number of documents inside the index
    }
    ```

## Counting the number of documents in an index

=== "Python"

    ``` Python
    count = client.index("my-index").count

    print(type(count))
    # int
    ```

=== "Asyncio Python"

    ``` Python
    count = await client.index("my-index").count

    print(type(count))
    # int
    ```

=== "Flutter"

    ```Dart
    int count = await client.index("my-index").count;
    ```
    
## Getting all the documents in an index

=== "Python"

    ``` Python
    snapshot = client.index("my-index").get()

    print(type(snapshot))
    # IndexSnapshot

    if snapshot.success:
        docs = snapshot.docs

        print(type(docs))
        # List<Document>

        for doc in docs:
            print(doc.source) # dictionary with the document source (json)
            print(doc.index) # index name, in this case "my-index"
            print(doc.id) # Document uuid
            print(doc.version) # Document version: how many times it has been updated
    else:
        print(snapshot.reason) # Reason why the retrieval failed
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").get()

    print(type(snapshot))
    # IndexSnapshot

    if snapshot.success:
        docs = snapshot.docs

        print(type(docs))
        # List<Document>

        for doc in docs:
            print(doc.source) # dictionary with the document source (json)
            print(doc.index) # index name, in this case "my-index"
            print(doc.id) # Document uuid
            print(doc.version) # Document version: how many times it has been updated
    else:
        print(snapshot.reason) # Reason why the retrieval failed
    ```

=== "Flutter"

    ```Dart

    IndexSnapshot snapshot = await client.index("my-index").get();
    if (snapshot.success) {
        List<Document> docs = snapshot.docs;

        for(Document doc : docs) {
            print(doc.source); // dictionary with the document source (json)
            print(doc.index); // index name, in this case "my-index"
            print(doc.id); // Document uuid
            print(doc.version); // Document version: how many times it has been updated
        }
    } else {
        print(snapshot.reason); // Reason why the retrieval failed
    }
    ```

    !!! Tip

        Sometimes you don't want to retrieve the document sources because of latency or bandwidth. In that cases, you can get only the uuids of the documents by adding the `onlyIds` argument to get:

        ```Dart
        IndexSnapshot snapshot = await client.index("my-index").get(onlyIds: true);
        ```

        Of cource, do not try to access the source of the `Document` because it will be null. 


## Getting a specific document

=== "Python"

    ``` Python
    snapshot = client.index("my-index").document("my-document-uuid").get()

    print(type(snapshot))
    # DocumentSnapshot

    if snapshot.success:
        doc = snapshot.doc

        print(type(doc))
        # Document

        print(doc.source) # dictionary with the document source (json)
        print(doc.index) # index name, in this case "my-index"
        print(doc.id) # Document uuid
        print(doc.version) # Document version: how many times it has been updated
    else:
        print(snapshot.reason) # Reason why the retrieval failed
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").document("my-document-uuid").get()

    print(type(snapshot))
    # DocumentSnapshot

    if snapshot.success:
        doc = snapshot.doc

        print(type(doc))
        # Document

        print(doc.source) # dictionary with the document source (json)
        print(doc.index) # index name, in this case "my-index"
        print(doc.id) # Document uuid
        print(doc.version) # Document version: how many times it has been updated
    else:
        print(snapshot.reason) # Reason why the retrieval failed
    ```

=== "Flutter"

    ```Dart

    DocumentSnapshot snapshot = await client.index("my-index").document("my-document-uuid").get();
    if (snapshot.success) {
        Document doc = snapshot.doc;

        print(doc.source); // dictionary with the document source (json)
        print(doc.index); // index name, in this case "my-index"
        print(doc.id); // Document uuid
        print(doc.version); // Document version: how many times it has been updated
    } else {
        print(snapshot.reason); // Reason why the retrieval failed
    }
    ```

## Filtering the documents

=== "Python"

    ``` Python
    snapshot = client.index("my-index").where("document-field", isEqualTo="desired-value").get()

    print(type(snapshot))
    # IndexSnapshot

    # For numeric fields
    snapshot = client.index("my-index").where("document-field", isGreaterThan=10).get()
    snapshot = client.index("my-index").where("document-field", isGreaterThanOrEqualTo=10).get()
    snapshot = client.index("my-index").where("document-field", isLessThan=10).get()
    snapshot = client.index("my-index").where("document-field", isLessThanOrEqualTo=10).get()
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").where("document-field", isEqualTo="desired-value").get()

    print(type(snapshot))
    # IndexSnapshot

    # For numeric fields
    snapshot = await client.index("my-index").where("document-field", isGreaterThan=10).get()
    snapshot = await client.index("my-index").where("document-field", isGreaterThanOrEqualTo=10).get()
    snapshot = await client.index("my-index").where("document-field", isLessThan=10).get()
    snapshot = await client.index("my-index").where("document-field", isLessThanOrEqualTo=10).get()
    ```

=== "Flutter"

    ```Dart

    IndexSnapshot snapshot = await client.index("my-index").where("document-field", isEqualTo: "desired-value").get();
    
    // For numeric fields
    IndexSnapshot snapshot = await client.index("my-index").where("document-field", isGreaterThan: 10).get();
    IndexSnapshot snapshot = await client.index("my-index").where("document-field", isGreaterThanOrEqualTo: 10).get();
    IndexSnapshot snapshot = await client.index("my-index").where("document-field", isLessThan: 10).get();
    IndexSnapshot snapshot = await client.index("my-index").where("document-field", isLessThanOrEqualTo: 10).get();

    // For geo fields
    // Get the document's from 'my-index' whose geo-field 'document-field' is 
    // inside the circle with the specified center and radius
    IndexSnapshot snapshot = await instance
        .index("my-index")
        .withinRadius(
            center: GeoPoint(latitude: 1.234, longitude: -1.234),
            radius: "1km",
            field: "document-field")
        .get();

    // Get the document's from 'my-index' whose geo-field 'document-field' is 
    // inside the rectangle formed by topLeft and bottomRight 
    IndexSnapshot snapshot = await client
        .index("my-index")
        .withinBox(
            topLeft: GeoPoint(latitude: 1.234, longitude: -1.234),
            bottomRight: GeoPoint(latitude: 1.567, longitude: -1.567),
            field: "document-field")
        .get();
    ```

## Limiting the documents

=== "Python"

    ``` Python
    snapshot = client.index("my-index").get(size=200)

    print(type(snapshot))
    # IndexSnapshot
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").get(size=200)

    print(type(snapshot))
    # IndexSnapshot
    ```

=== "Flutter"

    ```Dart
    IndexSnapshot snapshot = await client.index("my-index").get(size: 200);
    // or
    IndexSnapshot snapshot = await client.index("my-index").limit(200).get();
    ```

## Adding a document to an index with a random id

=== "Python"

    ``` Python
    snapshot = client.index("my-index").add({
        "field-1": "value-1",
        "field-2": "value-2"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").add({
        "field-1": "value-1",
        "field-2": "value-2"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Flutter"

    ```Dart
    DocumentSnapshot snapshot = await client.index("my-index").add({
        "field-1": "value-1",
        "field-2": "value-2"
    });
    ```

## Adding a document to an index with a specific id

=== "Python"

    ``` Python
    snapshot = client.index("my-index").document("desired-id").setData({
        "field-1": "value-1",
        "field-2": "value-2"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").document("desired-id").setData({
        "field-1": "value-1",
        "field-2": "value-2"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Flutter"

    ```Dart
    DocumentSnapshot snapshot = await client.index("my-index").document("desired-id").setData({
        "field-1": "value-1",
        "field-2": "value-2"
    });
    ```

## Updating a document

=== "Python"

    ``` Python
    snapshot = client.index("my-index").document("desired-id").update({
        "field-to-update": "value"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").document("desired-id").update({
        "field-to-update": "value"
    })

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Flutter"

    ```Dart
    DocumentSnapshot snapshot = await client.index("my-index").document("desired-id").update({
        "field-to-update": "value"
    });
    ```

!!! note
    Difference between setData and update:

    - setData will create the document if it does not exist. If it exists, it will overwite all the data. This means that all the other fields will be lost.
    - update will fail if the document does not exist. If it exists, it will only update the desired field, leaving the rest as they were.


## Deleting a document

=== "Python"

    ``` Python
    snapshot = client.index("my-index").document("desired-id").delete()

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Asyncio Python"

    ``` Python
    snapshot = await client.index("my-index").document("desired-id").delete()

    print(type(snapshot))
    # DocumentSnapshot
    ```

=== "Flutter"

    ```Dart
    DocumentSnapshot snapshot = await client.index("my-index").document("desired-id").delete();
    ```

## Deleting an index

=== "Python"

    ``` Python
    result = client.index("my-index").delete()

    print(type(result))
    # bool
    ```

=== "Asyncio Python"

    ``` Python
    result = await client.index("my-index").delete()

    print(type(result))
    # bool
    ```

=== "Flutter"

    ```Dart
    bool result = await client.index("my-index").delete();
    ```

## Creating widgets from requests (specific for flutter)

Sometimes it comes handy to create a widget directly from the client's request:

=== "from Index"

    ```Dart
    class Example extends StatelessWidget {
        final instance = HopDoc.instance;

        @override
        Widget build(BuildContext context) {
            return instance.index("my-index").getWidget(onData: (List<Document> docs) {
                    return Column(
                        children: docs.map((Document e) => Text(e.source.toString())).toList(),
                    );
                }, onError: (String reason) {
                    return Text(reason);
                }, onLoading: () {
                    return CircularProgressIndicator();
                });
        }
    }
    ```

=== "from Document"

    ```Dart
    class Example extends StatelessWidget {
        final instance = HopDoc.instance;

        @override
        Widget build(BuildContext context) {
            return instance.index("my-index").document("my-document").getWidget(onData: (Document doc) {
                    return Text(doc.source);
                }, onError: (String reason) {
                    return Text(reason);
                }, onLoading: () {
                    return CircularProgressIndicator();
                });
        }
    }
    ```

<details markdown="1">
<summary>The equivalent to the above using FutureBuilder...</summary>

The above examples are built internally using FutureBuilder:

```Dart
Widget getWidget({
    @required Widget Function(Document) onData,
    @required Widget Function(String) onError,
    @required Widget Function() onLoading,
  }) {
    return FutureBuilder<DocumentSnapshot>(
        future: get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.success) {
              return onData(snapshot.data.doc);
            } else {
              return onError(snapshot.data.reason);
            }
          }
          return onLoading();
        });
  }
```

</details>