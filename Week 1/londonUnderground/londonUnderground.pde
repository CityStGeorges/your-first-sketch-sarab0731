void setup()
{
    size(600, 400);
}
void draw()
{ 
  noStroke();
  fill(245,29,50);
  circle(300,200,300);
  fill(255,255,255);
  circle(300,200,175);
  fill(48,42,101);
  rect(125,175,350,55);
  
  fill(255,255,255);
  stroke(153);
  textSize(44);
  textAlign(CENTER, CENTER);
  //size(400,400);
  PFont font;
  font = createFont("RoyalCrescent-G8BP.ttf", 39);
  textFont(font);
  text("UNDERGROUND",300,200);
}
