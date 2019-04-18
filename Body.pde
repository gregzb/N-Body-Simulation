class Body {
  private Vector position;
  private Vector velocity;
  private Vector acceleration;
  private double mass;
  public Body(Vector position, Vector initialVelocity, double mass) {
    this.position = position;
    this.velocity = initialVelocity;
    this.acceleration = new Vector(0, 0);
    this.mass = mass;
  }
  
  public Vector getPosition() {
    return position;
  }
  
  public void setPosition(Vector position) {
    this.position = position;
  }
  
  public Vector getVelocity() {
    return velocity;
  }
  
  public void setVelocity(Vector velocity) {
    this.velocity = velocity;
  }
  
  public Vector getAcceleration() {
    return acceleration;
  }
  
  public void setAcceleration(Vector acceleration) {
    this.acceleration = acceleration;
  }
  
  public void move(Vector v) {
    position = position.addVec(v);
  }
  
  public void applyAcceleration() {
    velocity = velocity.addVec(acceleration);
  }
  
  public void applyVelocity() {
    position = position.addVec(velocity);
  }
  
  public double getMass() {
    return mass;
  }
  
  public void render(float scale, float size) {
    
    circle(map((float) position.x, -1 * scale, 1 * scale, 0, width), map((float) position.y, -1 * scale, 1 * scale, 0, height), size);
  }
  
}
