class Particle {
  float x, y, r;
  int lifeTime;
  PVector pos, ppos, vel, acc, cntr;
  boolean os;
  color c;
  float op;


  Particle() {
    x = random(width);
    y = random(height);
    r = 0;
    cntr = the_cntr.pos.copy();
    pos = new PVector(x, y);
    ppos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    lifeTime = 0;
    op = 0;
    if (random(100) < 15) {    
      if (random(100) < 90) {        
        c = color(255, 0, 100);
      } else {
        c = color(100, 0, 255);
      }
    } else {
      c = color(255);
    }
  }


  void show() {
    stroke(c, op);
    strokeWeight(2);
    line(ppos.x, ppos.y, pos.x, pos.y);
  }


  void update() {
    ppos = pos.copy();
    acc = pos.copy();
    acc.sub(cntr);
    acc.div(200);
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);  
    lifeTime++;
    if (r < 6) {
      r+= .1;
    }
    if (op < 255) {
      op += 10;
    }
  }


  boolean isOffScreen() {
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      return true;
    } else {
      return false;
    }
  }
}