import java.util.*;
import java.util.Iterator;
class Tank {
  int x, y, w, h, floor_height;
  ArrayList<Animal> animals;
  Iterator<Animal> animalIterator;
  color WATER = color(0, 255, 255);
  color SAND = #E7C496;
  
  Tank(int x, int y, int w, int h, int floor_height){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.floor_height = floor_height;
    animals = new ArrayList<Animal>();
  }
  
  void display(){
    fill(WATER);
    rect(x,y,w,h);
    fill(SAND);
    rect(x,y+h-floor_height, w, floor_height);
    for (Animal a: animals){
      a.display();
    }
  }
  
  void addAnimal(int x, int y, int type){
    if (type == 1) {
      animals.add(new Crab(x,y,this));
    }
    else if (type == 2) {
      animals.add(new Goldfish(x,y,this));
    }
    else if (type == 3) {
      animals.add(new SineFish(x,y,this));
    }
    else if (type == 4) {
      animals.add(new Starfish(x,y,this));
    }
    else if (type == 5) {
      animals.add(new Octopus(x,y,this));
    }
    else if (type == 6) {
      animals.add(new Fish(x,y,this));
    }
  } 
  
  
  void populate(int n){
    for (int i = 0; i<n; i++){
      int species = (int) random(3);
      if(species == 0){
        animals.add(new Fish((int) random(x,x+w), (int) random(y + h), this));
      }
      if(species == 1){
        animals.add(new Animal((int) random(x,x+w), (int) random(y + h),this));
      }
      if(species == 2){
        animals.add(new Octopus((int) random(x,x+w), (int) random(y + h - floor_height),this));
      }
    }
  }
  
  void moveAnimals(){
    for (Animal a: animals){
      a.move();
    }
  }
  
  void clean(){
    Iterator<Animal> animalIterator = animals.iterator();
    while(animalIterator.hasNext()){
      Animal a = animalIterator.next();
      if(a.remove){
        animalIterator.remove();
      }
    }
  }
  
  void interactions(){
    for (Animal a: animals){
      a.interaction(animals);
    }
  }
  
  PVector bottomCorner(){
    return new PVector(x+w,y+h);
  }
  
  PVector topCorner(){
    return new PVector(x,y);
  }
  
}
