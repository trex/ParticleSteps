class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<Particle> deadParticles;

  PShape particleShape;
  int numParticles;

  ParticleSystem(int n) {
    numParticles = n;
    particles = new ArrayList<Particle>();
    deadParticles = new ArrayList<Particle>();
    particleShape = createShape(PShape.GROUP);

    for (int i = 0; i < n; i++) {
      Particle p = new Particle();
      deadParticles.add(p);
      particleShape.addChild(p.getShape());
    }
  }

  void update() {
    for (int i = 0; i < particles.size(); i++) {
      Particle p = particles.get(i);
      if (p.isDead()) {
        particles.remove(i);
        deadParticles.add(p);
      }
      p.update();
    }
  }

  void setEmitter(float x, float y) {
    //while (emitting) {
      int particlesToAdd = numParticles/10;
      for (int i = 0; i < particlesToAdd && i < deadParticles.size(); i++) {
          Particle p = deadParticles.get(i);
          
          p.rebirth(x, y);
          particles.add(p);
          deadParticles.remove(i);
      }
    //}
  }

  void display() {
    shape(particleShape);
  }
}