Walker walker = new Walker();
Walker[] bounceWalkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for(int i = 0; i < bounceWalkers.length; i++)
  {
    int size = i;
    size++;
    bounceWalkers[i] = new Walker();
    bounceWalkers[i].position = new PVector(-500, 200);
    bounceWalkers[i].mass = size;
    bounceWalkers[i].scale = bounceWalkers[i].mass * 15;
  }
}



void draw()
{
  background(80);
  
  renderWalkers(wind, gravity);
  bounce();
  
}
void renderWalkers(PVector wind, PVector gravity)
{
  for(int i = 0; i < bounceWalkers.length; i++)
  {
    bounceWalkers[i].render();
    bounceWalkers[i].update();
    bounceWalkers[i].applyForce(wind);
    bounceWalkers[i].applyForce(gravity);
    
    if(bounceWalkers[i].position.y <= Window.bottom)
    {
      bounceWalkers[i].velocity.y *= -1;
    }
    if(bounceWalkers[i].position.y >= Window.top)
    {
      bounceWalkers[i].velocity.y *= 1;
    }
    if(bounceWalkers[i].position.x >= Window.right)
    {
       bounceWalkers[i].velocity.x *= -1;
    }
    if(bounceWalkers[i].position.x <= Window.left)
    {
       bounceWalkers[i].velocity.x *= 1;
    }
  }
}


void bounce()
{
  if(walker.position.y <= Window.bottom)
  {
    walker.velocity.y *= -1;
  }
  if(walker.position.y >= Window.top)
  {
    walker.velocity.y *= 1;
  }
  if(walker.position.x >= Window.right)
  {
    walker.velocity.x *= -1;
  }
  if(walker.position.x <= Window.left)
  {
    walker.velocity.x *= 1;
  }
}
