class Tank {
  int tx, ty;
  int tw, th;
  int floorHeight;
  ArrayList<Animal> animals;
  
  Tank(int _tx, int _ty, int _tw, int _th, int _floorHeight) {
    tx = _tx;
    ty = _ty;
    tw = _tw;
    th = _th;
    floorHeight = _floorHeight;
    animals = new ArrayList<Animal>();
  }
  
  void addAnimal(int mx, int my) {
    if (mx >= tx && mx <= tx + tw && my >= ty && my <= ty + th - floorHeight) {
      if (int(random(0,2)) == 0) {
        animals.add(new SineFish(mx, my));
      }
      else {
      animals.add(new Crab(mx, my));
      }
    }
  }
  
  void moveAnimals() {
    for (int i = 0; i < animals.size(); i++) {
      animals.get(i).move();
    }
  }
  
  void display() {
    fill(0, 255, 255);
    stroke(0, 255, 255);
    rect(tx, ty, tw, th - floorHeight);
    fill(#E7C496);
    stroke(#E7C496);
    rect(tx, ty + th - floorHeight, tw, floorHeight);
    for (int i = 0; i < animals.size(); i++) {
      animals.get(i).display();
    }
  }
}
