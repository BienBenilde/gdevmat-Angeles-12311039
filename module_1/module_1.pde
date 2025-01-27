  float frequency = 0.1;
  float amplitude =  50.0;
  float time = 0.0;
  float dt = 0.1;
void setup()
{
  size(1280, 720, P3D); // sets the screen size
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
}

void draw() // updates every frame
{
  background(0);
  
  //circle(0, 0, 15);
  
  strokeWeight(2); // changes thickness of the line below
  //color white = color(255, 255, 255); // declare a color variable
  //fill(white); // fills with color
  //stroke(white); // all strokes will be with the selected color
  //line(-75, -75, 75, 75);
  
drawCartesianPlane();
drawLinearFunction();
drawQuadraticFunction();
drawCircle();
drawSinWave();
}

void drawCartesianPlane()
{
strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line (300, 0, -300, 0);
  line (0, 300, 0, -300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }

}

void drawLinearFunction()
{
  /* Example
  f(x) = x + 2
  let x be 4, y = 6
  let x be -5, y = -3  
  */
  /*
  FOR QUIZ 1:
  f(x) = -5x + 30
  */
  color red = color(255, 0, 0);
  fill(red);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, x+2, 5);
  }
  
  // QUIZ 1
  color purple = color(255, 0, 255);
  fill(purple);
  noStroke();
  for(int x = -200; x <= 200; x++)
  {
    circle(x, (x * -5) + 30, 5);
  }
}

void drawQuadraticFunction()
{
  /* Example
  f(x) = x^2 + 2x - 5
  let x be 2, y = 3
  let x be -1, y = -6  
  */
  /*
  FOR QUIZ 1:
  f(x) = x^2 - 15x - 3
  */
  color green = color(0, 255, 0);
  fill(green);
  stroke(green);
  for (float x = -300; x <= 300; x +=0.1f)
  {
    circle(x * 10, ((float)Math.pow(x, 2) + (x*2) - 5), 5);
  }
  //QUIZ 1: f(x) = x^2 - 15x - 3
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  for (float x = -300; x <= 300; x +=0.1f)
  {
    circle(x, ((float)Math.pow(x, 2) - (x*15) - 3), 5);
  }
}

void drawCircle()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle ((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
  
}

void drawSinWave()
{
  color blue = color(0, 0, 255);
  fill(blue);
  stroke(blue);
  for (int x = -300; x <= 300; x++)
  {
    circle(x, (amplitude*(float)Math.sin(frequency*(time + x))), 5);
    time +=dt;
  }
  
}
