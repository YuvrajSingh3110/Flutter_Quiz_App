import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';

class quizBusiness{
  static Future<bool> buyQuiz({required int quizPrice, required String quizId}) async{
    late String? userId;
    bool enoughMoney = false;
    await LocalDB.getUserId().then((uID) {
      userId = uID;
    });
    await FirebaseFirestore.instance.collection("User").doc(userId).get().then((user) {
      if(quizPrice <= int.parse(user.data()!["money"])){
        enoughMoney = true;
      }
    });

    if(enoughMoney){
      await FirebaseFirestore.instance.collection("User").doc(userId).collection("unlocked_quiz").doc(quizId).set(
        {"unlocked_at" : DateTime.now()}
      );
      print("QUIZ IS UNLOCKED");
      return true;
    }else{
      print("YOU BROKE MY BOY!!");
      return false;
    }
  }
}