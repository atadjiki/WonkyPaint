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
