class SineFish extends Animal {
  float theta = 0;
  float angleSpeed;
  float refy;
  
  SineFish(int x,int y, int size, Tank myTank){
    super(x, y, size, myTank);
    angleSpeed = random(0.05, 0.2);
    refy = position.y;
    velocity.x = speedGenerator();
  }

  SineFish(int x,int y, Tank myTank){
    this(x,y,40, myTank);
  }
  
 void move() {
  
  position.x += velocity.x;
  theta += angleSpeed;
  position.y = (int)(refy + 50 * sin(theta)); 
  if (position.x + size >= width || position.x <= 0) {
    velocity.x *= -1;
  }
}

  void display() {
    fill(255, 0, 255); 
    stroke(0);
    rect(position.x, position.y, size, size);
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size/2  <= myTank.topCorner().y ||
        nextPos.y + size/2  >= myTank.bottomCorner().y;
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID*2 + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-2,2);
    changeV(dx,dy);
  }
}
