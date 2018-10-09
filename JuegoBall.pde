import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;
control mouse;
personaje p;

ArrayList<fondo> f;

int pant = 0;

void setup(){
  
  size(1100,700);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,-10);
  
  mouse = new control();
  p = new personaje(random(10,1000),height,#FF0303);
  f = new ArrayList();
  f.add(new fondo(1095,600,5,400));
  f.add(new fondo(1050,600,5,400));
  f.add(new fondo(500,700,1100,10));
  f.add(new fondo(600,0,1200,10));
  f.add(new fondo(0,350,10,800));
  f.add(new fondo(1100,350,10,800));

}

void mouseReleased() {
  mouse.destroy();
}

void mousePressed() {
  if (p.contains(mouseX, mouseY)) {
    mouse.bind(mouseX,mouseY,p);
  }
}

void draw(){
  
  
  
  switch(pant){
    
    case 0:
    background(0);
  pushMatrix();
  fill(random(100,255));
  textSize(100);
  text("Bounce Ball",280,300);
  fill(random(100,255));
  textSize(15);
  text("Enter para continuar",490,450);
  popMatrix();
  if(key == ENTER){    
    pant = 1;
  }
    break;
    
    case 1:
  background(0);
  pushMatrix();
  fill(random(100,255));
  textSize(30);
  text("Instrucciones:",100,150);
  fill(255);
  textSize(20);
  text("Toma la esfera roja con tu cursor y lanzala para acertar en el blanco",100,180);
  fill(random(100,255));
  textSize(15);
  text("Q para continuar",900,650);
  popMatrix();
  if(keyPressed){
  if(key == 'q' || key == 'Q'){    
    pant = 2;
  }
  }
    break;
       
    case 2:
     background(0);
  for (fondo wall: f) {
      wall.display();
    }
    
      box2d.step();
      mouse.update(mouseX,mouseY);
      for(int i=0; i<=20; i++){
      p.display();
      }
      mouse.display();
    if (p.y > 1200){
      pant = 3;
    }
    break;
    
    case 3:
    background(0);
    textSize(50);
     fill(random(100,255));
    text("HAZ GANADO", 380,305);
      textSize(30);
    fill(255,255,255);
    text("Presiona C para volver a inicio",350,600);
    if(key == 'c' || key == 'C'){
      pant = 0;
  }

  }
  
}
