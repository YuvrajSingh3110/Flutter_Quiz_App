import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQuesCreator {
  static Future<Map> generateQuizQues(
      {required String quizID, required String quesMoney}) async {
    //var _random = Random();
    //var quesSerialNo;
    late Map quesData;
    await FirebaseFirestore.instance
        .collection("Quizzes")
        .doc(quizID)
        .collection("Question")
        .where("money",
            isEqualTo:
                quesMoney) //we are using where to get quizzes of only a particular price
        .get()
        .then((value) {
              //quesSerialNo = _random.nextInt(50),
              //print(quesSerialNo),
              quesData = value.docs.elementAt(0).data();
            });
    print(quesData);
    return quesData;
  }
}
