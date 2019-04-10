void CheckInputs() {
  if (animate) {

    DoAnimate();
  } else if (shift_pressed && g_pressed) {
    SetAllGrayscale();
    shift_pressed = false;
    g_pressed = false;
    controlP5.get(Toggle.class, "Grayscale").setValue(0.0);
    controlP5.get(Toggle.class, "SHIFT").setValue(0.0);
  } else if (g_pressed) {
    ToggleGrayscale(); 
    g_pressed = false;
    controlP5.get(Toggle.class, "Grayscale").setValue(0.0);
  } else if (shift_pressed && s_pressed) {
    SetAllStroke();
    shift_pressed = false;
    s_pressed = false;
    controlP5.get(Toggle.class, "Stroke").setValue(0.0);
    controlP5.get(Toggle.class, "SHIFT").setValue(0.0);
  } else if (s_pressed) {
    ToggleStroke();
    s_pressed = false;
    controlP5.get(Toggle.class, "Stroke").setValue(0.0);
  } else if (del_pressed && shift_pressed) {
    shift_pressed = false;
    del_pressed = false;
    DeleteAll();
    controlP5.get(Bang.class, "Delete").setValue(0.0);
    controlP5.get(Toggle.class, "SHIFT").setValue(0.0);
  } else if (del_pressed) {
    del_pressed = false;
    DoDelete();
    controlP5.get(Bang.class, "Delete").setValue(0.0);
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

    if (controlP5.get(Bang.class, "Delete").getValue() == 0.0) {
      controlP5.get(Bang.class, "Delete").setValue(1.0);
    }
  } 
  if (key == 's') {
    s_pressed = true;
    print("s\n");

    if (controlP5.get(Toggle.class, "Stroke").getValue() == 0.0) {
      controlP5.get(Toggle.class, "Stroke").setValue(1.0);
    }
  } 
  if (key == 'g') {
    g_pressed = true;
    print("g\n");

    if (controlP5.get(Toggle.class, "Grayscale").getValue() == 0.0) {
      controlP5.get(Toggle.class, "Grayscale").setValue(1.0);
    }
  } 
  if (key == CODED && keyCode == SHIFT) {
    shift_pressed = true;
    print("shift  ");

    if (controlP5.get(Toggle.class, "SHIFT").getValue() == 0.0) {
      controlP5.get(Toggle.class, "SHIFT").setValue(1.0);
    }
  } else if (key == 'b') {
    background(color(random(0, 255), random(0, 255), random(0, 255)));
    print("b\n");
  } else if (key == ENTER) {

    print("enter\n");
    
    
    if(InvokeAnimation()){
     controlP5.get(Toggle.class, "Animate").setLabel("Cancel");
 
    }else{
     if(animating){
       CancelAnimation();
     }
       
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

    if (drag_count >= dragResolution) {
      AddShape();
      drag_count = 0;
    } else {
      drag_count++;
    }
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
