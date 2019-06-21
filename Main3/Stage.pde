interface Stage {
  Stage next(); //次のステージを返す

  void action(PApplet p);//one step実行
  void mouseClicked(PApplet p);
  void keyPressed(PApplet p);
}