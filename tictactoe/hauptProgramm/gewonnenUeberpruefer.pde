/**
  Der Gewinnmanager prüft für jeden Spieler, ob
  nach einem Zug ein Spieler eine bestimmte Kombination
  von Feldern belegt, welche zum Sieg führt.
*/
public class GewinnerManager
{
  int feldLaenge;
  int[] spielStand;
  final static int SPIELER1 = 1;
  final static int SPIELER2 = 2;
  int zuegeGespielt;

  public GewinnerManager(int laenge)
  {
    //Speicherung der gesp. Zuege
    spielStand = new int[laenge];
    for (int i=0; i<spielStand.length; i++)
    {
      spielStand[i] = -1;
    }
  }
  //Spieler einfuegen an entspr. Position
  void insert(boolean player, int pos)
  {
    //Falls das Feld voll ist
    if (zuegeGespielt == spielStand.length)
    {
      return;
    }
    //Spielstand wird gemerkt
    spielStand[pos] = !player ? SPIELER1 : SPIELER2;
    zuegeGespielt++;
  }
  //Es wird überprüft, ob ein Spieler gewonnen hat.
  int pruefeGewonnen(boolean player)
  {
    int tmpSpieler = !player ? SPIELER1 : SPIELER2;
    for (int i=0; i<spielStand.length; i++)
    {
      //horizontale Linien
      if (spielStand[0] == tmpSpieler && spielStand[1] == tmpSpieler
        && spielStand[2] == tmpSpieler)
      {
        return 0;
      } 
      else if (spielStand[3] == tmpSpieler && spielStand[4] == tmpSpieler
        && spielStand[5] == tmpSpieler)
      {
        return 1;
      } 
      else if (spielStand[6] == tmpSpieler && spielStand[7] == tmpSpieler
        && spielStand[8] == tmpSpieler)
      {
        return 2;
      }
      //Vertikale Linien
      else if (spielStand[0] == tmpSpieler && spielStand[3] == tmpSpieler
        && spielStand[6] == tmpSpieler)
      {
        return 3;
      }
      else if (spielStand[1] == tmpSpieler && spielStand[4] == tmpSpieler
        && spielStand[7] == tmpSpieler)
      {
        return 4;
      }
      else if (spielStand[2] == tmpSpieler && spielStand[5] == tmpSpieler
        && spielStand[8] == tmpSpieler)
      {
        return 5;
      }
      else if (spielStand[0] == tmpSpieler && spielStand[4] == tmpSpieler
        && spielStand[8] == tmpSpieler)
      {
        return 6;
      }
      else if (spielStand[2] == tmpSpieler && spielStand[4] == tmpSpieler
        && spielStand[6] == tmpSpieler)
      {
        return 7;
      }
    }
    return -1;
  }
}