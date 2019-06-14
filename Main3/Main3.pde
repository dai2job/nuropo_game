

import processing.core.PApplet;

public class Main3 extends PApplet{
  
  public static void main(String[]args){
    
    PApplet.main("Main3");    
  }
  
  Stage curStage; //現在の状態（ステージ）
  public void settings(){
    size(500,500);
  }
  
  public void setup(){
    curStage = new StartScreen();    
  }
  
  @Override
  public void draw(){
    curStage.action(this);
    curStage = curStage.next();
  }
  
  @Override
  public void mouseClicked() {
    curStage.mouseClicked(this);
  }
  
  @Override
  public void keyPressed(){
    curStage.keyPressed(this);
  }
}