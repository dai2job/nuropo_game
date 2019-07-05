import java.util.Random;

class Time extends PApplet{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PFont font;
  int d;
  int t;
  Time(int d){
    
    this.d = d;
    
    
    
    t = int(random(1000));
  }
  
  int getTime(){
    return t;
  }
  
  void timeDraw(PApplet p){
    p.fill(255,0,0);
    //ellipse(100,100,50,50);
    p.text(t,700,100);
  }
  
  void countTime(){
    t--;
  }
  
}