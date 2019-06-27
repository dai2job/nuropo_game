class StartScreen implements Stage{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  
  boolean isClicked=false, inEasy = false, inNormal = false, inHard = false;
  float mX;
  float mY;
  float rectX = 300;
  float rectY = rectX / 4;
  
  protected boolean keyPressed = false;
  
  @Override
  public Stage next() {
    if(isClicked == true){
      if(inEasy == true){
        return new MainStage(0);
      }else if(inNormal == true){
        return new MainStage(1);
      }else if(inHard == true){
        return new MainStage(2);
      }
    }
    return this;
  }

  @Override
  public void action(PApplet p) {
    
    p.background(#2E75B6);
    p.textSize(70);
    p.textAlign(p.CENTER);
    p.fill(255);
    p.textSize(70);
    p.text("Title", p.width / 2.0, p.height/3.0);
    for(int i = 0; i < 3; i++){
      p.fill(255);
      p.rect(p.width * 1/2 - rectX / 2, i * rectY +p.height * 1 / 2, rectX, rectY);
    }
    p.textSize(50);
    p.fill(0);
    
    p.text("EASY", p.width / 2.0, p.height/2.0 + rectY);
    p.text("NORMAL", p.width / 2.0, p.height/2.0 + rectY * 2);
    p.text("HARD", p.width / 2.0, p.height/2.0 + rectY * 3);
  }


  @Override
  public void mouseClicked(PApplet p) {
    isClicked = true;
    if(p.mouseX >= p.width * 1/2 - rectX / 2 && p.mouseX <= p.width * 1/2 + rectX / 2){
      if(p.mouseY >= p.height / 2.0 && p.mouseY <= rectY + p.height / 2.0){
        inEasy = true;   
      }else if(p.mouseY > rectY + p.height / 2.0 && p.mouseY <= rectY * 2 + p.height / 2.0){
        inNormal = true;
      }else if(p.mouseY > rectY * 2 + p.height / 2.0 && p.mouseY <= rectY * 3 + p.height / 2.0){
        inHard  =true;
      }
    }else{
      p.println("no");
    }
    mX = p.mouseX;
    mY = p.mouseY;
  }

  @Override
  public void keyPressed(PApplet p) {
    keyPressed = true;
  }
  
  
}
