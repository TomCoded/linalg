// This may look like C code, but it is really -*- C++ -*-

// Point4DdTest.cc

// (C)  Anonymous1

#include "Point4Dd/Point4Dd.h"
#include "Transform4Dd/Transform4Dd.h"

void print(const char * string, const Point4Dd& p)
{
  std::cout << string << " = " << p <<std::endl;
}

void print(const char * string, const Transform4Dd& t)
{
  std::cout << string << " = " << t <<std::endl;
}

int main(void) {

  Point4Dd p1, p2(1,2,3,4), p;
  Point4Dd q(2.3,2.3,2.3,2.3);

  print("q = ",q);
  print("p1 = ",p1);
  print("p2 = ",p2);

  p1 = p1 + p2;
  p1 += p2;

  print("p1 = ",p1);
  print("p2 = ",p2);

  p = (p1 * 3) - (p2 * 2);
  print("p = ",p);

  print("p1 * p2 = ",p1 * p2);
  std::cout << "p1 dot p2 = " << p1.dot(p2) <<std::endl;
  
  std::cout << p1.x << ",";
  std::cout << p1.y << ",";
  std::cout << p1.z <<std::endl;

  Transform4Dd t(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);
  print("t = ",t);
  print("t*p = ",p.apply(t));
  print("t*p = ",p.applyToSelf(t));
  p2.x = 11;
  std::cout << p2 <<std::endl;
}
