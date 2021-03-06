// testTransform4Df.C

// (C)  Anonymous1

#include "Transform4Df/Transform4Df.h"
#include "Point4Df/Point4Df.h"

void print(const char * string, const Point4Df& p)
{
  std::cout << string << " = " << p <<std::endl;
}

void print(const char * string, const Transform4Df& t)
{
  std::cout << string << " = " << t <<std::endl;
}

int main(void) {

  Point4Df p1(1,2,3,4), p2(4,5,6,8);
  Transform4Df t1, t2(p1,p2,Point4Df(1,1,1,1),Point4Df(0,0,0,1));

  print("p1 ",p1);
  print("p2 ",p2);

  print("t1 ",t1);
  print("t2 ",t2);

  t1 = t1 + t2;
  print("t1 = t1 + t2; t1 ",t1);

  print("t1*=t2; t1 ",t1*=t2);

  Transform4Df t;
  print("t ",t);

  std::cout << "Enter a transform: ";
  std::cin >> t;
  print("t ",t);

  t = (t1 * 3) - (t2 * 2);
  print("t = (t1 * 3) - (t2 * 2); t ",t);

  print("t - t2",t-t2);

  print("t1*p2 ", t1*p2);

  print("t2 ",t2);

  print("transpose(t2) ",t2.transpose());
  print("transpose(t2) ",t2.transposeSelf());
}
