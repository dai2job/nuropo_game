
class MainStage implements Stage{
  
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PApplet p = new PApplet();
  Time t = new Time(1);
  int d;
  
  protected boolean isClicked; 
  int numClicked = 0;
  int level ;
  Cards c;
  MainStage(int l){  
    isClicked = false;
    level = l;
    p.println(level);
    c = new Cards(level);
//=======
  /*MainStage(int d){  
    ball = new Ball(50,50,30);
    isClicked = false;
    this.d = d;
    PApplet p = new PApplet();
    //t = new Time(1,p);*/
//>>>>>>> e88a25ce8d24bf5831a752052ee3b4238573c3da
  }
  
  @Override
  public Stage next() {
    
    
    /*if(t.getTime()  <= 0) {
      return this;
    }
    
    if(t.getTime()  <= 0) {
      return new Ending();
    }else {
      return this;
    }*/
    
    if(c.isGameClear()) {
      return new Ending();
    } else {
      return this;
    }
  }
  
  int a = 0;
//  Cards c = new Cards(level);
  
  @Override
  public void action(PApplet p) {
    p.background(255);
    
    numClicked+= 2;
    
    //カードの描写
    c.disp_cards(p);
    c.change_cards();
    

    
    //時間の描写
    
    t.timeDraw(p);
    t.countTime();
    t.realTime(p);
    
  
  }

  @Override
  public void mouseClicked(PApplet p) {
    //isClicked = isClicked || ball.contains(p.mouseX, p.mouseY);  
    c.search_point(p);
  }

  @Override
  public void keyPressed(PApplet p) {
    //do nothing;
  }
}
