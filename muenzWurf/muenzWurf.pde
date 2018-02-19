/**
  Simulation eines Münzwurfs
 */
void setup()
{
 size(1000, 800);
 frameRate(25);
}

int hoehePos = 500;
int hoehe = 100;
int count = 0;
boolean umkehr = false;
ZufallsGenerator zufall = 
          new ZufallsGenerator();
          
int r = (int)random(255);
int g = (int)random(255);
int b = (int)random(255);

void draw()
{
    if((!umkehr && hoehePos <= 200) || (umkehr && hoehePos <= 200))
    { 
       background(random(208), random(255), random(255));
    }
    else
    {
      background(count + count);
    }

  fill(r, g, b);
  //noFill();
  rect(500, 500, 200, 50);
  fill(#FCCB4C);
  ellipse(600 + count, hoehePos, 100, hoehe);
  flugBahn();
  hoeheBestimmen();
  if(ergebnis())
  {
    String erg = 
    zufall.randomBoolean() ? "Kopf" : "Zahl";
    fill(0);
    textSize(36);
    text(erg, 558 + count, 705);
    noLoop();
  }
}

void flugBahn()
{
  if(hoehePos <= 0)
  {
     umkehr = true;   
  }
  
  if(!umkehr)
  {
     hoehePos -= 10;
  }
  else
  { 
    hoehePos += 10;
  }
}

void hoeheBestimmen()
{
    count++;
    //gerade Zahl
    if(count % 2 == 0)
    {
      hoehe = 50;  
    }
    //ungerade Zahl
    else if(count % 2 == 1)
    {
      hoehe = 100;
    }
}

boolean ergebnis()
{
  if(hoehePos >= 700)
  {
    return true;
  }
  return false;
}