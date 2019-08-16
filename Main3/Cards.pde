import java.util.Random;

class Cards extends PApplet{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PApplet p = new PApplet();
 
 int hands[] = new int[6];
 int boards[] = new int[]{-1,-1,-1,-1,-1,-1};
 int w = 70;
 float h = w * 1.4;
 int handXs[] = new int[6];
 int handYs[] = new int[6];
 int boardXs[] = new int[6];
 int boardYs[] = new int[6];
 int target;
 int targets[] = new int[]{20, 100, 567};
 boolean isHands[] = new boolean[6];
 boolean isBoards[] = new boolean[6];
 //数字を持つ
 int tmp = -1;
 //数字を持っているか
 boolean possess = false;
 PFont font;
 
 
 void change_cards() {
   for(int i = 0; i < 6; i++) {
     if(isHands[i]) {
       if(hands[i] != -1  && possess) {
         return;
       } else if(hands[i] == -1 && possess == false) {
         return;
       } else if(hands[i] != -1 && possess == false) {
         tmp = hands[i];
         hands[i] = -1;
         possess = true;
         isHands[i] = false;
         return;
       } else if(hands[i] == -1 && possess){
         hands[i] = tmp;
         tmp = -1;
         possess = false;
         isHands[i] = false;
         return;
       }
     }
     
     
    if(isBoards[i]) {
       if(boards[i] != -1  && possess) {
         return;
       } else if(boards[i] == -1 && possess == false) {
         return;
       } else if(boards[i] != -1 && possess == false) {
         tmp = boards[i];
         boards[i] = -1;
         possess = true;
         isBoards[i] = false;
         return;
       } else if(boards[i] == -1 && possess) {
         boards[i] = tmp;
         tmp = -1;
         possess = false;
         isBoards[i] = false;
         return;
       }
     }
   }
 }
   
         
       
       
 
 void disp_cards(PApplet p) {
   for(int i = 0; i < 6; i++) {
     //四角形の描画
     p.fill(255);
     p.strokeWeight(3);
     p.stroke(255,0,0);
     p.rect(handXs[i], handYs[i], w, h);
     p.stroke(0,0,0);
     p.rect(boardXs[i], boardYs[i], w, h);
     
     //hands[], boards[]が-1なら数字を表示しない
     p.textSize(45);
     p.fill(0);
     if(hands[i] != -1) {
       p.text(hands[i], handXs[i] + w / 2, handYs[i] + h / 2);
     }
     if(boards[i] != -1) {
       p.text(boards[i], boardXs[i] + w / 2, boardYs[i] + h / 2);
     }
     //p.text(tmp, width / 2, height / 2);
   }
   change_cards();
 }
 
  void disp_sum(PApplet p) {
    font = p.createFont("MS Gothic",30,true);
    p.textFont(font);
    p.text("縦の合計を" + str(target) + "に", 70, 200, 150, 500);
  }
 
 boolean isGameClear() {
   int sum1 = 0;
   int sum2 = 0;
   for(int i = 0; i < 3; i++) {
     sum1 += boards[i];
   }
   for(int i = 3; i < 6; i++) {
     sum2 += boards[i];
   }
   if(sum1 == target && sum2 == target) {
     return true;
   } else {
     return false;
   }
 }
 


 Cards(int d){
   
   //数字をランダムで設定
   if(d == 0) {
    target = targets[0];
   } else if(d == 1) {
    target = targets[1];
   } else if(d == 2) {
    target = targets[2];
   }
   
   hands[0] = (int)random(1,target/2);
   hands[1] = (int)random(1,target/2);
   hands[2] = target-hands[0]-hands[1];
   hands[3] = (int)random(1,target/2);
   hands[4] = (int)random(1,target/2);
   hands[5] = target-hands[3]-hands[4];
      
   rndHands();
   
   //描写位置の設定
   for(int i = 0; i < 6; i++) {
     handXs[i] = (800 / 7) * (i + 1) - (w / 2);
     handYs[i] = 450;
   }
   for(int i = 0; i < 6; i++) {
     if(i == 0 || i == 1 | i == 2) {
       boardXs[i] = handXs[2];
     } else {
       boardXs[i] = handXs[3];
     }
     
     if(i == 0 || i == 3) {
       boardYs[i] = handYs[0] - (w + 50) * 1; 
     } else if(i == 1 || i == 4) {
       boardYs[i] = handYs[0] - (w + 50) * 2; 
     } else {
       boardYs[i] = handYs[0] - (w + 50) * 3; 
     }
   }
 }
 
 
 //手札をシャッフルする
 void rndHands() {
   for(int i = 0; i < hands.length; ++i) {
     int rnd = int(random(hands.length - 1));
     int tmp = hands[i];
     hands[i] = hands[rnd];
     hands[rnd] = tmp;
   }
 }
 

  void search_point(PApplet p) {
    if(p.mouseY >= handYs[0] && p.mouseY <= handYs[0] + h){
      for(int i = 0; i < 6; i++) {
        if(p.mouseX >= handXs[i] && p.mouseX <= handXs[i] + w) {
          isHands[i] = true;
          p.println("hand"); 
        }
      }
    }
    if(p.mouseX >= boardXs[0] && p.mouseX <= boardXs[0] + w) {
      for(int i = 0; i < 3; i++) {
        if(p.mouseY >= boardYs[i] && p.mouseY <= boardYs[i] + h) {
          isBoards[i] = true;
          p.println("board");
        }
      }
    }
    if(p.mouseX >= boardXs[3] && p.mouseX <= boardXs[3] + w) {
      for(int i = 3; i < 6; i++) {
        if(p.mouseY >= boardYs[i] && p.mouseY <= boardYs[i] + h) {
          isBoards[i] = true;
          p.println("board");
        }
      }
    }
  }
 
 
 
}
