class Walker
{
  PVector position = new PVector();
  PVector speed =  new PVector(5, 8);
  float scale = 50;
  
  void render()
  {
   circle(position.x, position.y, scale); 
  }
  
  void moveAndBounce()
  {
    //add speed to current position
    position.add(speed);
    //condition for bouncing
    if ((position.x > Window.right)|| (position.x < Window.left))
    {
      speed.x *= -1;
    }
    if ((position.y > Window.top)|| (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}
