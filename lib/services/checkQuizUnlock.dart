import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';

class CheckQuizUnlock{
  static Future<bool> QuizUnlockStatus(String quiz_doc_id) async{
    late String UserID;
    bool unlocked = false;
    await LocalDB.getUserId().then((value) {
      UserID = value!;
    });
    await FirebaseFirestore.instance.collection("User").doc(UserID).collection("unlocked_quiz").doc(quiz_doc_id).get().then((value)  {
      if(value.data() != null){
        unlocked = true;
      }
    });
    return unlocked;
  }
}