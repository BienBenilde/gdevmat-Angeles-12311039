void setup()
{
  size(1020, 720, P3D); // sets the screen size
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  // random Gaussian for x coordinate
  float gaussian = randomGaussian();
  
  float standardDeviation = 100;
  float mean = 0;
  
  float x = standardDeviation * gaussian + mean;
  
  //random value for y coordinate
  int y = int(random(-360, 360));
  
  // random Gaussian for circle scale/thickness
  float gaussianScale = randomGaussian();
  float scaleStandardDeviation = 50;
  float meanScale = 10;
  
  float scale = scaleStandardDeviation * gaussianScale + meanScale;
  
  //random colors and alpha
  int randomRed = int(random(255));
  int randomGreen = int(random(255));
  int randomBlue = int(random(255));
  int randomAlpha = int(random(10, 100));
  
  
  noStroke();
  fill(randomRed, randomGreen, randomBlue, randomAlpha);
  circle(x, y, scale);
  //circle(0, 360, 30);// top of screen
  //circle(0, -360, 30); // bottom of screen
}
