void AddShape() {

  ShapeDetail newShape = new ShapeDetail();

  newShape.type = shapeType;
  newShape.x = mouseX;
  newShape.y = mouseY;
  newShape.size = currentSize;

  newShape.fill = fillColor;

  newShape.stroke = currentStroke;
  newShape.grayscale = grayscale;

  shapes.add(newShape);
}

void DrawShape(ShapeDetail detail) {


  if (!detail.grayscale) {

    fill(detail.fill);
  } else {
    float redVal = red(detail.fill);
    float greenVal = green(detail.fill);
    float blueVal = blue(detail.fill);

    int grayVal = (int)(redVal + greenVal + blueVal)/3;

    fill(color(grayVal, grayVal, grayVal));
  }



  if (detail.stroke) {
    stroke(0, 0, 0);
  } else {
    noStroke();
  }


  if (detail.type == ShapeType.Circle) {
    ellipse(detail.x, detail.y, detail.size, detail.size);
  } else if (detail.type == ShapeType.Rectangle) {
    rect(detail.x, detail.y, detail.size, detail.size);
  } else if (detail.type == ShapeType.Triangle) {
    triangle(detail.x-detail.size, detail.y, detail.x, detail.y+detail.size, detail.x, detail.y);
  } else if (detail.type == ShapeType.Quad) {
    quad(detail.x, detail.y, detail.x+detail.size, detail.y, detail.x-detail.size, detail.y-detail.size, detail.x, detail.y+detail.size);
  } else if (detail.type == ShapeType.Arc) {
    arc(detail.x, detail.y, detail.size, detail.size, 0, 3);
  }
}
