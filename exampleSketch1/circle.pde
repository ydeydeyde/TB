class circle { 
  int x, y, r, a; 
  color c;
  circle (int _x, int _y, color _c, int _a) {  
    x = _x;
    y = _y;
    c = _c;
    a = _a;
  } 
  void update() { 
    r+=2;
    println(a);
    fill(c, a);
    ellipse(x, y, r, r); 
  }
} 