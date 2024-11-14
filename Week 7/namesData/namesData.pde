// -- A global variable - an array of Strings
String[] names; // <-- This is where we will store lines of data from the text file.

void setup()
{
  size(800, 500);
  fill(64);
  textSize(16);  // -- try changing the size of any text added with text();

  // -- load the text from the file into the array:
  names = loadStrings("namesData.txt");
}

void draw()
{
  background(255);

  for (int lineNum = names.length - 1; lineNum >= 0; lineNum -= 2) {

    text(names[lineNum], 20, 20 + (names.length - 1 - lineNum) * 20);  // Position text based on reverse lineNum

  // Close the loop:
  }

  // -- stop the draw() loop for now :
  noLoop(); // <-- we don't need to print this 60 times per second!
}
