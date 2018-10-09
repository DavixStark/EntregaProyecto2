class personaje{
  
  Body b;
  
  int t;
  int c;
  float x;
  float y;
    
  personaje(float x, float y, int c_){
    t = 15;
    c = c_;
        
    makeBody(new Vec2 (x, y), t);
         
  }
  
  void killB(){
    box2d.destroyBody(b);
  }
  
  
  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(b);
    if(pos.y > height+t*t){
      killB();
      return true;
    }
    return false;
  }
  
  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = b.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  
  void display(){
    
    Vec2 pos = box2d.getBodyPixelCoord(b);
    float a = b.getAngle();
    
    pushMatrix();
    fill(c);
    noStroke();
    translate(pos.x, pos.y);
    rotate(a);
    ellipseMode(PConstants.CENTER);
    ellipse(0,0,t,t);
    popMatrix();  
     x = pos.x;
     y = pos.y;
  }
  
  void makeBody( Vec2 x, int t){
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x));
    b = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float w = box2d.scalarPixelsToWorld(t/2);
    float h = box2d.scalarPixelsToWorld(t/2);
    sd.setAsBox(w, h);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    b = box2d.createBody(bd);
    b.createFixture(fd);
    
    b.setLinearVelocity(new Vec2(random(-5, 5), random(-5, 5)));
    b.setAngularVelocity(random(-5, 5));
           
  }
   
}
