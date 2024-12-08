/*Digitized data copyright The Monotype Corporation 1991-1995. All rights reserved.
 Franklin Gothic is a trademark of The International Typeface Corporation which may
 be registered in certain jurisdictions.*/
PFont font;                //Franklin Gothic Demi font

int[] days;                // Array to store day values
int[] scores;              // Array to store score data
float[] times;             // Array to store times
String[] locations;        // Array to store location data
String[][] minigames;      // 2D Array to store extra minigames played

color[] sColours;            // Array to store the colours of the squares depending on whether I completed the wordle or not

int cols = 7;               // Number of columns
int rows = 8;               // Number of rows
int squareSize = 75;        // Size of each square
int spacing = 8;           // Spacing between squares
int startX = 100;            // X-coordinate of the grids TL corner
int startY = 50;            // Y-coordinate of the grids TL corner

Square[] s;
String[] strScores;

String highlightedScore = null; // To track the score of the clicked square


void setup() {
  font = createFont("franklingothic_demi.ttf", 45);
  size(1200, 750);


  /* --loading & storing data-- */

  // Load data from wordleData.txt file
  String[] textLines = loadStrings("wordleData.txt");
  // Create arrays for the data sized according to number of lines
  days       = new int[textLines.length];
  scores     = new int[textLines.length];
  times      = new float[textLines.length];
  locations  = new String[textLines.length];
  minigames = new String[textLines.length][];

  s = new Square[cols * rows];  // Initialize square array
  sColours = new color[textLines.length]; // Initialize color array
  strScores= new String[textLines.length];

  // iterate and store day, score, time, location and minigame per day
  for (int i=0; i<textLines.length; i++)
  {
    // Split the line into 'values' array separated by "|"
    String[] values = split(textLines[i], "|");

    days[i]       = int(values[0]);
    scores[i]     = int(values[1]);
    times[i]      = float(values[2]);
    locations[i]  = values[3].toLowerCase();
    minigames[i] = split(values[4].toLowerCase(), ",");
  }

  // --storing colour values for each square--

  color darkGrey = color(120, 124, 127);
  color yellow = color(203, 184, 69);
  color green = color(82, 176, 94);

  for (int i = 0; i < textLines.length; i++) {
    switch (scores[i]) {
    case -1:
      sColours[i] = darkGrey;
      break;
    case 0:
      sColours[i] = yellow;
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      sColours[i] = green;
      break;
    default:
      sColours[i] = color(255); // Default to white if score is invalid
    }
  }

  for (int i = 0; i < textLines.length; i++) {
    switch (scores[i]) {
    case -1:
      strScores[i] = "";
      break;
    case 0:
      strScores[i] = "0";
      break;
    case 1:
      strScores[i] = "1";
      break;
    case 2:
      strScores[i] = "2";
      break;
    case 3:
      strScores[i] = "3";
      break;
    case 4:
      strScores[i] = "4";
      break;
    case 5:
      strScores[i] = "5";
      break;
    case 6:
      strScores[i] = "6";
      break;
    default:
      strScores[i] = "";
      break; // Default to null if score is invalid
    }
  }

  /* --CREATING GRID LOOP-- */
  for (int row = 0; row < rows; row++) {
    for (int col = 0; col < cols; col++) {
      // Calculate x and y positions for each square
      int x = startX + col * (squareSize + spacing);
      int y = startY + row * (squareSize + spacing);
      // Calculate the i value of current square to determine square colour and score
      int i = row* cols + col;
      if (i < sColours.length) { // Prevent accessing out of bounds
        s[i] = new Square(x, y, squareSize, sColours[i], strScores[i] );
      } else {
        s[i] = new Square(x, y, squareSize, color(255), strScores[i]); // Default color for empty squares
      }
    }
  }
}

void draw() {
  background(255);
  for (Square square : s) {
    if (square != null) {
      if (highlightedScore != null && !square.score.equals(highlightedScore)) {
        square.clickedDisplay(); // Highlight matching squares
      } else {
        square.display(); // Display the squares
        square.hoverDisplay(); // Apply hover effect if applicable
      }
    }
  }
}

void mousePressed() {
  for (Square square : s) {
    // Check if the mouse overlaps and the score is not null
    if (square.cursorOverlapsWith() && !square.score.equals("")) {
      highlightedScore = square.score; // Update the highlighted score
      break;  // Call clickedDisplay for the selected square
    }
  }
}



// Mini colour
//color(144,187,255);
// Connections colour
//color(186, 159, 255);
// Strands colour
//color(186,223,218);
// Sudoku colour
//color(255,154,0)
