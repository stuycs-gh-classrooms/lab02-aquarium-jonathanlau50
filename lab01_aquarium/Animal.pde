class Animal {
  int ax, ay; 
  int aw, ah;
  int xspeed, yspeed;
  
  Animal(int _ax, int _ay) {
    ax = _ax;
    ay = _ay;
    aw = 40;
    ah = 20;
    xspeed = speedGenerator();
    yspeed = speedGenerator();
  }
  
  void move() {
    if (ax + aw >= width || ax <= 0) {
        xspeed*= -1;
    }
    if (ay + ah >= height || ay <= floorH/2) {
         yspeed*= -1;
    }
    ax += xspeed;
    ay += yspeed;
  }
  
  int speedGenerator() {
    int genspeed = int(random(-4,4));
    while (genspeed == 0) {
       genspeed = int(random(-4,4));
    } 
    return genspeed;
  }
  
  void display() {
    fill(255, 0, 255);
    stroke(255, 0, 255);
    rect(ax, ay, aw, ah);
  }
}
