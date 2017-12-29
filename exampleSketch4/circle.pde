class circle { 
  int x, y, r; 
  color c;
  circle (int _x, int _y, color _c) {  
    x = _x;
    y = _y;
    c = _c;
  } 
  void update() { 
    r+=2;
    fill(c);
    ellipse(x, y, r, r); 
  }
} 