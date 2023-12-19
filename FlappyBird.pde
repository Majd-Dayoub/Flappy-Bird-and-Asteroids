import processing.sound.*;
PImage background, player, pipe, pipe1;
PFont title;
SoundFile fly;
SoundFile point;
SoundFile die;


int backgroundX, backgroundY;
int flappyScore = 0;
int asteroidScore = 0;
int state = 0;

Player myPlayer;
Pipe myPipe;
Button myButton;
Button myButton2;

PImage background2, player2, asteroid, afterHit;

SoundFile hitSound;
boolean keyR, keyM, restart, reset;
boolean power;

boolean click = false ;
boolean press = false ;
Player2 myPlayer2;
Power myPower;
laser myLaser;
Enemy[] enemy = new Enemy[4];
ArrayList <Object> object = new ArrayList<Object>(); 

void setup()
{
  size(900, 600);
  title = createFont("title.otf", 60);
  background = loadImage("background.png");

  fly= new SoundFile (this, "fly.mp3");
  point= new SoundFile (this, "point.mp3");
  die= new SoundFile (this, "die.mp3");

  pipe = loadImage("pipe.png");
  pipe1= loadImage("pipe1.png");
  myPlayer = new Player();
  myPipe = new Pipe();
  myButton = new Button();
  myButton2 = new Button2();

  background2 = loadImage("background2.jpg");

  hitSound = new SoundFile (this, "hitSound.mp3");

  myPlayer2 = new Player2();
  myPower = new Power();
  myLaser = new laser( mouseX+140, mouseY+75);
  for (int i = 0; i< enemy.length; i++)
  {
    enemy[i] = new Enemy();
  }
}

void draw()
{
  if (state==0) // Title Screen
  {
    background.resize(450, 600);
    image(background, 0, 0);
    background2.resize(450, 600);
    image(background2, 450, 0);
    myButton.drawButton(150, 100, "Flappy Bird");
    myButton2.drawButton(625, 100, "Asteroids");
  }
  if (state==1)//title for flappy game
  {
    setBackground();
    setFlappytitle();
    myPlayer.display();
    if (press == true)
    {
      state=2;
    }
  }
  if (state==2) //Flappy Gameplay
  {   
    setBackground();
    myPipe.display();
    myPipe.act();

    myPlayer.display();
    myPlayer.act();  

    fill(255);    
    textFont(title);
    textSize(35);
    text("Score: " +flappyScore, 15, 35);
  }
  if (state == 3) //game over screen for flappy
  {
    fill(255);
    textFont(title);
    text("YOU DIED ", width/2 -150, 100);
    textSize(20);
    text("Press R to Restart Flappy Bird ", width/2 -150, 200);
    if (keyR == true)
    {
      setRestart();
    }
  }
  if (state ==4) //Asteroid Gameplay
  {
    setBackground2();
    setEngine();
    object.add(new Star());
    myPlayer2.display();
    myPlayer2.act();

    myPower.display();
    myPower.act();
    

    for (int i= 0; i< enemy.length; i++)
    {
      enemy[i].Display();
      enemy[i].Update();
    }
  }
  if (state ==5) //GameOver screen for asteroids. 
  {
    fill(255);
    textFont(title);
    text("YOU DIED ", width/2 -150, 100);
    textSize(30);
    text("Press R to Restart Asteroids ", width/2 -200, 200);
    if (keyR == true)
    {
      setReset();
    }
  }
}

void setBackground()
{

  background.resize(900, 600);
  image(background, backgroundX, backgroundY);
}

void setBackground2()
{
  image(background2, 0, 0);
  background2.resize(900, 600);

  fill(0);
  rect(0, 0, 200, 30, 255);
  fill(255);
  text("Score: " +asteroidScore, 15, 20);
}

void setEngine()
{
  int lastIndex = object.size()-1; //starts from last index; index is one less than size.
  while (lastIndex >= 0) //checks if last index is greater than or equal to 0, and if it is, then the last index will keep decreasing until 0 indexes. This while loop goes through all objects GameObject.
  {
    Object obj = object.get(lastIndex); //gets the index of the object from the array list; obj reprsents subclasses of GameObject such as stars. 
    obj.display(); //displays objects from the GameObject class
    obj.act(); //acts behaviour of object
    if (obj.isDead()) 
    {
      object.remove(lastIndex);
    }
    lastIndex--;
  }
}

void setFlappytitle()
{
  fill(255);
  textFont(title);
  text("Flappy Bird ", width/2 -150, 200);
  textSize(20);
  text("Click Anywhere To Start! ", width/2 -110, 275);
}

void mousePressed()
{
  press = true;
}

void keyPressed()
{
  if (key=='r')
  {    
    keyR =true;
  }
}

void keyReleased()
{
  if (key=='r') keyR =false;
}
void setRestart()
{
  restart = true;
  state=1;
  flappyScore=0;
  myPlayer.y = 250;
}
void setReset()
{
  for (int i= 0; i< enemy.length; i++)
  {
    enemy[i].x= random(width+200, width+300);
    enemy[i].y= random(30, height-30);
  }
  myPower.x = 2000;
  state=4;
  asteroidScore=0;
  myPlayer2.y = 250;
  myPlayer2.x = 100;
  power = false;
  reset = false;
}
