/**
  Kapselt die Eigenschaften eines
  Bereichsfeldes. Es kann belegt sein (true)
  oder frei sein. Weiterhin wird hier definiert
  wie weit sich ein Bereich erstreckt.
 */
public class Bereich
{
  int index;
  private boolean belegt;
  int[]range;
  
  public Bereich(int i)
  {
    index = i;
    belegt = false;
    initRange();
  }
  
  public void belegen()
  {
     belegt = true; 
  }
  
  private void initRange()
  {
    range = new int[2];
    range[0] = (index+1) * 100;
    range[1] = (index+1) * 100 + 100;
  }
}