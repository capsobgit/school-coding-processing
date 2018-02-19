/*
 * Tic-Tac-Toe-Spiel
 * Hauptprogramm
 * @author Bruno Sobral
 * @version 1.0 / 16.01.18
 */
//Parameter Konstanten
final static int FIGUR_SIZE = 80;
final static int OFFSET = 10;
final static int LIMIT = 9;
//Koordinaten-Objekt
Bereich[] bereiche;
//Gitter-Objekt
Gitter gitter;
//Ermittler-Objekt mit Referenz auf Bereich-Objekt
Ermittler posErmittler;
//prüft ob nach den Spielregeln gewonnen wurde
GewinnerManager gewonnen;
//Welcher Spieler dran ist
boolean player;
//flackern angeschaltet
boolean isFlackern = true;
int flackernAnzahl;
//anzeigen ob Bereiche schon erzeugt
boolean erzeugt;

void setup()
{
  size(500, 500);
  //fullScreen();
  ellipseMode(LEFT);
  frameRate(20);
  textSize(20);
  //Benoetigte Objekte erzeugen
  gitter = new Gitter();
  bereiche = new Bereich[LIMIT];
  gewonnen = new GewinnerManager(LIMIT);
  posErmittler = new Ermittler(bereiche, gewonnen); 
}              

void draw()
{
  //flackern aktivieren
  if (isFlackern)
  {
    flackern();
  }
  //Ueberschrift
  text("Tic Tac Toe", 210, 20);
  //Bereiche werden nur einmal erzeugt
  if (!erzeugt)
  {
    for (int i = 0; i < bereiche.length; i++)
    {
      bereiche[i] = new Bereich(i);
    }
    erzeugt = true;
  }
  //Linienstärke der Gitter
  strokeWeight(5);
  //4 Gitterlinien zeichnen
  for (int i=0; i<15; i+=4)
  {
    line(gitter.pos[i+0], gitter.pos[i+1], 
            gitter.pos[i+2], gitter.pos[i+3]);
  }
  strokeWeight(2);
  fill(0);
  text("[Nächste Runde]", 330, 480);
  if (player)
  {
    fill(0, 255, 0);
  } else
  {
    fill(0, 0, 255);
  }
}

void flackern()
{ 
  background(random(255) + 100, random(255) + 100, random(255) + 100);
  flackernAnzahl++;
  if (flackernAnzahl == 12)
  {
    isFlackern = false;
  }
}

void mouseClicked()
{
  //anhand des Maus-Klicks wird das Spielfeld ermittelt 
  int[] pos = posErmittler.ermittle(mouseX, mouseY, player);
  //Falls Außerhalb des Spielfeldes geklickt wurde abbrechen
  if (pos == null)
  {
    return;
  }
  PShape gewinnLinie;
  int sieg = gewonnen.pruefeGewonnen(player);
  //Falls 1. Spieler
  if (player)
  {
    //male an entsprechender Stelle einen Kreis
    ellipse(pos[0] + OFFSET, pos[1] + OFFSET, FIGUR_SIZE, FIGUR_SIZE);
  }
  //Sonst 2. Spieler
  else
  {
    //male an entsprechender Stelle ein Quadrat
    rect(pos[0] + OFFSET, pos[1] + OFFSET, FIGUR_SIZE, FIGUR_SIZE);
  }
  //Falls ein Sieg vorliegt
  if(sieg != -1)
  {
      gewinnLinie = gitter.gewinnLinien[sieg];
      gewinnLinie.setFill(0);
      gewinnLinie.setStrokeWeight(8);
      shape(gewinnLinie);
  }
  player = !player;
}