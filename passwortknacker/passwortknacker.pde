/**
  Simulation eines Passwort-Knackers.
  Hier ein Beispiel mit 3 Zeichen.
 */
char ersterBuchstabe = 0;
char zweiterBuchstabe = 0;
char dritterBuchstabe = 0;
char p1 = (char)(int) random(33, 127);
char p2 = (char)(int) random(33, 127);
char p3 = (char)(int) random(33, 127);
String loesung = p1 + "" + p2 + "" + p3;

//print("z1: " + p1 + " z2: " + p2 + " z3: " + p3 + " lösung : " + loesung);
//System.exit(0);
for(int i = 0; i < 127; i++)
{
  ersterBuchstabe = (char)i;
  for(int j = 0; j < 127; j++)
  {
    zweiterBuchstabe = (char)j;
    for(int k = 0; k < 127; k++)
    {
      dritterBuchstabe = (char)k;
      String versuch = ersterBuchstabe+""+zweiterBuchstabe+""+dritterBuchstabe;
      println(versuch);
      if(versuch.equals(loesung))
      {
       println("+++ Erfolg +++");
       print("Das gesuchte Loesungswort lautet : " + versuch);
       System.exit(0);
      }
    }
  }
}