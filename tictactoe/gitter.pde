public class Gitter
{  
   PShape[] gewinnLinien;
   //GitterLinien
   int[] pos = 
      {
        100, 200, 400, 200, 
        100, 300, 400, 300, 
        200, 100, 200, 400, 
        300, 100, 300, 400
      };
      
   public Gitter()
   {
      gewinnLinien = new PShape[8];
      initGewinnLinien();
   }
   
   private void initGewinnLinien()
   {
     //GewinnLinien horizontal erzeugen
     gewinnLinien[0] = createShape(LINE, pos[0], pos[1] - 50, pos[2], + pos[3] - 50); 
     gewinnLinien[1] = createShape(LINE, pos[0], pos[1] + 50, pos[2], + pos[3] + 50);
     gewinnLinien[2] = createShape(LINE, pos[0], pos[1] + 150, pos[2], + pos[3] + 150);   
     //GewinnLinien vertikal
     gewinnLinien[3] = createShape(LINE, pos[8] - 50, pos[9], pos[10] - 50, + pos[11]); 
     gewinnLinien[4] = createShape(
                                   LINE, pos[12] - 50
                                   ,pos[13], pos[14] -50, pos[15]);
   }
}