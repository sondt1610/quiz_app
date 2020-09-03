import 'package:quiz_app/models/question.dart';

class Quiz {
  String documentID;
  String imgUrl;
  String title;
  String desc;
  List<Question> questionList;
  Quiz(this.imgUrl, this.title, this.desc, this.documentID);
}
