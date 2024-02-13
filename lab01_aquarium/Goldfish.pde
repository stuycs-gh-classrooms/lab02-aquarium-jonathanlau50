class Goldfish extends Animal {
  
  Goldfish(int x, int y, int size, Tank myTank) {
    super(x, y, size, myTank);
    fill(198, 131, 108);
    velocity.y += 3;
  }
  
  Goldfish(int x,int y, Tank myTank){
    this(x,y,40, myTank);
  }
  
  void display() {
    super.display();
    fill(0);
    circle(position.x + 10, position.y + size/4, 2);
  }
  
  
}
