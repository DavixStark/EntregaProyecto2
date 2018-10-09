class fondo{
  
  float x;
  float y;
  float w;
  float h;
  int c = 0;
  float dt;
  
  Body b1;

  fondo(float x_,float y_, float w_, float h_) {
    
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    PolygonShape sd = new PolygonShape();
    float bw = box2d.scalarPixelsToWorld(w/2);
    float bh = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(bw, bh);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b1 = box2d.createBody(bd);
    
    b1.createFixture(sd,1);
    
  }
  
  void display() {
    
    strokeWeight(1);
    rectMode(CENTER);
    pushMatrix();
    fill(255);
    stroke(255);
    rect(x,y,w,h);
    popMatrix();
    
  }
  
}
