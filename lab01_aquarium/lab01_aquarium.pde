Tank t;
int tankX = 0;
int tankY = 50;
int floorH = 100;
int tankW;
int tankH;


void setup() {
  size(600,600);
  tankW = width;
  tankH = height - 50;
  t = new Tank(tankX, tankY, tankW, tankH, floorH);
  t.display();
}//setup


void draw() {
  background(150);
  t.moveAnimals();
  t.interactions();
  t.clean();
  t.display();
}

void mouseClicked() {
  //t.populate(10);
}

void keyPressed() {
  if (key == '1') {
    t.addAnimal(mouseX, mouseY, 1);
  }
  else if (key == '2') {
    t.addAnimal(mouseX, mouseY, 2);
  }
  else if (key == '3') {
    t.addAnimal(mouseX, mouseY, 3);
  }
  else if (key == '4') {
    t.addAnimal(mouseX, mouseY, 4);
  }
  else if (key == '5') {
    t.addAnimal(mouseX, mouseY, 5);
  }
  else if (key == '6') {
    t.addAnimal(mouseX, mouseY, 6);
  }
}
 
