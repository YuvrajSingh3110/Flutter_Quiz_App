import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire{
  static Future<List<Map<String, dynamic>>> getQuizzes() async{
    List<Map<String, dynamic>> all_quiz = [];
    await FirebaseFirestore.instance.collection("Quizzes").get().then((querySnapshot)  {
      for (var quiz in querySnapshot.docs) {
        Map<String, dynamic> myQuiz = quiz.data();
        myQuiz["quiz_id"] = quiz.reference.id;
        print(quiz.data());
        all_quiz.add(myQuiz);
      }
    });
    return all_quiz;
  }
}