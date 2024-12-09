class Button {
  int size, xPos, yPos;
  color colour;
  
  Button(int xPos, int yPos, int size, color colour)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.size = size;
    this.colour = colour;
  }
  
  boolean cursorOverlapsWith() {
    // Check if the mouse cursor is within the bounds of this square
    return mouseX >= xPos && mouseX <= xPos + size &&
      mouseY >= yPos && mouseY <= yPos + size;
  }
}
