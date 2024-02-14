class Crab extends Animal {
  PImage img;
  boolean reachedFloor = false;
  float gravity = 0.5;

  Crab(int x, int y, int size, Tank myTank) {
    super(x,y,size,myTank);
    img = loadImage("crab.png");
    this.foodChainID = size/2;
  }
  
  Crab(int x,int y, Tank myTank){
    this(x,y,40, myTank);
  }

  void move() {
  if (!reachedFloor) {
    velocity.y += gravity; // Apply gravity
    position.y += velocity.y; // Update vertical position

    if (position.y + size/2 >= height - floorH) {
      reachedFloor = true;
      position.y = height - floorH;
      velocity.y = 0; // Stop falling when reached the floor
      velocity.x = speedGenerator(); // Start crawling randomly left or right
    }
  } 
  else {
    // Randomly change direction when hitting the walls
    if (position.x + size/2 >= width || position.x - size/2 <= 0) {
      velocity.x *= -1;
    }
    position.x += velocity.x; // Move horizontally
  }
}

  void display() {
    fill(255, 0, 0); // Change color for the crab
    stroke(0);
    circle(position.x,position.y, size);
    image(img, position.x-size/2, position.y-size/2, size, size);
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size  <= myTank.topCorner().y ||
        nextPos.y + size >= myTank.bottomCorner().y;
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID + foodChainID;
  }
}
