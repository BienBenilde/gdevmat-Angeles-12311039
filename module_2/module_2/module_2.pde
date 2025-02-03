void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); // makes an instance

Walker biasedWalker = new Walker(); // walker using biased move function

void draw()
{
  int randomRed = int(random(255));
  int randomGreen = int(random(255));
  int randomBlue = int(random(255));
  int randomAlpha = int(random(50, 100));
  //color for walker
  fill(randomRed,randomGreen,randomBlue,randomAlpha);
  myWalker.randomWalk();
  myWalker.render();
  
  
  //color for biased walker
  biasedWalker.randomWalk();
  biasedWalker.render();
}
