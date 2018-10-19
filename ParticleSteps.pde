// Particles, by Daniel Shiffman.

ParticleSystem ps;
PImage sprite;  
float partitionWidth;
int lastSpawnMillis = 0;
int spawnFrequency = 100; // millis

boolean isMouse, isSpace, isA, isS, isD, isF;

void setup() {
  fullScreen(P2D);
  //size(1024, 768, P2D);
  orientation(LANDSCAPE);
  sprite = loadImage("sprite.png");
  ps = new ParticleSystem(2500);

  partitionWidth = width/6;
  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
  background(0);
  //frameRate(45);
} 

void draw () {
  background(0);
  ps.update();
  ps.display();
  
  int now = millis();
  if (now-spawnFrequency > lastSpawnMillis) {
    if (isMouse) {
        ps.setEmitter(random(0, partitionWidth), height);
    } 
    if (isA) {
        ps.setEmitter(random(partitionWidth+1, partitionWidth*2), height);
    }
    if (isS) {
        ps.setEmitter(random(partitionWidth*2+1, partitionWidth*3), height);
    }
    if (isD) {
        ps.setEmitter(random(partitionWidth*3+1, partitionWidth*4), height);
    }
    if (isF) {
        ps.setEmitter(random(partitionWidth*4+1, partitionWidth*5), height);
    }
    if (isSpace) {
        ps.setEmitter(random(partitionWidth*5+1, partitionWidth*6), height);
    }
    lastSpawnMillis = now;
  }
  fill(255);
}

void keyPressed() {
  setKey(key, true);
}
 
void keyReleased() {
  setKey(key, false);
}
 

void mousePressed() {
  isMouse = true;  
}

void mouseReleased() {
  isMouse = false;  
}

boolean setKey(char k, boolean b) {
  switch (k) {
 
  case 'a':
    return isA = b;
 
  case 's':
    return isS = b;
 
  case 'd':
    return isD = b;
    
  case 'f':
    return isF = b;

  case ' ':
    return isSpace = b;
    
  default:
    return b;
  }
}