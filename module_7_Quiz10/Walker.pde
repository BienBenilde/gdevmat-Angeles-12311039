public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float scale = 15;
  public float velocityLimit = 10;
  
  public PVector direction = new PVector();
  
  public float mass = 1;
  
  //random color
  int randomRed = int(random(255));
  int randomGreen = int(random(255));
  int randomBlue = int(random(255));
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // accumulation
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration); // accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(randomRed, randomGreen, randomBlue);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
