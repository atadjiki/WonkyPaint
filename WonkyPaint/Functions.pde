void RandomizeFill() {

  if (timeStampFill >= maxStampFill) {

    fillColor = color(random(0, 255), random(0, 255), random(0, 255));
    fill(fillColor);
    //consoleText = "\nNew fill: " + fillColor;
    timeStampFill = 0;
  } else {

    timeStampFill++;
  }
}

void ToggleShape() {

  if (shapeType == ShapeType.Circle) {
    shapeType = ShapeType.Rectangle;
    print("Current shape: rectangle\n");
    consoleText = "Current shape: rectangle\n";
  } else if (shapeType == ShapeType.Rectangle) {
    shapeType = ShapeType.Triangle;
    print("Current shape: triange\n");
    consoleText = "Current shape: triange\n";
  } else if (shapeType == ShapeType.Triangle) {
    shapeType = ShapeType.Quad;
    print("Current shape: quad\n");
    consoleText = "Current shape: quad\n";
  } else if (shapeType == ShapeType.Quad) {
    shapeType = ShapeType.Arc;
    print("Current shape: arc\n");
    consoleText = "Current shape: arc\n";
  } else if (shapeType == ShapeType.Arc) {
    shapeType = ShapeType.Circle;
    print("Current shape: circle\n");
    consoleText = "Current shape: circle\n";
  }
}

void DoDelete() {
  if (shapes.size() > 0) {

    shapes.remove(shapes.size()-1); 
    clear();
    draw();
    consoleText = "Deleting last\n";
  }
}

void ToggleStroke() {

  currentStroke = !currentStroke;
  print("Stroke: " + currentStroke + "\n");
  consoleText = "Stroke: " + currentStroke + "\n";
}

void ToggleGrayscale() {
  grayscale = !grayscale;
  print("Grayscale: " + grayscale + "\n");
  consoleText = "Grayscale: " + grayscale + "\n";
}

void DeleteAll() {

  shapes.clear();
  clear();
  setupMenu();
  consoleText = "Deleting all\n";
}

void SetAllStroke() {

  ToggleStroke();
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).stroke = currentStroke;
  }
  consoleText = "Setting stroke for all: " + currentStroke + "\n";
}

void SetAllSize() {

  for (int i = 0; i < shapes.size(); i++) {

    shapes.get(i).size = currentSize;
  }
  consoleText = "Setting size for all: " + currentSize + "\n";
}

void SetAllGrayscale() {

  ToggleGrayscale();
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).grayscale =  grayscale;
  }
  
  consoleText = "Toggling grayscale for all\n";
}

boolean InvokeAnimation() {
  if (!animating) {

    if (shapes.size() <= 0) {
      return false;
    }

    toAnimate = new ArrayList<ShapeDetail>(shapes);

    framesToProcess = 0 + shapes.size();
    framesProcessed = 0;

    shapes.clear();
    clear();

    animating = true;
    animate = true;
    
    print("Starting animation - " + framesToProcess + " frames to process\n");
    print("Animating at " + (60-maxFrames) + " frames per second");
    consoleText = "Starting animation - " + framesToProcess + " frames to process\n" +"Animating at " + (60-maxFrames) + " frames per second";
    
    return true;
  }else{
   return false; 
  }
}
