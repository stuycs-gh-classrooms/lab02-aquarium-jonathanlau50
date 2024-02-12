class Crab extends Animal {
  boolean reachedFloor = false;

  Crab(int x, int y, int size, Tank myTank) {
    super(x,y,size,myTank);
  }

  void move() {
    if (velocity.y < 0) {
      velocity.y *= -1;
    }
    if (!reachedFloor) {
      if (position.y + size >= height-floorH) {
        reachedFloor = true;
        velocity.y = 0; // Stop falling when reached the floor
        velocity.x = speedGenerator(); // Start crawling randomly left or right
      } else {
        position.y += velocity.y; // Continue falling until reached the floor
      }
    } else {
      // Randomly change direction when hitting the walls
      if (position.x + size >= width || position.x <= 0) {
        velocity.x *= -1;
      }
      position.x += velocity.x; // Move horizontally
    }
  }

  void display() {
    fill(255, 0, 0); // Change color for the crab
    stroke(0);
    rect(position.x, position.y, aw, ah);
  }
}
