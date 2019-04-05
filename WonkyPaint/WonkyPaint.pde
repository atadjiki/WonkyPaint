import controlP5.*;

/*
* Vars
 */

boolean currentStroke = true;
boolean isPressed = false;
boolean grayscale = true;
boolean lockControls = false;
boolean animate = false;
boolean animating = false;

int maxSize = 500;
int minSize = 5;
int currentSize = 50;
int timeStampFill = 0;
int maxStampFill = 60;

color fillColor = color(random(0, 255), random(0, 255), random(0, 255));

ArrayList<ShapeDetail> shapes = new ArrayList<ShapeDetail>();

int framesPerSecond = 120;
int framesToProcess;
int framesProcessed;
int currentFrame = 0;
int maxFrames = 60/framesPerSecond;
int animName = (int) random(1024);

ArrayList<ShapeDetail> toAnimate;

boolean s_pressed;
boolean g_pressed;
boolean shift_pressed;
boolean del_pressed;

void setup() {

  clear();
  size(600, 600); 
  loop();
  fill(fillColor);
}

/*
* Drawing Functions
 */

void draw() {


  RandomizeFill();


  if (animate) {

    DoAnimate();
    
  } else if (shift_pressed && g_pressed) {
    SetAllGrayscale();
    shift_pressed = false;
    g_pressed = false;
  } else if (g_pressed) {
    ToggleGrayscale(); 
    g_pressed = false;
  } else if (shift_pressed && s_pressed) {
    SetAllStroke();
    shift_pressed = false;
    s_pressed = false;
  } else if (s_pressed) {
    ToggleStroke();
    s_pressed = false;
  } else if (del_pressed && shift_pressed) {
    shift_pressed = false;
    del_pressed = false;
    DeleteAll();
  } else if (del_pressed) {
    del_pressed = false;
    DoDelete();
  }
  ResetKeyVars();
  for (int i = 0; i < shapes.size(); i++) {

    DrawShape(shapes.get(i));
  }
}

void ResetKeyVars() {

  if (del_pressed)
    del_pressed = false;
}

void DoAnimate() {
  
  lockControls = true;

  if (currentFrame >= maxFrames) {

    //clear();
    shapes.add(toAnimate.get(framesProcessed));
    print(".");
    framesProcessed++;
    currentFrame = 0;
    save(animName +"/frame" + framesProcessed + ".png");

    if (framesProcessed >= framesToProcess) {
      animating = false; 
      animate = false;
      lockControls = false;
      toAnimate.clear();
      animName = (int) random(0,1024);
      print("\nAnimation complete!\n");
    }
  } else {
    currentFrame++;
  }
}

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

void ToggleStroke() {

  currentStroke = !currentStroke;
  print("Stroke: " + currentStroke + "\n");
}

void ToggleGrayscale() {
  grayscale = !grayscale;
  print("Grayscale: " + grayscale + "\n");
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



void keyPressed() {

  if (key == DELETE || key == BACKSPACE) {
    del_pressed = true;
    print("delete\n");
  } 
  if (key == 's') {
    s_pressed = true;
    print("s\n");
  } 
  if (key == 'g') {
    g_pressed = true;
    print("g\n");
  } 
  if (key == CODED && keyCode == SHIFT) {
    shift_pressed = true;
    print("shift  ");
  } else if (key == 'b') {
    print("b\n");
    background(color(random(0, 255), random(0, 255), random(0, 255)));
  } else if (key == ENTER) {
    print("enter\n");
    if (!animating) {
      
      if(shapes.size() <= 0){
       return; 
      }

      toAnimate = new ArrayList<ShapeDetail>(shapes);

      framesToProcess = 0 + shapes.size();
      framesProcessed = 0;

      shapes.clear();
      clear();

      animating = true;
      animate = true;
      print("Starting animation - " + framesToProcess + " frames to process\n");
    }
  }
}

void keyReleased() {

  if (lockControls) return;
}

void mousePressed() {

  if (lockControls) return;
  isPressed = true;

  if (mouseButton == LEFT) {

    AddShape();
  } else if (mouseButton == RIGHT) {

    ToggleShape();
  }
}

void mouseDragged() 
{
  if (lockControls) return;
  if (mouseButton == LEFT) {

    AddShape();
  }
}


void mouseWheel(MouseEvent event) {

  if (lockControls) return;
  float e = event.getCount();
  if (e < 0) {

    currentSize+=5;
    if (currentSize > maxSize) {
      currentSize = maxSize;
    }
  } else if (e > 0) {

    currentSize-=5;
    if (currentSize < minSize) {
      currentSize = minSize;
    }
  }
}

/*
* Helper Classes
 */

enum ShapeType { 
  Circle, Rectangle, Triangle, Quad, Arc
};
ShapeType shapeType = ShapeType.Circle;

public class ShapeDetail {

  public ShapeType type; 
  public color fill;
  public boolean stroke;
  public float x;
  public float y;
  public int size;
  public boolean grayscale;
}
