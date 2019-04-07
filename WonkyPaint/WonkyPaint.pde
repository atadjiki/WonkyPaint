import controlP5.*;

ControlP5 controlP5;


void setup() {

  clear();
  size(600, 600); 
  loop();
  fill(fillColor);
  
  ControlSetup();
}

/*
* Drawing Functions
 */

void draw() {

  CheckInputs();
  RandomizeFill();

  for (int i = 0; i < shapes.size(); i++) {

    DrawShape(shapes.get(i));
  }
}
