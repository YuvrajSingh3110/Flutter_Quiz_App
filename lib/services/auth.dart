import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'localdb.dart';
import 'firedb.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signInWithGoogle() async {
  //try {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final userCredential = await _auth.signInWithCredential(credential);

    final User? user = userCredential.user;

    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    await FireDB().createNewUser(user!.displayName.toString(),user.email.toString(), user.photoURL.toString(), user.uid.toString());
    await LocalDB.saveUserId(user.uid);
    await LocalDB.saveName(user.displayName.toString());
    await LocalDB.saveUrl(user.photoURL.toString());

    print(user);
  // } catch (e) {
  //   print("Error Occurred!");
  //   print(e);
  // }
}

// //if user exists already
// Future<bool> getUser() async{
//   final User? currentUser = _auth.currentUser;
//   String user = "";
//
//   await FirebaseFirestore.instance.collection("User").doc(currentUser!.uid).get().then((value) =>
//   {
//     user = value.data().toString()  //if user does not exists it returns null
//   });
//   if(user == "null"){
//     return false;
//   }
//   else {
//     return true;
//   }
// }

Future<String> signOut() async{
  await googleSignIn.signOut();
  await _auth.signOut();
  await LocalDB.saveUserId("null");
  return "SUCCESS";
}
