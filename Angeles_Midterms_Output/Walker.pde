class Walker
{
  public PVector position = new PVector(random(-640, 640), random(-360, 360));
  PVector speed =  new PVector(5, 5);
  public PVector velocity = new PVector();
  public float velocityLimit = 7;
  float scale = 50;
  
  // other matter
  // gaussian values for the other matter
  float gaussian = randomGaussian();
  float standardDeviation = 200;
  float mean = 0;
  public PVector oPosition = new PVector(standardDeviation * gaussian + mean, random(-360, 360));
  PVector direction = PVector.sub(oPosition, position);
  //scale
  float gaussianScale = randomGaussian();
  float scaleStandardDeviation = 15;
  float meanScale = 15;
  float oScale = scaleStandardDeviation * gaussianScale + meanScale;
  //random colors
  int randomRed = int(random(255));
  int randomGreen = int(random(255));
  int randomBlue = int(random(255));
  
  Walker()
  {
    position = new PVector();
  }
  
  
  
  public void update()
  {
    this.velocity.normalize();
    this.position.add(this.velocity);
    this.velocity.limit(velocityLimit);
    this.oPosition.add(this.velocity);
  }
  
  void render(PVector pos)
  {
   circle(position.x, position.y, scale); 
  }
  

  void renderOtherMatter()
  {
    fill(randomRed,randomGreen,randomBlue);
    circle(oPosition.x, oPosition.y, oScale);
  }
  
  public void move(PVector direction)
  {
    direction.normalize();
    this.speed.add(direction);
    this.position.add(speed);
    
  }
  
}
