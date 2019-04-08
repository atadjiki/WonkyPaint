boolean currentStroke = true;
boolean isPressed = false;
boolean grayscale = true;
boolean lockControls = false;
boolean animate = false;
boolean animating = false;

int maxSize = 100;
int minSize = 5;
int currentSize = 50;
int timeStampFill = 0;
int maxStampFill = 60;
int dragResolution = 0;
int drag_count = 0;

color fillColor = color(random(0, 255), random(0, 255), random(0, 255));

ArrayList<ShapeDetail> shapes = new ArrayList<ShapeDetail>();

int framesPerSecond = 0;
int framesToProcess;
int framesProcessed;
int currentFrame = 0;
int maxFrames = 60-framesPerSecond;
int animName = (int) random(1024);

ArrayList<ShapeDetail> toAnimate;

boolean s_pressed;
boolean g_pressed;
boolean shift_pressed;
boolean del_pressed;

int menuBarSize = 100;
