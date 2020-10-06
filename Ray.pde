class Ray{
  private PVector position, direction, point;
  public Ray(PVector position, float angle){
    this.position = position;
    this.direction = PVector.fromAngle(angle);
  }
  
  public void setDirection(int x, int y){
    direction.x = x - position.x;
    direction.y = y - position.y;
    direction.normalize();
  }
  
  public void show(){
    stroke(255, 90);
    pushMatrix();
    //push();
    translate(position.x, position.y);
    line(0, 0, direction.x * 10, direction.y *10);
    popMatrix();
    //pop();
  }
  
  public boolean cast(Boundary bound){
    float x1 = bound.p1.x;
    float y1 = bound.p1.y;
    float x2 = bound.p2.x;
    float y2 = bound.p2.y;
    
    float x3 = position.x;
    float y3 = position.y;
    float x4 = position.x + direction.x;
    float y4 = position.y + direction.y;
    
    float denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    if(denominator == 0){
      return(false);
    }
    
    float u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / denominator;
    float t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / denominator;
    
    if(t > 0 && t < 1 && u > 0){
      PVector p = new PVector();
      p.x = x1 + t * (x2 - x1);
      p.y = y1 + t * (y2 - y1);
      setPoint(p);
      return(true);
    }else{
      return(false);
    }
  }
  public void setPoint(PVector p){
    point = p;
  }
  public PVector getPoint(){
    return point;
  }
}
