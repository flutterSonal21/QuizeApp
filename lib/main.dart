import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
    ));
    runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
      
      );
      }
}


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}
//List AllQuestion
class SingleQuestionModel{
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({
    this.question,this.options,this.answerIndex,
  });
  
}
class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionModel( 
      question: "Who wrote Bande Mataram?",
      options: [" Rabindranath Tagore ", " Bankimchandra Chatterjee ", " Sharat chandra ", " None of the above "],
      answerIndex: 1,
    ),
    const SingleQuestionModel( 
    question: " Where is situated the battlefield of Plessey?",
    options: ["Punjab", " Haryana", "West Bengal", "Karnataka"],
    answerIndex: 2,

    ),
    const SingleQuestionModel( 
    question: "The Indus Valley Civilization flourished during which period?",
    options: ["5th century AD", "3000-1500 BC", "10th century AD", "2nd century BC"],
    answerIndex: 1,
    ),
    const SingleQuestionModel( 
    question: "What was the name of Harsha Capital?",
    options: ["Kannaauj", "Kanpur", "Lucknow", "Gaya"],
    answerIndex: 0,
    ),
    const SingleQuestionModel( 
    question: "In the third battle of Panipat, who defeated Marathas?",
    options: ["Mughals", "Afghans", "British Army", "None of the Above"],
    answerIndex: 1,
    ),
  ];
  
  int selectedans=-1;         //pagesathi
  bool questionScreen = true;   
  int questionIndex = 0;      //index change hoto
  int correctanswer=0;
  
    //answer change krt correct aahe ki nhi
    //page change kenyasathi or question click nhi kele ani next ghetay tr nhi honar
  void currentPage(){
    if(selectedans==-1){
      return;
    }
    if(selectedans==allQuestions[questionIndex].answerIndex){
      correctanswer+=1;
    }
    if(selectedans!=-1){
      if(questionIndex==allQuestions.length-1){
        setState(() {
          questionScreen=false;
        });
      }
      selectedans=-1;
      setState(() {
        questionIndex+=1;
      });
      
    }
  }

//click kelyavr color denyasathi
  MaterialStateProperty<Color?> checkAnw(int buttonIndex){
    if(selectedans!=-1){
      if(buttonIndex==allQuestions[questionIndex].answerIndex){
        return const MaterialStatePropertyAll(Colors.green);
      }else if(buttonIndex==selectedans){
        return const MaterialStatePropertyAll(Colors.red);
      }else{
        return const MaterialStatePropertyAll(null);
      }
    }else{
      return const MaterialStatePropertyAll(null);
    }
  }
  //1st screen
  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
        //appbar
        appBar: AppBar(
        title: const Text(
          "Indian History Quiz",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontFamily: AutofillHints.birthdayMonth,
            fontStyle: FontStyle.italic,
            ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(180, 30, 137, 1),
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(60),
            bottom:Radius.circular(60),
          ),
        ),
        ),
        //body
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                //Question:1/5
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    //color: Colors.pink,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),

            //main Question
            SizedBox(
              width: 380,
              height: 80,
              child: Text(
               allQuestions[questionIndex].question,
               style: const TextStyle(
                  
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(

             height: 30,
           ),
           
           //button 1
           SizedBox(
            height: 60,
            width: 300,
            
            child: 
              ElevatedButton(
              style:
                ButtonStyle(backgroundColor: checkAnw(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=0;
                  });
                }
              },
                child: Text(
                  "A.${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    
                  ),
                ),
            ),

           ),
            
            const SizedBox(
             height: 20,
            ),
            
            //button 2
            SizedBox(
            height: 60,
            width: 300,
            
            child: 
              ElevatedButton(
              style:ButtonStyle(
                backgroundColor: checkAnw(1),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=1;
                  });
                }
              },
                child: Text(
                  "B.${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
            const SizedBox(
             height: 20,
            ),

            ////button 3
            SizedBox(
            height: 60,
            width: 300,
          
            child: 
              ElevatedButton(
              style:ButtonStyle(
                backgroundColor: checkAnw(2),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=2;
                  });
                }
              },
                child: Text(
                  "C.${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),

            const SizedBox(
             height: 20,
            ),
            //button 4
            SizedBox(
            height: 60,
            width: 300,
            
            child: 
             ElevatedButton(
              
              style:ButtonStyle(
                backgroundColor: checkAnw(3),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            
              onPressed: () {   
                if(selectedans==-1){
                  setState(() {
                    selectedans=3;
                  });
                }
              },
                child: Text(
                  "D.${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
            ),

           ),
          ],
        ),
        //page change button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            currentPage();
          },
          backgroundColor: const Color.fromRGBO(180, 30, 137, 1),
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {

      //Congradulation screen
      return Scaffold(
        appBar: AppBar(
        title: const Text(
          "...Quiz Completed...",
            style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(180, 30, 137, 1),
        ),

        body:Center(
          child: 
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
           const SizedBox(
              height: 10,
            ),

            Image.network("https://tse2.mm.bing.net/th?id=OIP.hSemdKLnQuT1g4USHCBWIQHaHV&pid=Api&P=0&h=180",height: 400,width: 1300,),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Congratulations",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                
              ),
            ),
            const SizedBox(height: 10,),
            Text("Score : $correctanswer/${allQuestions.length}",style: const TextStyle(fontSize: 32,fontWeight: FontWeight.w800),),
            const SizedBox(height: 20,),


            SizedBox(
              child:
                ElevatedButton(onPressed:(){
                  setState(() {
                    questionIndex=0;
                    questionScreen=true;
                    correctanswer=0;
                    selectedans=-1;
                  });
                },
                style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 145, 23, 119)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ), 
            

                child: const Text(
                  "Reset",
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
          
        ),
        ),
        
      );
      
    }
  }
  @override
    Widget build(BuildContext context) {
      return isQuestionScreen();
    }
}
