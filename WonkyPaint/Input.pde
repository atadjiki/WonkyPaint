void CheckInputs(){
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
}

void ResetKeyVars() {

  if (del_pressed)
    del_pressed = false;
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
    InvokeAnimation();
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
