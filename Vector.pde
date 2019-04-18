class Vector {
  public final double x;
  public final double y;
  public Vector(double x, double y) {
    this.x=x;
    this.y=y;
  }
  
  public Vector(Vector p, double x, double y) {
    this(x + p.x, y + p.y);
  }
  
  public Vector addVec(Vector a) {
    return new Vector(a.x + x, a.y + y);
  }
  
  public Vector addVec(double x, double y) {
    return new Vector(this.x + x, this.y + y);
  }
  
  public Vector negate() {
    return new Vector(-x, -y);
  }
  
  public Vector multiply(Vector a) {
    return new Vector(x * a.x, y * a.y);
  }
  
  public double dotProduct(Vector a) {
    return x * a.x + y * a.y;
  }
  
  public Vector multiply(double a) {
    return new Vector(x * a, y * a);
  }
  
  public String toString() {
    return "(" + x + ", " + y + ")";
  }
}
