Walker myWalker = new Walker();
Walker[] walkers = new Walker[100];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  myWalker.acceleration = new PVector(0.01, 0.1);
  
  for(int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}

void draw()
{
  background(80);
  PVector mouse = mousePos();
  
  renderWalkers(mouse);
}

void renderWalkers(PVector mouse)
{
  for(int i = 0; i < walkers.length; i++)
  {

    walkers[i].render();

    PVector direction = PVector.sub(mouse, walkers[i].position).normalize();
    direction = direction.mult(direction, 0.2);
    walkers[i].velocity = walkers[i].velocity.add(direction);
    walkers[i].update();
    walkers[i].acceleration = walkers[i].velocity.add(direction);
    walkers[i].render();
  }
}
