class Square {
  int size;
  color colour;
  String score;
  float hoverScale , xPos, yPos;

  Square(float xPos, float yPos, int size, color colour, String score)
  {
    this.xPos = xPos;
    this.yPos = yPos;
    this.size = size;
    this.colour = colour;
    this.score = score;
    this.hoverScale = 1.0;
  }

  void display() {
    noStroke();
    fill(colour);
    rect(xPos, yPos, size, size);

    fill(255); // white text
    textAlign(CENTER, CENTER);
    textFont(franklin_gothic);
    text(score, xPos + size / 2, yPos + size / 2);
  }


  void hoverDisplay() {
    // empty day entries will not have a hover display
    if (cursorOverlapsWith() && !score.equals("")) {
      hoverScale = min(hoverScale +0.01, 1.03);
    } else {
      hoverScale = max(hoverScale -0.005, 1.0);
    }

    float animatedSize = size * hoverScale;
    float offset = (animatedSize - size) / 2; // offset to keep square centered

    fill(colour);
    rect(xPos - offset, yPos - offset, animatedSize, animatedSize);

    fill(255); // white text
    textAlign(CENTER, CENTER);
    textFont(franklin_gothic);
    textSize(47);
    text(score, xPos + size / 2, yPos + size / 2);
  }

  void clickedDisplay() {
    // Display the square with a highlighted effect when clicked
    noStroke();
    fill(colour);
    rect(xPos, yPos, size, size);

    fill(255); // White text
    textAlign(CENTER, CENTER);
    textFont(franklin_gothic);
    text(score, xPos + size / 2, yPos + size / 2);

    fill(255, 255, 255, 100); // Add some transparency for effect
    rect(xPos, yPos, size, size); // Highlight the square 
  }
  
void minigameDisplay(color[] colours) {
    noStroke();
    
    int columns = 7; // Number of columns in the grid (adjust as needed)
    int xStart = 100; // Starting X position for the grid
    int yStart = 100; // Starting Y position for the grid
    int counter = 0;  // Keep track of the current rectangle index

    for (color minigame : colours) {
        fill(minigame);
        int xPos = xStart + (counter % columns) * (size / 4 ); // Calculate X based on column
        int yPos = yStart + (counter / columns) * (size / 4 ); // Calculate Y based on row
        rect(xPos, yPos, size / 2, size / 2);
        counter++;
    }

    // Display the score in the center of the grid
    fill(255); // White text
    textAlign(CENTER, CENTER);
    textFont(franklin_gothic);
    text(score, xStart + (size / 2), yStart + (size / 2));
}

  
  
  
  void timeDisplay(){
    
  }
  
  Square findSquareAt(float x, float y, Square[] squares) {
  for (Square square : squares) {
    if (square != null && square.xPos == x && square.yPos == y) {
      return square;
    }
  }
  return null; // No square found at (x, y)
}

  
  boolean cursorOverlapsWith() {
    // Check if the mouse cursor is within the bounds of this square
    return mouseX >= xPos && mouseX <= xPos + size &&
      mouseY >= yPos && mouseY <= yPos + size;
  }
  
}
