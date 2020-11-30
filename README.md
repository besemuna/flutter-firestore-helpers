# Flutter Firestore Helpers

Helpful `firebase` cloud `firestore` helpers for `flutter`

#### Configuration
Make sure to import the `helper` class and `initialize` it.

```dart
    import './FirestoreHelper';

    final firestoreService = FirestoreHelper();
```

#### SetData
```dart
    updateShippingAddress() async {
        final userId = "xxxx";

        final Map<String, dynamic> data = {
            "user_id" : userId,
            "name" : "23 Prime Way Churchill House",
        }

        await firestoreService.setData(path : "shipping_addresses/${userId}", data : data);

    }

```

#### addDocument
```dart
    addShippingAddress() async {
        final userId = "xxxx";

        final Map<String, dynamic> data = {
            "user_id" : userId,
            "name" : "1 Applewood Ave Spruce Tree Cottage",
        }

        await firestoreService.addDocument(path : "shipping_addresses", data : data);

    }

```

#### getData
```dart
    getShippingAddress() async {
        final shippingAddressId = "xxxx";
        final shippingAddress = await firestoreService.getData("shipping_addresses/${shippingAddressId}");
    }

```

#### deleteData
```dart
    deleteShippingAddress() async {
        final shippingAddressId = "xxxx";
        final shippingAddress = await firestoreService.deleteData("shipping_addresses/${shippingAddressId}");
    }

```

#### getDataCollection
```dart
    class ShippingAddress {
        final id;
        final userId;
        final name;

        factory ShippingAddress.fromMap({
            Map<String, dynamic> data,
            String documentId,
        }) {
            return ShippingAddress(
                id : documentId,
                userId: data["user_id"],
                name: data["name"]
            );
        }
    }

    getShippingAddresses() async {
        final user_id = "xxxx";
        final builder = (Map<String, dynamic> data, String documentID, DocumentSnapshot snapshot) => ShippingAddress.fromMap(documentId : documentID, data : snapshot.data);

        final shippingAddresses = await firestoreService.getDataCollection(path :"shipping_addresses", builder : builder);
    }

```
