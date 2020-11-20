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
}
