import 'dart:io';
import 'dart:math';


void main() {
  while(true)
 { Random random = new Random();
  List a = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  structureGame(a);
  // randomNumber used to choose the player who will start the game
  int randomNumber = random.nextInt(9);
 // i can use another way like make a var counter thet initial value is 0 ,if counter%0 then player1 will play and when  counter%1 player2 wii play

 if (randomNumber % 2 == 0) {
    print('player2 he will play');

   player2(a);
  }
  else {
   print('player1 he will play');

   player1(a);

  }
    print('Do you want to continue?([Y]es/[N]o)');
  if (checkIfContinue()!=true){
    break;
  }
 }

}

void structureGame(List a) {
  //first row in game
  print(" " + a[0] + " | " + a[1] + " | " + a[2] + " ");
  //second row in game
  print("---+---+---");
  print(" " + a[3] + " | " + a[4] + " | " + a[5] + " ");
  print("---+---+---");
  //final line
  print(" " + a[6] + " | " + a[7] + " | " + a[8] + " ");

  //return winer;
}

void player1(List a) {
  String character='X';

  print('player1 .chose');
  int numberPlayer1= validator();
  if (checkIsEmpty(numberPlayer1, a)) {
    a[numberPlayer1] =character;
    structureGame(a);
    if(checkIfPlayerIsWiner(a,character)){
      print('player1 Winer');
    }
    else{
      isDraw(a)?
          print('game is draw'):
      player2(a);
    }
  } else {
    print('incorect plese try agin');
    structureGame(a);
    player1(a);
  }
}

void player2(List a) {
  String character='O';

  print('player2 .chose');
  int numberPlayer2= validator();
  if (checkIsEmpty(numberPlayer2, a)) {
    a[numberPlayer2] = character;
    structureGame(a);
    if(checkIfPlayerIsWiner(a,character)){
      print('player2 Winer');
    }
    else{

      isDraw(a)?
      print('game is draw'):
      player1(a);
    }

  } else {
    print('incorect plese try agin');
    structureGame(a);

    player2(a);
  }
}

bool checkIsEmpty(int number, List a) {
  if (number <= 8 && number >= 0||number==null) {
    if (a[number] == 'O' || a[number] == 'X') {
      return false;
    }
  } else {
    print('incorect plese try agin');

    player1(a);
  }

  return true;
}

bool checkIfPlayerIsWiner(List a,String character){
  if (a[0]==character && a[1]==character && a[2]==character ){  return true;}
  if (a[3]==character && a[4]==character && a[5]==character ){  return true;}
  if (a[6]==character && a[7]==character && a[8]==character ){  return true;}
  if (a[0]==character && a[3]==character && a[6]==character ){  return true;}
  if (a[1]==character && a[4]==character && a[7]==character ){  return true;}
  if (a[2]==character && a[5]==character && a[8]==character ){  return true;}
  if (a[0]==character && a[4]==character && a[8]==character ){  return true;}
  if (a[2]==character && a[4]==character && a[6]==character ){  return true;}
  return false;
}
bool checkIfContinue(){
  String answer=stdin.readLineSync()!;
  answer=answer.toLowerCase();

  if (answer=='no'||answer=='n'){
    return false;
  }
  if (answer=='yes'||answer=='y'){
    return true;
  }
  else{
    print('invalid input,please try agine');
    return checkIfContinue();}
}


 bool isDraw(List a){
    int counter=0;
     bool  draw;
  a.forEach((element) {
    if (element == "X"||element=='O'){
      counter=counter+1;

    }
  }

   );
    counter==9?draw=true:draw=false;
    return draw;


 }
 int validator(){
   int  numberPlayer1=-1;
   try{

     numberPlayer1 = int.parse(stdin.readLineSync()!) - 1;


   }catch(e){
    print('invalid input');
   }

   return numberPlayer1;

 }





