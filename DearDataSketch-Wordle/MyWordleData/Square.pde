class Square{
  int size, xPos, yPos;
  color colour;
  String score;
  
  Square(int xPos, int yPos, int size , color colour, String score)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.size = size;
    this.colour = colour;
    this.score = score;
  }
  
  void display(){
    fill(colour);
    rect(xPos, yPos, size, size);
    
    fill(255); // white text  
    textAlign(CENTER, CENTER);
    textFont(font);
    text(score,  xPos + size / 2, yPos + size / 2);
  }
  
  void hoverDisplay(Square square){
    if (cursorOverlapsWith(square))
  {
    fill(100,50,45);
    display();
  }
  
  }
  
  boolean cursorOverlapsWith()
{
  if (((mouseX + size)<= xPos) || (mouseX >= xPos) ||
      ((mouseY+ size) <= yPos) || (mouseY >= yPos))
  {
    return false;
  }
  return true;
}
  
}
