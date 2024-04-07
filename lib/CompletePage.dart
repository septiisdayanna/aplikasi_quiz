import 'package:apk_quiz/HomePage.dart';
import 'package:flutter/material.dart';
class Completed extends StatelessWidget {
  final int score;
  final int correctCount;
  final int wrongCount;
  const Completed({Key? key, required this.score, required this.correctCount, required this.wrongCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 521,
            width: 400,
            child: Stack(
              children: [
                Container(
                  height: 340,
                  width: 410,
                  decoration: BoxDecoration(
                    color: Color(0xffA42FC1),
                    borderRadius: BorderRadius.circular(20)

                  ),
                  child: Center(
                    child: CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.white.withOpacity(.3),
                      child: CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.white.withOpacity(.4),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Your Score',style: TextStyle(
                                  fontSize: 20,color: Color(0xffA42FC1)

                                ),),
                                RichText(
                                  text: TextSpan(
                                    text: '$score',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffA42FC1),
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                    left: 22,
                    child: Container(
                      height: 190,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 3,
                              color: Color(0xffA42FC1).withOpacity(.7),
                              offset: Offset(0, 1)
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Center(
                                       child: Row(
                                         children: [
                                           Container(
                                           height: 15,
                                           width: 15,
                                           decoration: const BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Color(0xffA42FC1)

                                           ),
                                          ),
                                         const Text('100%',style: TextStyle(
                                           fontWeight: FontWeight.w500,fontSize: 20,
                                           color: Color(0xffA42FC1)
                                         ),)
                                         ]
                                       ),
                                     ),
                                     const Text('Completion')

                                      ],
                                     ),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Center(
                                       child: Row(
                                           children: [
                                             Container(
                                               height: 15,
                                               width: 15,
                                               decoration: const BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Color(0xffA42FC1)

                                               ),
                                             ),
                                             const Text('10',style: TextStyle(
                                                 fontWeight: FontWeight.w500,fontSize: 20,
                                                 color: Color(0xffA42FC1)
                                             ),)
                                           ]
                                       ),
                                     ),
                                     const Text('Total Question')

                                   ],
                                 ),
                                   ],
                                 ),
                             const SizedBox(
                               height: 25,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Center(
                                       child: Row(
                                           children: [
                                             Container(
                                               height: 15,
                                               width: 15,
                                               decoration: const BoxDecoration(
                                                   shape: BoxShape.circle,
                                                   color: Colors.green

                                               ),
                                             ),
                                              Text('$correctCount',style: TextStyle(
                                                 fontWeight: FontWeight.w500,fontSize: 20,
                                                 color: Colors.green
                                             ),)
                                           ]
                                       ),
                                     ),
                                     const Text(' Correct')

                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 48.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Center(
                                         child: Row(
                                             children: [
                                               Container(
                                                 height: 15,
                                                 width: 15,
                                                 decoration: const BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     color: Colors.red

                                                 ),
                                               ),
                                                Text('$wrongCount',style: TextStyle(
                                                   fontWeight: FontWeight.w500,fontSize: 20,
                                                   color: Colors.red
                                               ),)
                                             ]
                                         ),
                                       ),
                                       const Text('wrong')

                                     ],
                                   ),
                                 ),
                               ],
                             )
                               ],
                             )
                         ),
                       ),
                      ))
              ],
            ),
          ),
          const SizedBox(height: 20,),
           Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>HomePage()));
                        },
                        child:const CircleAvatar(
                            backgroundColor: Color(0xff37AFA1),
                            radius: 35,
                            child: Center(
                              child: Icon(Icons.refresh,size: 35,color: Colors.white),
                            ),
                          ),
                        ),
                          SizedBox(height: 10,),
                          Text('Play Again',style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w500),)
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}