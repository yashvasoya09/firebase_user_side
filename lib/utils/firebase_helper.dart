import 'package:cloud_firestore/cloud_firestore.dart';

class fireBase_Helper
{
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> readFireBaseData() {
    return firebaseFirestore.collection("ProductData").snapshots();
  }
}