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
      controlP5.get(Toggle.class, "Animate").setLabel("Animate");
      controlP5.get(Toggle.class, "Animate").setValue(0.0);
      print("\nAnimation complete!\n");
      consoleText = "\nAnimation complete!\n";
    }
  } else {
    currentFrame++;
  }
}

void CancelAnimation(){
  
      animating = false; 
      animate = false;
      lockControls = false;
      shapes.clear();
      shapes.addAll(toAnimate);
      toAnimate.clear();
      animName = (int) random(0,1024);
      print("\nAnimation cancelled!\n");
      consoleText = "\nAnimation cancelled!\n";
  
}
