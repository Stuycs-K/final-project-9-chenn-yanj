public class Candy{
  String colors;
  int x;
  int y;
  
  public Candy(){
    colors = "";
    x = -1;
    y = -1;
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
  
  void setX(int newX) {
    x = newX;
  }
  
  void setY(int newY) {
    y = newY;
  }
  
  String getColor(){
    return colors;
  }
  
<<<<<<< HEAD
  
=======
>>>>>>> 5a41c0fd38bbf2af150dc6c5828452c8f802ed9d
}
