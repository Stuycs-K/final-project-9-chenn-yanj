public class Candy {
  String colors;
  int x;
  int y;

  // construct "empty" candy
  public Candy() {
    colors = "";
    x = -1;
    y = -1;
  }
  public Candy(String c, int xCor, int yCor) {
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

  String getColor() {
    return colors;
  }
}
