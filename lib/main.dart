import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuesAns.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<QuesAns> ques = [
    QuesAns("Are there only 7 wonders of the world?", 1),
    QuesAns("Is this the 20th century", 2),
    QuesAns("The wright brothers invented aircraft", 1),
    QuesAns("This is the 4th Question", 1),
    QuesAns("Is the name of the app Quiz?", 2),
    QuesAns("COVID outbroke in the year 2020", 2),
    QuesAns("Circle has no edges", 1),
    QuesAns("Wings of Fire was written by Tagore", 2),
    QuesAns("All birds can fly", 2),
  ];
  List<int> choice = new List<int>(9);

  String yes = 'yes';
  String no = 'No';
  String answer = '';
  String nxt = 'Next';

  int qNo = 1;
  int crt = 0;

  bool flagDone = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.amber[300],
            appBar: AppBar(
              title: Text('Quizy'),
              centerTitle: true,
              backgroundColor: Colors.orange[800],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: 'Quiz',
                  ),
                  Tab(
                    text: 'Score',
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Answer Away!!!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                      color: Colors.blue,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Question No: $qNo',
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                            child: Text(ques[qNo - 1].ques,
                                style: TextStyle(fontSize: 30.0)))),
                    Center(
                      child: FlatButton(
                        onPressed: () => {
                          if (!flagDone)
                            {
                              setState(() {
                                choice[qNo - 1] = 1;
                                if (ques[qNo - 1].getAnswer() == 1) {
                                  rightAnswer();
                                } else {
                                  wrongAnswer();
                                }
                              })
                            }
                        },
                        color: Colors.blue,
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          yes,
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Center(
                        child: FlatButton(
                      onPressed: () => {
                        if (!flagDone)
                          {
                            setState(() {
                              choice[qNo - 1] = 2;
                              if (ques[qNo - 1].getAnswer() == 2) {
                                rightAnswer();
                              } else {
                                wrongAnswer();
                              }
                            })
                          }
                      },
                      color: Colors.blue,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        no,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    )),
                    Center(
                      child: Container(
                        color: Colors.amber[300],
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: Text(
                              answer,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        child: FlatButton(
                          onPressed: () => {
                            if (flagDone)
                              {
                                setState(() {
                                  if(qNo==9){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ScoreSeparate(correct: crt,)),
                                    );
                                  }
                                  answer = '';
                                  update();
                                })
                              }
                          },
                          color: Colors.orange[800],
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            nxt,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Container(
                    color: Colors.grey[800],
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(10.0),
                              color: Colors.grey[700],
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Your Score is\n',
                                    style: TextStyle(color: Colors.grey[300]),
                                  ),
                                  Text(
                                    '$crt / 9',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                        ])),
              ],
            )));
  }

  void rightAnswer() {
    answer = 'Correct!!';
    crt++;
    flagDone = true;
  }

  void wrongAnswer() {
    answer = 'Wrong!!';
    flagDone = true;
  }

  void update() {
    flagDone = false;
    if (qNo < 8)
      qNo++;
    else if (qNo == 8) {
      qNo++;
      nxt = 'Submit';
    } else {
      //Questions Done
      flagDone = true;
    }
  }
}

class ScoreSeparate extends StatelessWidget{
  final int correct;
  ScoreSeparate({Key key, @required this.correct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz'
        ),
      ),
      body: Container(
          color: Colors.grey[800],
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.grey[700],
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Your Score is\n',
                            style: TextStyle(color: Colors.grey[300]),
                          ),
                          Text(
                            '$correct / 9',
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                ]),
          )),
    );
  }
  }
