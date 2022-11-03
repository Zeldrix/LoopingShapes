class Particle {
  NoiseLoop xNoise;
  NoiseLoop yNoise;
  NoiseLoop dNoise;
  NoiseLoop rNoise;
  NoiseLoop gNoise;
  NoiseLoop bNoise;

  String[] shapes = {"circle", "rect", "triangle", "hexagon", "octogone"};
  String shape;
  float rotation = random(TWO_PI);



  Particle() {
    int temp = floor(random(shapes.length));
    shape = shapes[temp];
    xNoise = new NoiseLoop(0.5, -width, width*2);
    yNoise = new NoiseLoop(0.5, -height, height*2);
    dNoise = new NoiseLoop(7, 15, 150);
    rNoise = new NoiseLoop(7, 0, 255);
    gNoise = new NoiseLoop(7, 0, 255);
    bNoise = new NoiseLoop(7, 0, 255);
  }

  void render(float a) {
    noStroke();
    float x = xNoise.value(a);
    float y = yNoise.value(a);
    float d = dNoise.value(a);
    float r = rNoise.value(a);
    float g = gNoise.value(a);
    float b = bNoise.value(a);
    fill(r, g, b, 200);
    rotate(rotation);
    if (this.shape == "circle"){
      ellipseMode(CENTER);
      circle(x, y, d);
    } else if (this.shape == "rect"){
      rectMode(CENTER);
      rect(x, y, d, d, 10);
    } else if (this.shape == "triangle"){
      polygon(x, y, d/2, 3);
    } else if (this.shape == "hexagon"){
      polygon(x, y, d/2, 6);
    } else if (this.shape == "octogone"){
      polygon(x, y, d/2, 8);
    }
  }

  void polygon(float x, float y, float radius, int npoints) {
    float angle = TWO_PI / npoints;
    beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * radius;
      float sy = y + sin(a) * radius;
      vertex(sx, sy);
    }
    endShape(CLOSE);
  }
}
