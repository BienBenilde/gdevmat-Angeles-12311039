void setup()
{
  size(1280, 720, P3D); // sets the screen size
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

Walker perlinWalker = new Walker();

  // random colors using perlin noise
  float tr = 0;
  float tg = 0;
  float tb = 0;
  int randRed;
  int randGreen;
  int randBlue;
void draw()
{

  // maps the values
  randRed = int(map(noise(tr),0,1,0,255));
  randGreen = int(map(noise(tg), 0, 1, 0, 255));
  randBlue = int(map(noise(tb), 0, 1, 0, 255));
  //increments the time for the colors;
  tr += 0.9f;
  tg += 0.6f;
  tb += 0.3f;
  //println(randRed,randGreen,randBlue); //shows the value of the colors
  noStroke();
  fill(randRed,randGreen,randBlue);
  perlinWalker.render();
  perlinWalker.perlinWalk();
}
