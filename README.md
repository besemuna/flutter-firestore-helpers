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
        "name" : "Black velvet cap",
        "quantity" : 2,
        "price": 9.99,
    }

    await firestoreService.setData(path : "shipping_addresses/${userId}", data : data);

    }

```
