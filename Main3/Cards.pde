import java.util.Random;

class Cards extends PApplet{
 int diffculty;
 
 public int cards[] = new int[6];
 
 Cards(int d){
   if(d == 0){
     cards[0] = (int)random(0,5);
     cards[1] = (int)random(0,5);
     cards[2] = 10-cards[0]-cards[1];
     cards[3] = (int)random(0,10);
     cards[4] = (int)random(0,10);
     cards[5] = (int)random(0,10);
   }
   if(d == 1){
     cards[0] = (int)random(0,50);
     cards[1] = (int)random(0,50);
     cards[2] = 10-cards[0]-cards[1];
     cards[3] = (int)random(0,100);
     cards[4] = (int)random(0,100);
     cards[5] = (int)random(0,100);
   }
   
   if(d == 2){
     cards[0] = (int)random(0,500);
     cards[1] = (int)random(0,500);
     cards[2] = 10-cards[0]-cards[1];
     cards[3] = (int)random(0,1000);
     cards[4] = (int)random(0,1000);
     cards[5] = (int)random(0,1000);
   }
   
 }
 
 
 
}