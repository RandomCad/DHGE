#ifndef FRACTION
#define FRACTION

#include <ostream>

class Fract{
  public:
    Fract(int diffid = 0, int divi = 1) : num(diffid),den(divi){
      shorten();
    }
    Fract(const char *in);

    Fract &operator+() { return *this; }
    Fract operator+(const Fract a) const { return Fract(this->num*a.den+this->den*a.num,this->den*a.den); }
    Fract operator-(const Fract a) const { return Fract(this->num*a.den-this->den*a.num,this->den*a.den); }
    Fract operator*(const Fract a) const { return Fract(this->num*a.num,this->den*a.den); }
    Fract operator/(const Fract a) const { return Fract(this->num*a.den,this->den*a.num); }
    Fract &operator+=(const Fract a) { return *this = *this + a; }
    Fract &operator-=(const Fract a) { return *this = *this - a; }
    Fract &operator/=(const Fract a) { return *this = *this / a; }
    Fract &operator/=(const int a) { this->den/=a; this->num/=a; return *this; }
    Fract &operator*=(const Fract a) { return *this = *this * a; }

    void shorten();

    operator double() const { return double(this->num)/this->den; }


    friend std::ostream &operator<< (std::ostream &o,const Fract &a);

  private:
    int num;
    int den;
};

#endif
