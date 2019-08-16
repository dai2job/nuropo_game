import java.util.Random;

class Time extends PApplet{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PFont font;
  int d;
  int t = 0;
  int r = 0;
  Time(int d,PApplet p){
    
    this.d = d;
    
    t = int(random(1000,1200)) + d * 60 * 7;
    r = t - 60 * int(random(4,7));
    //font = p.creatFont("MS Gothic",48,true);
  }
  
  int getTime(){
    return r;
  }
  
  void timeDraw(PApplet p){
    p.fill(255,0,0,t*10%255);
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
