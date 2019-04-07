boolean verifyBounds(int x, int y){
  
  if(y < menuBarSize*1.25){
    return false;
  }
  
  return true;
}

void ControlSetup(){
  
   controlP5 = new ControlP5(this);
   // parameters : name, x, y, width, height
   controlP5.addBang("Background Color",20,10,20,20); 
   controlP5.addBang("Animate",100,10,20,20); 
   controlP5.addToggle("Grayscale", 150, 10, 20, 20);
   controlP5.addToggle("Stroke", 200, 10, 20, 20);
   
   // parameters : name, minimum, maximum, default value (float), x, y, width, height
   controlP5.addSlider("Size",minSize,maxSize,50,20,75,100,10);
   controlP5.addBang("Clear",150,60,20,20); 
  
}



void controlEvent(ControlEvent e) {

 if(e.isController()) { 
 
 print("control event from : "+e.getController().getName());
 println(", value : "+e.getController().getValue());
 
 if(e.getController().getName()=="Background Color") {
    background(color(random(0, 255), random(0, 255), random(0, 255)));
 }
 else if(e.getController().getName()=="Animate") {
    InvokeAnimation();
 }
 else if(e.getController().getName()=="Grayscale") {
    ToggleGrayscale();
 }
 else if(e.getController().getName()=="Size"){
    currentSize = (int) e.getController().getValue(); 
 }
else if(e.getController().getName()=="Stroke"){
    ToggleStroke();
 }else if(e.getController().getName()=="Clear"){
   DeleteAll();
 }
 
 } 
}
