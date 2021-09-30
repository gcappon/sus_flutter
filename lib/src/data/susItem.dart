import 'package:sus/sus.dart';

/// [SUSItem] is the class that implements the item of a SUS questionnarie.
class SUSItem{

  /// The [Question] of the [SUSItem].
  Question question;

  /// The give n [Answer] for the [SUSItem]. At the beginning is null since no
  /// answers can be given in advance and they have no default value. 
  Answer? answer;

  /// A flag that defines if the [SUSItem] [Answer] must be sum or subtracted to the overall score.
  bool isPositive;
  
  /// Default constructor of a [SUSItem].
  SUSItem({required this.question,
    this.answer,
    required this.isPositive,
  });

  /// Returns the status of a [SUSItem].
  @override
  String toString() {
    return (StringBuffer('SUSItem(')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('isPositive: $isPositive ')
          ..write(')'))
        .toString();
  } // toString

}// SUSItem