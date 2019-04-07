void RandomizeFill() {

  if (timeStampFill >= maxStampFill) {

    fillColor = color(random(0, 255), random(0, 255), random(0, 255));
    fill(fillColor);
    timeStampFill = 0;
  } else {

    timeStampFill++;
  }
}

/*
* Bools
 */

void ToggleShape() {

  if (shapeType == ShapeType.Circle) {
    shapeType = ShapeType.Rectangle;
    print("Current shape: rectangle\n");
  } else if (shapeType == ShapeType.Rectangle) {
    shapeType = ShapeType.Triangle;
    print("Current shape: triange\n");
  } else if (shapeType == ShapeType.Triangle) {
    shapeType = ShapeType.Quad;
    print("Current shape: quad\n");
  } else if (shapeType == ShapeType.Quad) {
    shapeType = ShapeType.Arc;
    print("Current shape: arc\n");
  } else if (shapeType == ShapeType.Arc) {
    shapeType = ShapeType.Circle;
    print("Current shape: circle\n");
  }
}



/*
* Input Stuff
 */

void DoDelete() {
  if (shapes.size() > 0) {

    shapes.remove(shapes.size()-1); 
    clear();
    draw();
  }
}

void ToggleStroke() {

  currentStroke = !currentStroke;
  print("Stroke: " + currentStroke + "\n");
}

void ToggleGrayscale() {
  grayscale = !grayscale;
  print("Grayscale: " + grayscale + "\n");
}

void DeleteAll() {

  shapes.clear();
  clear();
}

void SetAllStroke() {

  ToggleStroke();
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).stroke = currentStroke;
  }
}

void SetAllGrayscale() {

  ToggleGrayscale();
  for (int i = 0; i < shapes.size(); i++) {
    shapes.get(i).grayscale =  grayscale;
  }
}