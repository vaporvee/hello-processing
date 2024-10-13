float angleY = 0;
float rotationValue = 0.05;

void setup() {
  print("Hello World!");
  size(1280, 720, P3D);
  noStroke();
}

void draw() {
  background(0);
  PGraphics codeWindow = createCodeWindow();
  translate(width / 2, height / 2, 0);
  rotateY(angleY);
  drawCube(codeWindow);
  if (Math.round(angleY) == 1 || Math.round(angleY) == -1 || angleY == 0) { // Rotation turn change
    rotationValue = rotationValue * -1;
  }
  angleY += radians(rotationValue);
}

void drawCube(PGraphics codeWindow) {
  float cubeHeight = 200;
  float cubeWidth = cubeHeight * 1.5;  // Adjusting width to match aspect ratio of 1080:720

  beginShape();
  texture(codeWindow);
  vertex(-cubeWidth, -cubeHeight, cubeHeight, 0, 0);
  vertex(cubeWidth, -cubeHeight, cubeHeight, codeWindow.width, 0);
  vertex(cubeWidth, cubeHeight, cubeHeight, codeWindow.width, codeWindow.height);
  vertex(-cubeWidth, cubeHeight, cubeHeight, 0, codeWindow.height);
  endShape(CLOSE);
}

PGraphics createCodeWindow() {
  PGraphics pg = createGraphics(1280, 720);
  pg.beginDraw();

  pg.fill(240);
  pg.rect(100, 75, 1080, 50, 20, 20, 0, 0);

  pg.noStroke();
  pg.fill(255, 0, 0); // Red button
  pg.ellipse(120, 100, 15, 15);  
  pg.fill(255, 204, 0); // Yellow button
  pg.ellipse(145, 100, 15, 15);  
  pg.fill(0, 255, 0); // Green button
  pg.ellipse(170, 100, 15, 15);  

  pg.fill(30, 30, 30);  
  pg.rect(100, 120, 1080, 480, 0, 0, 20, 20);

  int tSize = 40;
  pg.textSize(tSize);
  pg.textAlign(LEFT);

  pg.fill(150, 150, 150); 
  pg.text("1", 130, 190); 
  pg.fill(86, 156, 214); 
  pg.text("print", 180, 190); 
  pg.fill(255, 255, 255); 
  pg.text("(", 265, 190);
  pg.fill(206, 145, 120);
  pg.text("\"Hello World\"", 280, 190);
  pg.fill(255, 255, 255);
  pg.text(")", 512, 190);

  if (frameCount % 60 < 30) { 
    pg.fill(255);
    pg.rect(530, 155, 3, 45);
  }

  pg.endDraw();
  return pg;
}
