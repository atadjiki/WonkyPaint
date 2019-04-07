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
 
 if(theEvent.getController().getName()=="bang1") {
    background(color(random(0, 255), random(0, 255), random(0, 255)));
 }
 
 } 
}
