import java.util.Random;
import processing.core.PApplet;

interface Stage {
  Stage next(); //次のステージを返す

  void action(PApplet p);//one step実行
  void mouseClicked(PApplet p);
  void keyPressed(PApplet p);
}





/*
class SpecialStage implements Stage{
  
  Stage prev; //元のステージ
  boolean isKeyPressed = false;
  
  SpecialStage(Stage p){
    prev p;
    ball = new Ball(0,0,20);
  }
  
  @override
  public Stage next() {
    if(keyPressed) {
      
    }else {
      
    }
      
  }
}
*/