int red = 128;

void setup(){
  size(400,400);

}

void draw(){
  background(100);
  fill(red,128,128);
  rect(100,100,60,60);
}

void keyPressed(){
  if (key == 'r' || key =='R'){
    red += 10;
  }
}
