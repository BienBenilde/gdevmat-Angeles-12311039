Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] sinkWalker = new Walker[10];
//PVector wind = new PVector(0.1, 0);
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  float posX = 0;
  for(int i = 0; i < sinkWalker.length; i++)
  {
    posX = 2 *(Window.windowWidth/10) * (i - 4.5);
    int size = 10 - i;
    sinkWalker[i] = new Walker();
    sinkWalker[i].position = new PVector(posX, 300);
    sinkWalker[i].mass = size;
    sinkWalker[i].scale = sinkWalker[i].mass * 10;
  }
  
}

void draw()
{
  background(255);
 
  ocean.render();
  // sinking stuff
  for(Walker w: sinkWalker)
  {
    w.render();
    w.update();
    
    PVector gravity = new PVector(0, -0.15 * w.mass);
    PVector wind = new PVector(0.1, 0);
    w.applyForce(gravity); // apply gravity
    w.applyForce(wind); // apply wind
    
    // friction
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    // f = -uNv
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // apply friction
    
    if(w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    if(w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    if(ocean.isCollidingWith(w))
    {
      //println("Colliding");
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
void mouseClicked()
{
  frameCount = -1;
}
