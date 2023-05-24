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
        "money": "0",
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "rank": "NA",
        "level": "0"
      }).then((value) async {
        await LocalDB.saveLevel("0");
        await LocalDB.saveMoney("0");
        await LocalDB.saveRank("NA");
        print("User Registered Successfully");
      });
    }
  }

  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;
    String user = "";

    await FirebaseFirestore.instance
        .collection("User")
        .doc(current_user!.uid)
        .get()
        .then((value) async {
      user = value.data().toString();
      print(user);
      await LocalDB.saveMoney("999989");
      await LocalDB.saveRank("444");
      await LocalDB.saveLevel("45");
    });
    if (user.toString() == "null") {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(current_user!.uid)
          .get()
          .then((value) async {
        user = value.data().toString();
        print(user);
        await LocalDB.saveMoney(value["money"]);
        await LocalDB.saveRank(value["rank"]);
        await LocalDB.saveLevel(value["level"]);
      });
      return true;
    }
  }

  static getMoney(String amount) async {
    if (amount != "2500") {
      final FirebaseAuth _myauth = FirebaseAuth.instance;
      await FirebaseFirestore.instance
          .collection("User")
          .doc(_myauth.currentUser?.uid)
          .get()
          .then((value) async {
        await LocalDB.saveMoney(
            (int.parse(value.data()!["money"]) + int.parse(amount)).toString());
        await FirebaseFirestore.instance
            .collection("User")
            .doc(_myauth.currentUser?.uid)
            .update({
          "money":
              (int.parse(value.data()!["money"]) + int.parse(amount)).toString()
        });
      });
    }
  }
}
