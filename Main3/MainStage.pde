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