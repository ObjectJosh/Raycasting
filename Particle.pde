class Particle{
  private PVector position;
  private ArrayList<Ray> rays;
  public Particle(){
    this.position = new PVector(width/2, height/2);
    this.rays = new ArrayList<Ray>();
    for(float angle = 0; angle < 360; angle += 0.5){
      this.rays.add(new Ray(position, radians(angle)));
    }
  }
  public void update(int x, int y){
    position.set(x, y);
  }

  public void look(ArrayList<Boundary> bounds){
    for(Ray ray : rays){
      PVector closest = null;
      float record = Float.POSITIVE_INFINITY;
      for(Boundary bound : bounds){
        boolean seen = ray.cast(bound);
        if(seen){
          PVector point = ray.getPoint();
          float distance = PVector.dist(position, point);
          if(distance < record){
            record = distance;
            closest = point;
          }
        }
      }
      if(closest != null){
        line(position.x, position.y, closest.x, closest.y);
        //pushMatrix(); //
        push();
        fill(0, 255, 0); //
        noStroke(); //
        ellipse(closest.x, closest.y, 2, 2); //
        pop();
        //popMatrix(); //
      }
    }
  }
  public void show(){
    for(Ray ray : rays){
      ray.show();
    }
  }
}
