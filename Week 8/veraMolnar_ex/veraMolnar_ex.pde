void setup(){
  size(600,600);
}

void draw(){
  background(255);
  stroke(32);
  noFill();
  
  float xPos = 100;
  float yPos = 100;
  float sSize = 100;
  
  vQuad(xPos, yPos, sSize, 5);
  
}

void vQuad(float x, float y, float s, float r){
  
  float sHalf = s/2;
  
  quad(
  x - sHalf + random(-r,r), y - sHalf + random(-r,r),
  x + sHalf + random(-r,r), y - sHalf + random(-r,r),
  x + sHalf + random(-r,r), y + sHalf + random(-r,r),
  x - sHalf + random(-r,r), y + sHalf + random(-r,r)
  );
}
