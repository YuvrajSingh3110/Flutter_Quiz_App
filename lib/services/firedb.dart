import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quiz_app/services/auth.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? currentUser = _auth.currentUser;
    if (await getUser()) {
      print("User Already Exists");
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser!.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "coins": 50000
      }).then((value) => {print("User Registered Successfully")});
    }
  }
}
