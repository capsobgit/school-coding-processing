/*Programm zum ausfüllen eines Fensters
 * von außen nach innen
 */ 
void setup()
{
  size(600,600);
  frameRate(75);
  //ellipseMode(CENTER);
  //ellipse(300,300,100,100);
}
//Variablen erhalten Anfangswert. 
//Man spricht von "Initialisierung".
final static int elementSize = 30;
int screenDimension = 600;
int xPos = 0;
int yPos = 0;
int state = 1;
int offset = elementSize;

void draw()
{
  fill(0);
  rect(xPos, yPos, elementSize, elementSize);
  verschieben();
}
//Eigene Methode welche je nach Zustand, 
//die Position der Figur entsprechend zeichnet.
void verschieben()
{
  //Nach rechts
  if(state == 1)
  {
    if(xPos < screenDimension - offset)
    {
       xPos += elementSize; 
    }
    else
    {
      state = 2; 
      return;
    }
  }
  //Nach unten
  else if(state == 2)
  {
     if (yPos < screenDimension - offset)
     {
       yPos += elementSize;
     }
     else
     {
       state = 3;
       return;
     }
  }
   //Nach links  
   else if(state == 3)
   {                          
    if(xPos >= offset)    
    {
       xPos -= elementSize;
     }
     else
     {
       state = 4;
       return;
     }
  }
  //Nach oben
    else if(state == 4)
    {
      if(yPos >= offset)  //Hier stimmt etwas nicht!
      {
        yPos -= elementSize;
      }
      else
      {
        offset += elementSize;
        state = 1;  
        return; 
      }
    }
  }
  void mousePressed()
  {
    //Aufgabe 9
  }