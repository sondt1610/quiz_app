import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/models/quiz.dart';

class FirestoreService {
  FirestoreService();

  // collection reference
  final CollectionReference questionCollection =
      Firestore.instance.collection('question');
  final CollectionReference quizCollection =
      Firestore.instance.collection('quiz');

  Future<void> addQuiz(Quiz quiz) async {
    await quizCollection.add({
      'imgUrl': quiz.imgUrl,
      'title': quiz.title,
      'desc': quiz.desc,
    }).then((value) {
      var quizID = value.documentID;
      quiz.questionList.forEach((question) async {
        await quizCollection.add({
          'quizID': quizID,
          'question': question.question,
          'option1': question.option1,
          'option2': question.option2,
          'option3': question.option3,
          'option4': question.option4,
          'correctOption': question.correctOption,
        }).catchError((error) => print("Failed to add question: $error"));
      });
    }).catchError((error) => print("Failed to add quiz: $error"));
  }

  Future<List<Quiz>> getListQuiz() async {
    QuerySnapshot qShot = await quizCollection.getDocuments();

    return qShot.documents
        .map((doc) => Quiz(doc.data['imgUrl'], doc.data['title'],
            doc.data['desc'], doc.documentID))
        .toList();
  }

  Future<Quiz> getQuizByDocumentID(String documentID) async {
    await quizCollection.document(documentID).get().then((doc) async {
      Quiz quiz = Quiz(doc.data['imgUrl'], doc.data['title'], doc.data['desc'],
          doc.documentID);
      await getQuestionListByQuizDocumentID(doc.documentID)
          .then((questionList) {
        quiz.questionList = questionList;
        return quiz;
      });
    });
    return null;
  }

  Future<List<Question>> getQuestionListByQuizDocumentID(
      String quizDocumentID) async {
    List<Question> questionList = new List<Question>();
    await questionCollection.getDocuments().then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        if (result.data['quizID'] == quizDocumentID) {
          questionList.add(Question(
              result.data['question'],
              result.data['option1'],
              result.data['option2'],
              result.data['option3'],
              result.data['option4'],
              result.data['correctOption']));
        }
      });
    });
    return questionList;
  }
}
