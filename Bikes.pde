// Using PVector instead of x and y
// Using color instead of float r, g, b;

class Bike {

  int stage;
  PVector pos;
  float radius;
  color col;
  PVector min, max;
  
  boolean done = false;

  Bike(PVector _pos, float _radius) {
    pos = _pos.copy(); // Using copy because we don't want a reference to _pos
    radius = _radius;
    col = color(random(255), random(255), random(255));
    max = new PVector(width - pos.x, height - pos.y);
    min = new PVector(radius + pos.x, radius + pos.y);
    stage = 0;
  }

  void display() {
    pan.fill(col);
    pan.rect(pos.x, pos.y, radius, radius);
  }

  void update() {

    float step = random(radius*0.2, radius*0.6);
    
    if (stage == 0) {
      pos.x += step;
      if (pos.x >= max.x - (radius * 2)) {
        stage = 1;
      }
    } else if (stage == 1) {
      pos.y += step;
      if (pos.y >= max.y - (radius * 2)) {
        stage = 2;
      }
    } else if (stage == 2) {
      pos.x -= step;
      if (pos.x <= min.x + (radius * 2)) {
        stage = 3;
      }
    } else {
      pos.y -= step;
      if (pos.y <= min.y + (radius * 2)) {
        stage = 0;
        min.y += radius * 2;
        min.x += radius * 2;
        max.y -= radius * 2;
        max.x -= radius * 2;
      }
    }
  }
}
