class Goldfish extends Animal {
  
  Goldfish(int x, int y, int size, Tank myTank) {
    super(x, y, size, myTank);
    fill(198, 131, 108);
    this.foodChainID = size/2;
    this.MAXVELOCITY = 20;
  }
  
  Goldfish(int x,int y, Tank myTank){
    this(x,y,40, myTank);
  }
  
  void display() {
    super.display();
    fill(0);
    circle(position.x + 10, position.y + size/4, 2);
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size/2  <= myTank.topCorner().y ||
        nextPos.y + size/2  >= myTank.bottomCorner().y;
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID*2 + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-3,3);
    int dy = (int)random(-3,3);
    changeV(dx,dy);
  }
  
  void interaction(ArrayList<Animal> animals) {
    super.interaction(animals);
    if (animalEaten > 10) {
        die(); //can die from eating too many animals
      }   
    }
}
