import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_final/data/models/todo.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collection; // Used for specific collection path
  CollectionReference _collectionReference;

  Database(this.collection) {
    _collectionReference = _firestore.collection(collection);
  }
  Future<QuerySnapshot> getDataCollection() {
    return _collectionReference.get();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return _collectionReference.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _collectionReference.doc(id).get();
  }

  Future<void> removeDocument(String id) {
    return _collectionReference.doc(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return _collectionReference.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return _collectionReference.doc(id).update(data);
  }
}
