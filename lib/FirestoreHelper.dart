import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  final _firestore = FirebaseFirestore.instance;

  Future<void> setData({String path, Map<String, dynamic> data}) async {
    await _firestore.doc(path).set(data, SetOptions(merge: true));
  }

  Future<DocumentReference> addDocument({
    String path,
    Map<String, dynamic> data,
  }) async {
    final reference = _firestore.collection(path);
    return reference.add(data);
  }

  Future<DocumentSnapshot> getData(String path) async {
    return await _firestore.doc(path).get();
  }

  Future<List<T>> getDataCollection<T>({
    String path,
    T builder({
      Map<String, dynamic> data,
      String documentID,
      DocumentSnapshot snapshot,
    }),
    Query queryBuilder(CollectionReference query),
  }) async {
    Query query = _firestore.collection(path);

    return (await query.get())
        .docs
        .map((snapshot) => builder(
            data: snapshot.data(), documentID: snapshot.id, snapshot: snapshot))
        .toList();
  }
}
