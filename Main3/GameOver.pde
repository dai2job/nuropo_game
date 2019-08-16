class GameOver implements Stage {
  PFont font;
  boolean flag = true;
  int cnt = 0;

  public static void main(String[] args){
      PApplet.main("Main3"); 
  }
  
  public GameOver(){
    flag = true;
    cnt = 0;
  }
  
  public Stage next() {
    if(flag) {
      return this;
    } else {
      return new StartScreen();
    }
  }
  
  public void action(PApplet p) {
    p.background(255);
    font = p.createFont("MS Gothic",200,true);
    p.textFont(font);
    p.fill(255,0,0);
    p.text("残念〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜〜", 0, 50, 800, 600);
  }
  
  @Override
  public void mouseClicked(PApplet p) {
    cnt++;
    if(cnt >= 2) {
      flag = false;
    }
  }

  @Override
  public void keyPressed(PApplet p) { }
}
