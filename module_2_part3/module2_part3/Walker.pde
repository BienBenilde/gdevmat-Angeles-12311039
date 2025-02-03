class Walker
{
  float x;
  float y;
  float scale;
  public float tx = 0, ty = 10000;
  public float ts = 0; // scale time
  
  
  
  void render()
  {
   circle(x, y, scale); 
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    scale = map(noise(ts), 0, 1, 5, 150);
    tx += 0.01f;
    ty += 0.01f;
    ts += 0.01f;
  }
}
