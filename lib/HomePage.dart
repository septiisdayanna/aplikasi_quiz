import 'dart:async';
import 'dart:convert';
import 'package:apk_quiz/Options.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CompletePage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List responseData=[];
  int number =0;
  late Timer _timer;
  int _secondRemaining=15;
  List<String> shuffledOptions=[];
  int score = 0;
  int correctCount = 0;
  int wrongCount = 0;

  Future api()async{
    final response=await http.get(Uri.parse('https://opentdb.com/api.php?amount=10&category=18&difficulty=easy&type=multiple'));
    if(response.statusCode==200){
      var data=jsonDecode(response.body)['results'];
      setState(() {
        responseData=data;
        updateShuffleOption();
      });
    }
  }
  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    api();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(8),
      child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                        color:const Color(0xffA42FC1),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Positioned(
                      bottom: 60,
                      left: 22,
                      child: Container(
                        height: 170,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  color: Color(0xfA42FC1).withOpacity(.4)
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: Column(
                            children: [
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(correctCount.toString(),style: TextStyle(
                                    color: Colors.green,fontSize: 20
                                  ),),
                                  Text(wrongCount.toString(),style: TextStyle(
                                      color: Colors.red,fontSize: 20
                                  ),)
                                ],
                              ),
                               Center(
                                child: Text("Question${number + 1}/10",style: TextStyle(
                                  color: Color(0xffA42FC1)
                                ),),

                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(responseData.isNotEmpty? responseData[number]['question']:'')
                            ],
                          ),
                        ),
                      )
                  ),
                   Positioned(
                    bottom: 210,
                      left: 140,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Text(_secondRemaining.toString(), style: TextStyle(
                            color: const Color(0xffA42FC1), fontSize: 25
                          ),),
                        ),
                      )
                  )
                ],
              ),
            ),

            const SizedBox(height: 1,),

            Column(
              children: shuffledOptions.map((option) {
                return Options(
                  option: option.toString(),
                  onTapCallback: handleOptionTap,
                );
              }).toList(),
            ),

            const SizedBox(height: 30,),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffA42FC1),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),

              ),
              elevation: 5,
            ),
                onPressed: (){
                nextQuestion();
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const Text('Next', style: TextStyle(
                      color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                ))
          ],
        ),
      ),
    );
  }
  void nextQuestion(){
    if(number==9){
      completed();
    }
    setState(() {
      number=number+1;
      updateShuffleOption();
      _secondRemaining=15;
    });
  }

  void completed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Completed(score: score, correctCount: correctCount, wrongCount: wrongCount)),
    );
  }

  void updateShuffleOption(){
    setState(() {
      shuffledOptions=shuffleOption(
        [
          responseData[number]['correct_answer'],
          ...(responseData[number]['incorrect_answers']as List)
        ]
      );
    });
  }
  List<String> shuffleOption(List<String> option){
    List<String> shuffledOptions=List.from(option);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  //function for timer

void startTimer(){
    _timer=Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_secondRemaining>0){
          _secondRemaining--;
        }else{
          nextQuestion();
          _secondRemaining=15;
          updateShuffleOption();
        }
      });
    });
}

  void handleOptionTap(String selectedOption) {
    if (selectedOption == responseData[number]['correct_answer']) {
      setState(() {
        score += 10;
        correctCount++;
      });
    } else {
      setState(() {
        wrongCount++;
      });
    }
    nextQuestion();
  }

}