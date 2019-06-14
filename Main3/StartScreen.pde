class StartScreen implements Stage{
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  
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