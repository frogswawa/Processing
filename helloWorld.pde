boolean drawLine = false, drawCircle=false;
int x =300, w=50, circleSize=20;
float g=158, ellipseX, ellipseY;

void setup() {
  size(800, 600);
  cursor(HAND);
  //background(255);
}

void draw() {
  background(255);
  if (drawLine==true) {   
    strokeWeight(w);
    stroke(0, g, 0);
    line(0, x, 800, x);
  }
  if (drawCircle==true) {
    strokeWeight(0);
    stroke(0);
    fill(255, g, 215);

    ellipse(ellipseX, ellipseY, circleSize, circleSize );
  }
  if (circleSize<300) {
    circleSize=circleSize+5;
  } else drawCircle=false;
}

void keyPressed() {
  if (key == '1')
    drawLine=drawLine^true;
  if (key == CODED) { 
    if (keyCode == UP) {
      x--;
    } else if (keyCode == DOWN) {
      x++;
    }
  }
  if (key == ' ') {
    circleSize=circleSize-50;
  }
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    g=255;
  }  
  if (mouseButton==LEFT) {
    drawCircle=true;
    ellipseX=mouseX;
    ellipseY=mouseY; 
    circleSize=0;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (g>=0&&g<=255) {
    g=g+10*e;
  } else if (g>255) {
    g=255;
  } else if (g<0) {
    g=0;
  }
}