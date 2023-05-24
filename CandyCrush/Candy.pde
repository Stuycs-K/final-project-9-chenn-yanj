public class Candy{
  String colors;
  int x;
  int y;
  
  public Candy(){
    colors = "";
  } 
  public Candy(String c, int xCor, int yCor){
    this.colors = c;
    x = xCor;
    y = yCor;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  String getColor(){
    return colors;
  }
  
  boolean validCandy(){
    return true;
  }
  
  
}
