
class MainStage implements Stage{
  
  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  PApplet p = new PApplet();
  Time t;
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
    t = new Time(level,p);
  }
  
  @Override
  public Stage next() {
    
    
    if(t.getTime()  <= 0) {
      return new GameOver();
    }
    
    /*if(t.getTime()  <= 0) {
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
    c.disp_sum(p);

    
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
