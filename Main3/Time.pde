import java.util.Random;

class Time extends PApplet{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PFont font;
  int d;
  int t = 0;
  int r = 0;
  Time(int d){
    
    this.d = d;
    
    while(r >= t){
      r = int(random(1000,10000)) + d * 5000;
      t = int(random(1000,10000)) + d * 5000;
    }
  }
  
  int getTime(){
    return r;
  }
  
  void timeDraw(PApplet p){
    p.fill(255,0,0,t%255);
    p.textSize(80);
    p.text(t/60 + "sec",650,100);
  }
  
  void realTime(PApplet p){
    p.fill(100);
    p.textSize(7);
    p.text(r/60 + "sec",10,5);
  }
  
  void countTime(){
    t--;
    r--;
  }
  
}