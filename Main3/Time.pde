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
    
    t = int(random(500,1000)) + d * 60 * 5;
    r = t - 60 * 5;
    //font = p.creatFont("MS Gothic",48,true);
  }
  
  int getTime(){
    return r;
  }
  
  void timeDraw(PApplet p){
    p.fill(255,0,0,t*10%255);
    p.textSize(80);
    font = p.createFont("MS Gothic",48,true);
    p.textFont(font);
    p.text(t/60 + "秒",650,100);
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