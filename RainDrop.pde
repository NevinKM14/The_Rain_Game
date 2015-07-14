class RainDrop {

  float x,y;   // Variables for location of raindrop
  float speed; // Speed of raindrop
  PImage raindrop;
  
  RainDrop(drop){
    x = random(width);    
    y = 150;              
    speed = random(6,9);
	raindrop = drop;
  }
  
    void move() {
    // Increment by speed
    y += speed; 
  }
  
    // Display the raindrop
    void display() {
    // Display the drop
	  image(raindrop, x, y);
  }

  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    y = - 1000;
  }
}
