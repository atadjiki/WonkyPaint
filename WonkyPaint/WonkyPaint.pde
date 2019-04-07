import controlP5.*;

ControlP5 controlP5;

void setup() {

  
  clear();
  size(600, 600); 
  loop();
  
  setupMenu();
  
  fill(fillColor);
  
  ControlSetup();
}

void draw() {

  CheckInputs();
  RandomizeFill();

  for (int i = 0; i < shapes.size(); i++) {

    DrawShape(shapes.get(i));
  }
  
  setupMenu();
}

void setupMenu(){
 
  fill(color(0,0,0));
  stroke(color(255, 255, 255));
  rect(0,0, 600, menuBarSize);
}
