
class MainStage implements Stage{
  
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PApplet p = new PApplet();
  Time t = new Time(1);
  int d;
  
  protected Ball ball;
  protected boolean isClicked; 
  int numClicked = 0;
  
  MainStage(int d){  
    ball = new Ball(50,50,30);
    isClicked = false;
    this.d = d;
    PApplet p = new PApplet();
    //t = new Time(1,p);
  }
  
  @Override
  public Stage next() {
    if(t.getTime()  <= 0) {
      return new Ending();
    }else {
      return this;
    }
    
    
  }
  int a = 0;
  Cards c = new Cards(d);
  
  @Override
  public void action(PApplet p) {
    p.background(255);
    
    numClicked+= 2;
    
    //カードの描写
    
    
    //時間の描写
    
    t.timeDraw(p);
    t.countTime();
    
    
  
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