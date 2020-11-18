class FirestoreHelper {
  final _firestore;

  Future<void> setData({String path, Map<String, dynamic> data}) async {
    await _firestore.doc(path).set(data, SetOptions(merge: true));
  }
}
