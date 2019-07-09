
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
