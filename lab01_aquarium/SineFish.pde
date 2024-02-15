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
  if (position.x + size/2 >= width || position.x - size/2 <= 0) {
      velocity.x *= -1;
      if (position.x + size/2 >= width) {
        position.x = width - size/2;
      }
      else if (position.x - size/2 <= 0) {
        position.x = size/2;
      }
    }
}

  void display() {
    fill(255, 0, 255); 
    stroke(0);
    circle(position.x, position.y, size);
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
