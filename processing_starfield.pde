ArrayList<Particle> p;
CenterMover the_cntr;

void setup() {
  size(1280, 720);
  p = new ArrayList<Particle>();
  the_cntr = new CenterMover(width/2, height/2);
}


void draw() {
  background(0);
  for (int i = 0; i < 100; i++) {
    p.add(new Particle());
  }
  for (Particle i : p) {
    i.update();
    i.show();
  }
  killParticles();

  PVector xy = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
  the_cntr.applyForce(xy);
  the_cntr.update();
  the_cntr.edges();
  //the_cntr.show();
  
  if (frameCount < 300) {
    //saveFrame("render/starfield_frame_####.png");
  }
}


void killParticles() {
  for (int i = p.size() - 1; i >=0; i--) {
    if (p.get(i).isOffScreen()) {
      p.remove(i);
    }
  }
}