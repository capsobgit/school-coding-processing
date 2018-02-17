public class Ermittler
{
  Bereich[] bereiche;
  GewinnerManager gewonnen;

  public Ermittler(Bereich[] ber, GewinnerManager g)
  {
    this.bereiche = ber;
    gewonnen = g;
  }

  public int[] ermittle(int mx, int my, boolean player)
  { 
    int[] result = new int[2];
    //Range-Parameter
    int startX, startY, endX, endY = 0;
    //für den Index
    int count = 0;
    for (int i=0; i<sqrt(9); i++)
    {
      for (int j=0; j<sqrt(9); j++)
      {
        startX = bereiche[j].range[0];
        endX = bereiche[j].range[1];
        startY = bereiche[i].range[0];
        endY = bereiche[i].range[1];
        //Falls Maus-Koordinaten einem Feld entsprechen
        //und Feld noch nicht belegt ist
        if (mx > startX && mx < endX && my > startY 
          && my < endY &&
          bereiche[count].belegt != true)
        {
          result[0] = startX;
          result[1] = startY;
          //Bereich wird belegt
          bereiche[count].belegen();
          //GewinnManager wird informiert
          gewonnen.insert(player, count);
          return result;
        }
        //Über den Zähler wird die Navigation dokumentiert
        count++;
      }
    }
    //Kein bereich innerhalb des Spiels
    return null;
  }
}