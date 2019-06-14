class Ball {
  Random rnd = new Random();
  int x, y, r;
  int dx, dy;
  Ball(int x, int y, int r){
    this.x = x; 
    this.y = y;
    this.r = r;
    this.dx = 5; //rnd.nextInt(10)+5;
    this.dy = 5; //rnd.nextInt(5)+5;
  }
  public boolean contains(int px, int py){
    return (px-x)*(px-x)+(py-y)*(py-y) < r*r;
  }
  
  public void draw(PApplet p){
    p.ellipse(x, y, r*2, r*2);
  }
  
  public void move(PApplet p){
    x += dx; if(dx < 0 && x <= 0 || dx > 0 && x+r >= p.width){ dx *= -1; }
    y += dy; if(dy < 0 && y <= 0 || dy > 0 && y+r >= p.height){ dy *= -1; }    
  }
  
  
  
}