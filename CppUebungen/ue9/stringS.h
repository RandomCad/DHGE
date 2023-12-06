#ifndef STRING_S
#define STRING_S

#include <cstdlib>
#include <cstring>
#include <ostream>
#include <string>

using namespace std;

class String{
  public:
    String(const char *in) : str(strdup(in)), strend(str){
      for(;*strend;strend++) {}
    }
    String(int len = 0) : str((char *)malloc((len+1)*sizeof(char))), strend(str){
      for(*strend='\0';strend-str<len;*strend='\0') strend++;
    }
    String(String &a) : str((char *)malloc((a.strend-a.str)*sizeof(char))),strend(str+(a.strend-a.str)){
      str = (char *)memcpy(str,a.str,(a.strend-a.str)*sizeof(char));
    }

    ~String(){
      free(str);
      str = nullptr;
      strend = nullptr;
    }

    String operator+ (const String &a) const;
    String &operator= (const String &a);
    String &operator+= (const String &a);
    char &operator[] (const size_t i);

    bool operator== (const String &a) const { return !strcmp(this->str,a.str); }
    bool operator< (const String &a) const { return (strcmp(this->str,a.str) < 0); }
    bool operator! () const { return str==strend; }

    operator string() const { return string(this->str); }

    int length() const { return strend-str; }

    friend std::ostream &operator<< (std::ostream &o, const String &a);
  private:
    char *str;
    char *strend;
};

#endif
