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
