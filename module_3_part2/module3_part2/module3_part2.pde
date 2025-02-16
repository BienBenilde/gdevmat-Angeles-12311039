void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}


void draw()
{
  //println(mousePos().x + " " + mousePos().y);
  background(130);
  
  PVector mouse = mousePos();

  // Red outer glow
  mouse.normalize().mult(450);
  strokeWeight(19);
  stroke(255, 0, 0);
  line (0, 0, mouse.x, mouse.y);
  line (0, 0, -mouse.x, -mouse.y);
  // White inner glow
  mouse.normalize().mult(450);
  strokeWeight(8);
  stroke(255, 255, 255);
  line (0, 0, mouse.x, mouse.y);
  line (0, 0, -mouse.x, -mouse.y);
  // Lightsaber Handle
  strokeWeight(17);
  stroke(0, 0, 0);
  mouse.normalize().mult(55);  
  line (0, 0, mouse.x, mouse.y);
  println(mouse.mag());
  line (0, 0, -mouse.x, -mouse.y);

}
