class Frog extends Animal {
  PImage img;
  boolean reachedFloor = false;
  float gravity = 0.5;

  Frog(int x, int y, int size, Tank myTank) {
    super(x,y,size,myTank);
    img = loadImage("frog.png");
    this.foodChainID = size/2;
  }
  
  Frog(int x,int y, Tank myTank){
    this(x,y,40, myTank);
  }

  void move() {
    super.move();
    velocity.y += gravity; // Apply gravity
    position.y += velocity.y; // Update vertical position
  } 


  void display() {
    fill(0, 255, 0); 
    stroke(0);
    circle(position.x,position.y, size);
    image(img, position.x-size/2, position.y-size/2, size, size);
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-2,2);
    changeV(dx,dy);
  }
  
  void interaction(ArrayList<Animal> animals) {
    super.interaction(animals);
    if (animalEaten > 15) {
        die(); //can die from eating too many animals
      }   
    }
}
