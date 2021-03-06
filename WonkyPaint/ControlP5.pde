boolean shiftDown = false;
color activeColor = color(204, 51, 0);

String grayscaleName = "Grayscale";
String deleteName = "Delete";
String strokeName = "Stroke";
String sizeName = "Size";


String consoleText = "Wonky Paint";

void ControlSetup() {

  controlP5 = new ControlP5(this);
  // parameters : name, x, y, width, height
  controlP5.addBang("Background Color", 20, 10, 20, 20).setColorActive(activeColor);
  controlP5.addToggle(grayscaleName, grayscale, 110, 10, 20, 20).setColorActive(activeColor);
  controlP5.addBang(deleteName, 180, 10, 20, 20).setColorActive(activeColor);
  controlP5.addToggle(strokeName, currentStroke, 230, 10, 20, 20).setColorActive(activeColor);
  controlP5.addBang("Clear", 280, 10, 20, 20).setColorActive(activeColor);

  controlP5.addToggle("SHIFT", shiftDown, 400, 20, 60, 60).setColorActive(activeColor);


  controlP5.addToggle("Animate", false, 480, 20, 20, 50).setColorActive(activeColor);
  // parameters : name, minimum, maximum, default value (float, x, y, diameter
  controlP5.addKnob("Frame Rate", 0, 59, 30, 525, 20, 50).setColorActive(activeColor);

  // parameters : name, minimum, maximum, default value (float), x, y, width, height
  controlP5.addSlider(sizeName, minSize, maxSize, 50, 20, 75, 100, 10).setColorActive(activeColor);
  controlP5.addSlider("Drag Resolution", 0, 20, 0, 170, 75, 100, 10).setColorActive(activeColor);

  controlP5.addTextlabel("Console")  
    .setPosition(10, 660)             
    .setSize(600, 40)
    .setText(consoleText)            
    ;
}

void controlEvent(ControlEvent e) {

  if (e.isController()) { 

    print("control event from : "+e.getController().getName());
    println(", value : "+e.getController().getValue());

    if (e.getController().getName()=="Background Color") {
      background(color(random(0, 255), random(0, 255), random(0, 255)));
    } else if (e.getController().getName()=="Animate") {
      if (e.getController().getValue() == 1.0) {
        if (InvokeAnimation()) {
          e.getController().setLabel("Cancel");
        } else {
          e.getController().setValue(0.0);
        }
      } else {

        if (animating) {
          CancelAnimation();
          e.getController().setLabel("Animate");
        }
      }
    } else if (e.getController().getName()==grayscaleName) {
      if (shiftDown) {
        SetAllGrayscale();
      } else { 
        ToggleGrayscale();
      }
    } else if (e.getController().getName()==sizeName) {
      if (shiftDown) {
        currentSize = (int) e.getController().getValue();
        SetAllSize();
      } else {
        currentSize = (int) e.getController().getValue();
      }
    } else if (e.getController().getName()=="Drag Resolution") {
      dragResolution = (int) e.getController().getValue();
    } else if (e.getController().getName()==strokeName) {
      if (shiftDown) {
        SetAllStroke();
      } else {
        ToggleStroke();
      }
    } else if (e.getController().getName()==deleteName) {
      if (shiftDown) {
        DeleteAll();
      } else {
        DoDelete();
      }
    } else if (e.getController().getName()=="Frame Rate") {
      framesPerSecond = (int) e.getController().getValue();
      maxFrames = 60 - framesPerSecond;
    } else if (e.getController().getName()=="SHIFT") {
      shiftDown = !shiftDown;
      UpdateControlNames();
    } else if (e.getController().getName()=="Clear") {
      clear();
      draw();
    }
  }
}

boolean verifyBounds(int x, int y) {

  if (y < menuBarSize*1.25) {
    return false;
  } else if ( y > 650) {
    return false;
  }

  return true;
}

void UpdateControlNames() {

  if (shiftDown) {
    controlP5.get(Toggle.class, grayscaleName).setLabel("Grayscale All");
    controlP5.get(Bang.class, deleteName).setLabel("Delete All");
    controlP5.get(Toggle.class, strokeName).setLabel("Stroke All");
    controlP5.get(Slider.class, sizeName).setLabel("Size All");
  } else {
    controlP5.get(Toggle.class, grayscaleName).setLabel("Grayscale");
    controlP5.get(Bang.class, deleteName).setLabel("Delete");
    controlP5.get(Toggle.class, strokeName).setLabel("Stroke");
    controlP5.get(Slider.class, sizeName).setLabel("Size");
  }
}
