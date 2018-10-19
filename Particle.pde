class Particle {

  PVector velocity;
  float lifespan = 255;
  
  PShape part;
  float partSize;
  
  PVector gravity = new PVector(0,-0.1);

  Particle() {
    partSize = random(10,60);
    part = createShape();
    part.beginShape(QUAD);
    part.noStroke();
    part.texture(sprite);
    part.normal(0, 0, 1);
    part.vertex(-partSize/2, -partSize/2, 0, 0);
    part.vertex(+partSize/2, -partSize/2, sprite.width, 0);
    part.vertex(+partSize/2, +partSize/2, sprite.width, sprite.height);
    part.vertex(-partSize/2, +partSize/2, 0, sprite.height);
    part.endShape();
    part.setTint(color(0));
    
    lifespan=0;
  }

  PShape getShape() {
    return part;
  }
  
  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(3.5,4);
    velocity = new PVector(0, sin(a)); 
    velocity.mult(speed);
    lifespan = random(100);   
    part.resetMatrix();
    //part.setFill(color(0, 0, 255));
    part.translate(x, y); 
  }
  
  boolean isDead() {
    if (lifespan < 0) {
     return true;
    } else {
     return false;
    } 
  }
  

  public void update() {
    lifespan = lifespan - 1;
    PVector jitter = new PVector(random(-.1,.1),0);
    velocity.add(gravity);
    velocity.add(jitter);
    
    //part.setTint(color(255,lifespan));
    part.setTint(color(212, 175, 55, lifespan));
    part.translate(velocity.x, velocity.y);
  }
}