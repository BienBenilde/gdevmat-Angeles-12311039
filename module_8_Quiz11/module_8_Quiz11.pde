Walker[] halfMatter = new Walker[10];
Walker[] otherMatter = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for(int i = 0; i < halfMatter.length; i++)
  {
    halfMatter[i] = new Walker();
    halfMatter[i].position = new PVector(random(-640, 640), random(-360, 360));
    halfMatter[i].mass = random(5, 10);
    halfMatter[i].scale = halfMatter[i].mass * random(7, 15);
  }
  
  for(int i =0; i < otherMatter.length; i++)
  {
    otherMatter[i] = new Walker();
    otherMatter[i].position = new PVector(random(-640, 640), random(-360, 360));
    otherMatter[i].mass = random(5, 10);
    otherMatter[i].scale = otherMatter[i].mass * random(5, 18);
  }

}



void draw()
{
  background(255);
  for(Walker w: halfMatter)
  {
    w.render();
    w.update();
    
    for(Walker o: otherMatter)
    {
      o.render();
      o.update();
      if(w != o)
      {
        w.applyForce(o.calculateAttraction(w));
        o.applyForce(w.calculateAttraction(o));
      }
      
    }
  }
}
