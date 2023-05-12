import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire{
  static Future<List<Map<String, dynamic>>> getQuizzes() async{
    List<Map<String, dynamic>> all_quiz = [];
    await FirebaseFirestore.instance.collection("Quizzes").get().then((querySnapshot) => {
      querySnapshot.docs.forEach((quiz) {
        Map<String, dynamic> myQuiz = quiz.data();
        myQuiz["QuizID"] = quiz.reference.id;
        print(quiz.data());
        all_quiz.add(myQuiz);
      })
    });
    return all_quiz;
  }
}