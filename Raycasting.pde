ArrayList<Boundary> bounds;

public void setup(){
  size(800, 800);
  bounds = new ArrayList();
  for(int i = 0; i < 10; i++){
    int x1 = (int)(Math.random() * width);
    int x2 = (int)(Math.random() * width);
    int y1 = (int)(Math.random() * height);
    int y2 = (int)(Math.random() * height);
    bounds.add(new Boundary(x1, y1, x2, y2));
  }
}
public void draw(){
  background(0);
  Particle particle = new Particle();
  for(Boundary b : bounds){
    b.show();
  }
  particle.update(mouseX, mouseY);
  particle.show();
  particle.look(bounds);
}
public void mousePressed(){
  bounds = new ArrayList();
  for(int i = 0; i < 5; i++){
    int x1 = (int)(Math.random() * width);
    int x2 = (int)(Math.random() * width);
    int y1 = (int)(Math.random() * height);
    int y2 = (int)(Math.random() * height);
    bounds.add(new Boundary(x1, y1, x2, y2));
  }
}
