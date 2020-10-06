class Boundary{
  private PVector p1, p2;
  public Boundary(int x1, int y1, int x2, int y2){
    this.p1 = new PVector(x1, y1);
    this.p2 = new PVector(x2, y2);
  }
  public void show(){
    stroke(255);
    line(p1.x, p1.y, p2.x, p2.y);
  }
}
