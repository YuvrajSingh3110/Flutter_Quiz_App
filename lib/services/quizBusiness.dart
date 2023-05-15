import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/services/localdb.dart';

class quizBusiness{
  static buyQuiz({required int quizPrice, required String quizId}) async{
    String? userId = "";
    bool enoughMoney = false;
    await LocalDB.getUserId().then((value) => {
      userId = value
    });
    FirebaseFirestore.instance.collection("User").doc(userId).get().then((user) => {
      enoughMoney = quizPrice <= int.parse(user.data()!["money"])
    });

    if(enoughMoney){
      await FirebaseFirestore.instance.collection("User").doc(userId).collection("unlocked_quiz").doc(quizId).set(
        {"unlocked_at" : DateTime.now()}
      );
      print("QUIZ IS UNLOCKED");
    }else{
      print("YOU BROKE MY BOY!!");
    }
  }
}