ArrayList<Body> bodies;

final double G = 6.674 * pow(10, -11);

void setup() {
  size(1200, 1200);
  bodies = new ArrayList();

  //demo1();
  demo2();
}

void demo1() {
  int bodyCount = 1000;
  for (int i = 0; i < bodyCount; i++) {
    bodies.add(new Body(new Vector(random(-2, 2) + 3, random(-2, 2)), new Vector(0, .1), 1));
  }

  bodies.add(new Body(new Vector(0, 0), new Vector(0, 0), 100000000d));
}

void demo2() {
  int bodyCount = 1000;
  bodies.add(new Body(new Vector(-8, 0), new Vector(0, .05), 100000000d));
  bodies.add(new Body(new Vector(8, 0), new Vector(0, -.05), 100000000d));

  for (int i = 0; i < bodyCount; i++) {
    bodies.add(new Body(new Vector(random(-.2, .2), random(-.2, .2)), new Vector(random(-.01, .01), random(-.01, .01)), 1d));
  }
}

void draw() {
  background(255);
  noStroke();

  ArrayList<Vector> temp = new ArrayList();

  for (int i = 0; i < bodies.size(); i++) {
    Body body = bodies.get(i);
    fill(0, 127, 255);

    Vector totalAccel = new Vector(0, 0);
    for (int j = 0; j < bodies.size(); j++) {
      if (i == j) continue;
      Body other = bodies.get(j);
      Vector r = other.getPosition().addVec(body.getPosition().negate());
      Vector individAccel = r.multiply(G * other.getMass() / r.dotProduct(r));
      totalAccel = totalAccel.addVec(individAccel);
    }

    temp.add(totalAccel);
  }

  for (int i = 0; i < bodies.size(); i++) {
    Body body = bodies.get(i);
    body.setAcceleration(temp.get(i));

    body.applyAcceleration();
    body.applyVelocity();
    body.render(20, log((float)body.getMass()) / 2 + 3);
  }
}
