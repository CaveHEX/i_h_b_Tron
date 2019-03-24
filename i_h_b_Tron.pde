import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;

ArrayList<Bike> bikes = new ArrayList<Bike>();
int num_bikes = 8;

// We're going to draw the sketch on a panel, so that
// the shader doesn't affect the tail
PGraphics pan;

// PostFX is a simple shader library that you can download
// directlty from the Processing IDE
PostFX fx;

void setup() {
  size(768, 768, P2D);
  frameRate(60);
  smooth(8);
  
  pan = createGraphics(width, height, P2D);
  pan.beginDraw();
  pan.background(0);
  pan.noStroke();
  pan.endDraw();
  
  float radius = 9;
  float x = radius + 200;
  float y = radius + 200;
  
  for(int i = 0; i < num_bikes; i++) {
    bikes.add(new Bike(new PVector(x, y), radius));
    x += radius;
    y += radius;
  }
  
  fx = new PostFX(this);
}

void draw() {
  pan.beginDraw();
  pan.fill(0, 0, 0, 10);
  pan.rect(0, 0, width, height);
  
  // this "for each" syntax takes care of what you were doing  
  for ( Bike b : bikes ) {
    b.update();
    b.display();
  }
  pan.endDraw();
  
  // Now that we drew the scene, we can use shaders
  
  fx.render(pan)
  .rgbSplit(20)
  .saturationVibrance(0.4,0.4)
  .blur(9, 0.5)
  .chromaticAberration()
  .compose();
}
