import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sus/src/data/susQuestionnarie.dart';
import 'package:sus/src/view/susItemview.dart';

class SUSView extends StatefulWidget {
  const SUSView({Key? key, required this.doneCallback}) : super(key: key);
  final Function(double) doneCallback;
  @override
  _SUSViewState createState() => _SUSViewState();
}

class _SUSViewState extends State<SUSView> {
  final SUSQuestionnarie susQuestionnarie = SUSQuestionnarie.init();
  List<int> noAns = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'SUS Questionnaire',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 50,
          ),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => Divider(),
            itemCount: susQuestionnarie.susItems.length,
            itemBuilder: (context, index) => SUSItemView(
                missingAnswer: noAns.contains(index),
                item: susQuestionnarie.susItems[index]),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              try {
                widget.doneCallback(susQuestionnarie.getScore());
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Thank you for completing the questionnaire',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } catch (e) {
                setState(() => noAns = (e as AnswerException).notAnswered);
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Answer all questions',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            child: Text('DONE'),
          )
        ],
      ),
    );
  }
}
