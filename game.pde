/* @pjs preload="images\\game background with clouds .png"; */
/* @pjs preload="images\\winner.png"; */
/* @pjs preload="images\\YOU LOST .png"; */
/* @pjs preload="images\\rain.png"; */
/* @pjs preload="images\\bucket.png"; */

PImage rain_drop;
PImage bg;
PImage WinBg;
PImage LoseBg;
PImage bucket;

RainDrop[] drops;       // An array of drop objects
int totalDrops = 0; 	// totalDrops
int x = 0;
int score = 0;
int startTime = 0;
int timeLimit = 0;
int numberOfMisses = 70;
int maxNumberDrops = 100;
int bgFlag = 0;

void setup ()
{
  size(746, 558); //Declaring the dimensions (size) of the program.
  
  bg = loadImage("images\\game background with clouds .png");
  WinBg = loadImage("images\\winner.png");
  LoseBg = loadImage("images\\YOU LOST .png");
  rain_drop = loadImage("images\\rain.png");
  bucket = loadImage("images\\bucket.png");

  drops = new RainDrop[maxNumberDrops];
  startTime = millis();
  timeLimit = 500;
} 

void draw()
{
  if (bgFlag == 0){ 
    background(bg); 

    if((millis() - startTime) > timeLimit){
      if(totalDrops < drops.length){
        drops[totalDrops] = new RainDrop(rain_drop);
        totalDrops++;
      }
      startTime = millis();
    }

    image(bucket, x, 456);
  
  // Move and display all drops
    for (int i = 0; i < totalDrops; i++ ) {
      drops[i].move();
      drops[i].display();
      if (drops[i].y > 456 && drops[i].y < 500 && drops[i].x > x && drops[i].x < x+100) {
	  drops[i].caught();
	  score++;
      }
    }

    if(totalDrops - score  > numberOfMisses){
      bgFlag = 2;
    }
    else if(totalDrops == drops.length){
      bgFlag = 1;
    }

   fill(1);
   text("score: " + score, 10 ,20);
  }

  else if(bgFlag == 1){background(WinBg);}
  else if(bgFlag == 2){background(LoseBg);}
}

void keyPressed() {
	if(key == CODED && keyCode == RIGHT && x <= 630){ 
		x += 50;
	}
	else if(key == CODED && keyCode == LEFT && x >= 1){
		x -= 50;
	}
}
