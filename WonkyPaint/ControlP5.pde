void ControlSetup(){
  
   controlP5 = new ControlP5(this);
   controlP5.addBang("Background Color",10,10,20,20); 
  
}



void controlEvent(ControlEvent theEvent) {
 /* events triggered by controllers are automatically forwarded to 
 the controlEvent method. by checking the name of a controller one can 
 distinguish which of the controllers has been changed.
 */ 
 
 /* check if the event is from a controller otherwise you'll get an error
 when clicking other interface elements like Radiobutton that don't support
 the controller() methods
 */
 
 if(theEvent.isController()) { 
 
 print("control event from : "+theEvent.getController().getName());
 println(", value : "+theEvent.getController().getValue());
 
 if(theEvent.getController().getName()=="Background Color") {
    background(color(random(0, 255), random(0, 255), random(0, 255)));
 }
 
 } 
}
