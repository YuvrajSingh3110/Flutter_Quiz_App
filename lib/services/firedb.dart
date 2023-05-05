import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'localdb.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? currentUser = _auth.currentUser;
    if (await getUser()) {
      print("User Already Exists");
    } else {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(currentUser!.uid)
          .set({
        "money": 6969699,
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
      }).then((value) async{
        await LocalDB.saveLevel("0");
        await LocalDB.saveMoney("6969699");
        await LocalDB.saveRank("-");
        print("User Registered Successfully");
      });
    }
  }

  Future<bool> getUser() async{
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance.collection("User").doc(current_user!.uid).get().then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveMoney("999989");
      await LocalDB.saveRank("444");
      await LocalDB.saveLevel("45");
    });
    if(user.toString() == "null"){
      return false;
    }else{
      return true;
    }
  }
}
