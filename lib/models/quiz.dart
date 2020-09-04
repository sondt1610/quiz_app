import 'package:quiz_app/models/question.dart';

class Quiz {
  String documentID = '';
  String imgUrl;
  String title;
  String desc;
  List<Question> questionList = new List<Question>();
  Quiz(this.imgUrl, this.title, this.desc);
  Map<String, dynamic> toJson() => {
        'imgUrl': imgUrl,
        'title': title,
        'desc': desc,
        'list_question': questionList.toList()
      };
}
