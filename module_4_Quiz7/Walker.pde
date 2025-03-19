public class Walker
{
  public PVector position = new PVector(random(-640, 640), random(-360, 360));
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public int scale = int(random(15, 30));
  public float velocityLimit = 7;
  
  public PVector direction = new PVector();
  
  public Walker()
  {
    
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  public void render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    if(this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    if(this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
}
