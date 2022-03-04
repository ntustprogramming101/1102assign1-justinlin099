PImage backImg,soilImg,heartImg,hogImg,soldierImg,robotImg; //Declare img type
int soldierX,soldierY,robotX,robotY,laserX,laserLen; //Declare coordinate vars

void setup() {
	size(640, 480, P2D);
  //Load Images
  backImg = loadImage("img/bg.jpg");//Background
  soilImg = loadImage("img/soil.png");//soil
  heartImg = loadImage("img/life.png");//heart
  hogImg = loadImage("img/groundhog.png");//hog
  soldierImg = loadImage("img/soldier.png");//soldier
  robotImg =loadImage("img/robot.png");//robot
  
  //Set init coordinates
  soldierX=0;
  soldierY=int(random(4));//get soldier y coordinate
  robotX=int(random(6));////get robot x coordinate
  robotY=int(random(4));//get robot y coordinate
  laserX=0;
  laserLen=0;
  
}

void draw() {
  //Draw Background
  image(backImg,0,0);
  
  //Draw Soil
  image(soilImg,0,160);
  
  //Draw Grass
  noStroke();
  fill(124,204,25);//green
  rect(0,160,640,-15);//grass
  
  //Draw Heart
  for(int i=0;i<3;i++)
  {
    image(heartImg,10+i*70,10);
  }
  
  //Draw Sun
  stroke(255,255,0);//set Stroke color
  strokeWeight(5);//set Stroke Weight to 5
  fill(253,184,19);//set Sun color
  circle(590,50,120);//Draw Sun
  
  //Draw hog
  image(hogImg,280,80);
  
  //Draw Soldier
  image(soldierImg,soldierX-80,80*(soldierY+2));//Draw Soldier
  soldierX+=3;//Move Soldier
  soldierX%=720;
  
  //Draw Robot
  image(robotImg,80*(robotX+2),80*(robotY+2));//Draw Robot
  
  //Draw Laser
  strokeWeight(10);
  stroke(255,0,0);//red
  line(80*(robotX+2)+25-laserX,80*(robotY+2)+37,80*(robotX+2)+25+laserLen-laserX,80*(robotY+2)+37);//draw laser
  laserX+=2;//move laser
  laserX%=185;//maximum 2 blocks
  //check laser length
  if(laserX<30){
    laserLen=laserX;
  }else{
    laserLen=30;
  }
}
