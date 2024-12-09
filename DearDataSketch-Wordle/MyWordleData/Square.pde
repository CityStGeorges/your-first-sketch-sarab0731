class Square {
  int size, xPos, yPos;
  color colour;
  String score;
  float hoverScale;

  Square(int xPos, int yPos, int size, color colour, String score)
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
    textFont(font);
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
    textFont(font);
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
    textFont(font);
    text(score, xPos + size / 2, yPos + size / 2);

    fill(255, 255, 255, 100); // Add some transparency for effect
    rect(xPos, yPos, size, size); // Highlight the square 
  }


  boolean cursorOverlapsWith() {
    // Check if the mouse cursor is within the bounds of this square
    return mouseX >= xPos && mouseX <= xPos + size &&
      mouseY >= yPos && mouseY <= yPos + size;
  }
}
