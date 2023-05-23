public class Candy{
  private String [] candy;
  private String colors;
  
  public Candy(, String c){
    candy = new String[]{"blueball", "purpleflower", "orangeoval", "greensquare", "yellowtriangle", "redbean"};
    this.colors = c
  }
  
  public String getColor(){
    return colors;
  }
  
  public static String randomCandy(){
   int index = (int)random(0,6);
   return (Candy[index]);
  }
  
  public boolean validCandy(){
    return true;
  }
  
  
}
