

import java.util.Random;

import processing.core.PApplet;

interface Stage {
  Stage next(); //次のステージを返す

  void action(PApplet p);//one step実行
  void mouseClicked(PApplet p);
  void keyPressed(PApplet p);
}


class StartScreen implements Stage{
  int numClicked=0;
  
  
  protected boolean keyPressed = false;
  
  @Override
  public Stage next() {
    if(keyPressed){
      return new MainStage();
    }
    return this;
  }

  @Override
  public void action(PApplet p) {
    int [] rgb = { 
        (numClicked%3 == 0? 255 : 0),  
        (numClicked%3 == 1? 255 : 0),  
        (numClicked%3 == 2? 255 : 0),
    };  
    p.background( rgb[0],rgb[1],rgb[2]);
  }

  @Override
  public void mouseClicked(PApplet p) {
    numClicked ++;
  }

  @Override
  public void keyPressed(PApplet p) {
    keyPressed = true;
  }
}

/* Ballをクリックで終了 */
class MainStage implements Stage{
  public static void main(String[] args){
      PApplet.main("Main3"); 
    }
  protected Ball ball;
  protected boolean isClicked; 
  int numClicked = 0;
  
  
  
  MainStage(){  
    ball = new Ball(50,50,30);
    isClicked = false;
    
  }
  
  @Override
  public Stage next() {
    if(numClicked > 300) {
      return new Ending();
    }else {
      return this;
    }
    
    
  }
  
  @Override
  public void action(PApplet p) {
    p.background(255);
    ball.draw(p); //ballを描く
    ball.move(p); //ballを移動させる
    numClicked++;
  }

  @Override
  public void mouseClicked(PApplet p) {
    isClicked = isClicked || ball.contains(p.mouseX, p.mouseY);  
  }

  @Override
  public void keyPressed(PApplet p) {
    //do nothing;
  }
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

/* 徐々に暗くなり，初期画面に戻る */
class Ending implements Stage {
  public static void main(String[] args){
      PApplet.main("Main3"); 
    }
  protected int INIT = 10000;
  protected int life;
  
  public Ending(){
    life = INIT;
  }
  
  @Override
  public Stage next() {
    return life > 0? this : new StartScreen();
  }

  @Override
  public void action(PApplet p) {
    float col = (float)(255.0 * life/INIT);
    if(col < 0){ col = 0; }    
    p.background( col );
    life = life - 50;
  }

  @Override
  public void mouseClicked(PApplet p) { }

  @Override
  public void keyPressed(PApplet p) { }
  
}