  Walker blackHole = new Walker();
  Walker otherMatter = new Walker();
  Walker[] matter = new Walker[100];

  int time = 0;
  PVector position = new PVector(random(-640, 640), random(-360, 360));

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  for(int i = 0; i < matter.length; i++)
  {
    matter[i] = new Walker();
  }
}

void draw()
{
  background(0);
  noStroke();
  PVector direction = PVector.sub(blackHole.position, otherMatter.oPosition);
  otherMatter.velocity = otherMatter.velocity.add(direction);
  otherMatter.update();
  otherMatter.renderOtherMatter();
  
  renderMatter();
  
  fill(255, 255, 255);
  blackHole.update();
  renderBlackHole();
  blackHole.render(position);
  
  countTime();
}

void renderMatter()
{
  for(int i = 0; i < matter.length; i++)
  {
    matter[i].renderOtherMatter();
    if (time ==0)
    {
      matter[i] = new Walker();
      matter[i].renderOtherMatter();
    }
    else if(time > 0)
    {
      PVector direction = PVector.sub(blackHole.position, matter[i].oPosition);
      matter[i].update();
      matter[i].move(direction);
      matter[i].velocity = matter[i].velocity.add(direction);
    }
    
  }
}

void countTime()
{
  if(time > 300)
  {
    background(150);
    time = 0;
  }
  else
  {
    time++;
  }
}
void renderBlackHole()
{
  blackHole.render(position);
  if(time == 0)
  {
    blackHole.position = new PVector(random(-640, 640), random(-360, 360));
  }
  
}
