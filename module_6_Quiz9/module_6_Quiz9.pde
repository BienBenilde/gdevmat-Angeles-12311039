Walker[] zoomWalkers = new Walker[8];
PVector wind = new PVector(0.15, 0);
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  int posY = 0;

  // zoom walkers 
  for(int i = 0; i < zoomWalkers.length; i++)
  {
    posY = 2 *(Window.windowHeight/8) * (i - 4);
    int size = 8 - i;
    zoomWalkers[i] = new Walker();
    zoomWalkers[i].position = new PVector(-600, posY);
    zoomWalkers[i].mass = size;
    zoomWalkers[i].scale = zoomWalkers[i].mass * 15;
  }
}


void draw()
{
   background(255);
   stroke(0);
   strokeWeight(4);
   line(0, -360, 0, 360);
 for(Walker w: zoomWalkers)
 {
    //friction = -1 * mew * n * v
    float mew = 0.1f; // coefficient
    if(w.position.x > 0)
    {
      mew = 0.4f;
    }
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy(); // copies current velocity of the walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    PVector acceleration = new PVector(0.2, 0.0);
    w.render();
    w.update();
    w.applyForce(acceleration);
    w.applyForce(friction);    
 }
 
}
void mouseClicked()
{
  frameCount = -1;
}
