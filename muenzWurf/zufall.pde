public class ZufallsGenerator
{
   public boolean randomBoolean()
   {
     float zufall = random(100);
     if(zufall > 50.0f)
     {
        return true; //kopf
     }
     else 
     {
       return false; //zahl
     }
   }
}