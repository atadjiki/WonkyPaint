import controlP5.*;
ControlP5 controlP5; // controlP5 object

void setup() {

  clear();
  size(600, 600); 
  loop();
  fill(fillColor);
  
  controlP5 = new ControlP5(this);
  controlP5.addBang("bang1",10,10,20,20);
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
