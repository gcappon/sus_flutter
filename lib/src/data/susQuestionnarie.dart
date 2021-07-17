import 'package:sus/sus.dart';

/// [SUSQuestionnarie] is the class that implements the data model of the SUS questionnarie.
class SUSQuestionnarie{
  
  List<SUSItem> susItems;
  
  /// Default constructor of a [SUSQuestionnarie].
  SUSQuestionnarie({required this.susItems});

  /// Initialize a new [SUSQuestionnarie].
  factory SUSQuestionnarie.init(){
    List<SUSItem> susItems = [
      SUSItem(
        question: Question(text: "I think that I would like to use this system frequently."),
        answer: null,
        isPositive: true,
      ),
      SUSItem(
        question: Question(text: "I found the system unnecessarily complex."),
        answer: null,
        isPositive: false,
      ),
      SUSItem(
        question: Question(text: "I thought the system was easy to use."),
        answer: null,
        isPositive: true,
      ),
      SUSItem(
        question: Question(text: "I think that I would need the support of a technical person to be able to use this system."),
        answer: null,
        isPositive: false,
      ),
      SUSItem(
        question: Question(text: "I found the various functions in this system were well integrated."),
        answer: null,
        isPositive: true,
      ),
      SUSItem(
        question: Question(text: "I thought there was too much inconsistency in this system."),
        answer: null,
        isPositive: false,
      ),
      SUSItem(
        question: Question(text: "I would imagine that most people would learn to use this system very quickly."),
        answer: null,
        isPositive: true,
      ),
      SUSItem(
        question: Question(text: "I found the system very cumbersome to use."),
        answer: null,
        isPositive: false,
      ),
      SUSItem(
        question: Question(text: "I felt very confident using the system."),
        answer: null,
        isPositive: true,
      ),
      SUSItem(
        question: Question(text: "I needed to learn a lot of things before I could get going with this system."),
        answer: null,
        isPositive: false,
      ),
    ];
    return SUSQuestionnarie(susItems: susItems);
  }//SUSQuestionnarie.init

  /// A method that computes the overall score of the SUS questionnarie.
  double getScore(){

    //Initialize the sum to 0.
    int sum = 0;

    //Sum the given answers' scores.
    susItems.forEach((SUSItem susItem){
      if(susItem.isPositive){
        sum += susItem.answer!.toNumber()-1;
      }else{
        sum += 5-susItem.answer!.toNumber();
      }//if
    });//forEach

    //Return the overall score
    return sum*2.5;

  }// getScore

  /// Returns the status of a [SUSQuestionnarie].
  @override
  String toString() {
    return (StringBuffer('SUSQuestionnarie(')
          ..write('susItems: $susItems ')
          ..write(')'))
        .toString();
  } // toString

}// SUSQuestionnarie