float x;
float y;

void setup() {
  size(400, 400);
  x= width/2;
  y= height/2;
}

void draw() {
  background(222,228,255);
  rectMode(CENTER);
  rect(x, y, 60, 60);
}

void keyPressed() {
  if (key == 'w') {
    y -= 1;
  } else if (key == 's'){
    y+=1;
  }
  if (key == 'd') {
    x += 1;
  } else if (key == 'a'){
    x-=1;
  }
}
