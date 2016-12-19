import processing.io.*;
//Variables
Button forwardbutton, backwardbutton, leftbutton, rightbutton;  // the buttons
int rectWidth;
int motor1pin = 3, motor1dir = 5, motor2pin = 7, motor2dir = 8, motor3pin = 10, motor3dir = 12, motor4pin = 11, motor4dir = 13;


//Button class
class Button {
  String label;
  float x;    // top left corner x position
  float y;    // top left corner y position
  float w;    // width of button
  float h;    // height of button
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}

void setup() {
  size(320, 180);
  noStroke();
  background(0);
  rectWidth = width/4;
  forwardbutton = new Button("Forward", 70, 20, 100, 50);
   leftbutton = new Button("Left", 0, 70, 100, 50);
   rightbutton = new Button("Right",150, 70, 100, 50);
  backwardbutton = new Button("Backward", 70, 120, 100, 50);
  GPIO.pinMode(motor1pin, GPIO.OUTPUT);
  GPIO.pinMode(motor2pin, GPIO.OUTPUT);
  GPIO.pinMode(motor3pin, GPIO.OUTPUT);
  GPIO.pinMode(motor4pin, GPIO.OUTPUT);
  GPIO.pinMode(motor1dir, GPIO.OUTPUT);
  GPIO.pinMode(motor2dir, GPIO.OUTPUT);
  GPIO.pinMode(motor3dir, GPIO.OUTPUT);
  GPIO.pinMode(motor4dir, GPIO.OUTPUT);
}

void draw() { 
  forwardbutton.Draw();
  backwardbutton.Draw();
  leftbutton.Draw();
  rightbutton.Draw();
}

void keyPressed() {
  if (key == 'a')
  {
    //moveleft
    print("a\n");
    left();
  } 
  else if (key == 'd') {
    //moveright
    print("d\n");
    right();
  }
  else if (key == 's') {
    //moveright
    print("s\n");
    backward();
  }
  else if (key == 'w') {
    //moveright
    print("w\n");
    forward();
  }
}
// mouse button clicked
void mousePressed()
{
  if (forwardbutton.MouseIsOver()) {
    //Enable forward configuration
    print("forward\n");
    forward();
    
  }
  if (backwardbutton.MouseIsOver()){
   //Enable reverse configuration 
    print("back\n");
    backward();
  }
  if (leftbutton.MouseIsOver()){
   //Enable reverse configuration 
    print("left\n");
    left();
  }
  if (rightbutton.MouseIsOver()){
   //Enable reverse configuration 
    print("right\n");
    right();
  }
}
void mouseReleased()
{
  stopmoving(); 
  print("Mouserelease\n");
}
void keyReleased(){
  print("Keyrealease\n");
  stopmoving(); 
}
void forward(){
  GPIO.digitalWrite(motor1pin,GPIO.LOW);
  GPIO.digitalWrite(motor2pin,GPIO.LOW);
  GPIO.digitalWrite(motor3pin,GPIO.HIGH);
  GPIO.digitalWrite(motor4pin,GPIO.HIGH);
  
  GPIO.digitalWrite(motor1dir,GPIO.HIGH);
  GPIO.digitalWrite(motor2dir,GPIO.HIGH);
  GPIO.digitalWrite(motor3dir,GPIO.HIGH);
  GPIO.digitalWrite(motor4dir,GPIO.HIGH);
}
void backward(){
  GPIO.digitalWrite(motor1pin,GPIO.LOW);
  GPIO.digitalWrite(motor2pin,GPIO.LOW);
  GPIO.digitalWrite(motor3pin,GPIO.HIGH);
  GPIO.digitalWrite(motor4pin,GPIO.HIGH);
  
  GPIO.digitalWrite(motor1dir,GPIO.LOW);
  GPIO.digitalWrite(motor2dir,GPIO.LOW);
  GPIO.digitalWrite(motor3dir,GPIO.HIGH);
  GPIO.digitalWrite(motor4dir,GPIO.HIGH);
}
void left(){
  GPIO.digitalWrite(motor1pin,GPIO.HIGH);
  GPIO.digitalWrite(motor2pin,GPIO.HIGH);
  GPIO.digitalWrite(motor3pin,GPIO.LOW);
  GPIO.digitalWrite(motor4pin,GPIO.LOW);
  
  GPIO.digitalWrite(motor1dir,GPIO.HIGH);
  GPIO.digitalWrite(motor2dir,GPIO.HIGH);
  GPIO.digitalWrite(motor3dir,GPIO.HIGH);
  GPIO.digitalWrite(motor4dir,GPIO.HIGH);
}
void right(){
  GPIO.digitalWrite(motor1pin,GPIO.HIGH);
  GPIO.digitalWrite(motor2pin,GPIO.HIGH);
  GPIO.digitalWrite(motor3pin,GPIO.LOW);
  GPIO.digitalWrite(motor4pin,GPIO.LOW);
  
  GPIO.digitalWrite(motor1dir,GPIO.HIGH);
  GPIO.digitalWrite(motor2dir,GPIO.HIGH);
  GPIO.digitalWrite(motor3dir,GPIO.LOW);
  GPIO.digitalWrite(motor4dir,GPIO.LOW);
}
void stopmoving(){
  GPIO.digitalWrite(motor1pin,GPIO.HIGH);
  GPIO.digitalWrite(motor2pin,GPIO.HIGH);
  GPIO.digitalWrite(motor3pin,GPIO.HIGH);
  GPIO.digitalWrite(motor4pin,GPIO.HIGH);
}