boolean verifyBounds(int x, int y) {

  if (y < menuBarSize*1.25) {
    return false;
  }

  return true;
}

boolean shiftDown = false;

void ControlSetup() {

  controlP5 = new ControlP5(this);
  // parameters : name, x, y, width, height
  controlP5.addBang("Background Color", 20, 10, 20, 20); 
  controlP5.addToggle("Grayscale", true, 100, 10, 20, 20);
  controlP5.addBang("Delete", 150, 10, 20, 20); 
  controlP5.addToggle("Stroke", true, 180, 10, 20, 20);
  controlP5.addToggle("SHIFT", false, 220, 10, 40, 40);


  controlP5.addBang("Animate", 480, 20, 20, 50); 
  // parameters : name, minimum, maximum, default value (float, x, y, diameter
  controlP5.addKnob("Frame Rate", 1, 60, 30, 525, 20, 50);

  // parameters : name, minimum, maximum, default value (float), x, y, width, height
  controlP5.addSlider("Size", minSize, maxSize, 50, 20, 75, 100, 10);
  controlP5.addSlider("Drag Resolution", 0, 100, 0, 150, 75, 100, 10);
}

void controlEvent(ControlEvent e) {

  if (e.isController()) { 

    print("control event from : "+e.getController().getName());
    println(", value : "+e.getController().getValue());

    if (e.getController().getName()=="Background Color") {
      background(color(random(0, 255), random(0, 255), random(0, 255)));
    } else if (e.getController().getName()=="Animate") {
      InvokeAnimation();
    } else if (e.getController().getName()=="Grayscale") {
      if (shiftDown) {
        SetAllGrayscale();
      } else { 
        ToggleGrayscale();
      }
    } else if (e.getController().getName()=="Size") {
      currentSize = (int) e.getController().getValue();
    } else if (e.getController().getName()=="Drag Resolution") {
      dragResolution = (int) e.getController().getValue();
    } else if (e.getController().getName()=="Stroke") {
      if (shiftDown) {
        SetAllStroke();
      } else {
        ToggleStroke();
      }
    } else if (e.getController().getName()=="Delete") {
      if(shiftDown){
        DeleteAll();
      }else{
        DoDelete();
      }
      
    } else if (e.getController().getName()=="Frame Rate") {
      framesPerSecond = (int) e.getController().getValue();
      maxFrames = (30/framesPerSecond);
    } else if (e.getController().getName()=="SHIFT") {
      shiftDown = !shiftDown;
    }
  }
}
