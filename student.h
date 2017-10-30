#include <string>
#include "linkedListType.h"

using namespace std;

class Student{
    private: 
        int ID;
        int credit;
        double gpa;
        string firstname;
        string lastname;
        string major;
    public:
        Student(int = 0,int = 0,double = 0.0, string = "firstname", string = "lastname", string = "UNKNOWN");
        ~Student();
        int getid();
        int getcredit();
        double getgpa();
        string getfirstname();
        string getlastname();
        string getmajor();
        
        void setid(int);
        void setcredit(int);
        void setgpa(double);
        void setfirstname(string);
        void setlastname(string);
        void setmajor(string);
};


Student::Student(int id,int credit,double gpa,string firstname,string lastname,string major){ 
    this->ID = id;
    this->credit = credit;
    this->gpa = gpa;
    this->firstname = firstname;
    this->lastname = lastname;
    this->major = major;
}

Student::~Student(){    }
int Student::getid(){return ID;}
int Student::getcredit(){return credit;}
double Student::getgpa(){return gpa;}
string Student::getfirstname(){return firstname;}
string Student::getlastname(){return lastname;}
string Student::getmajor(){return major;}
void Student::setid(int id){ ID = id;}
void Student::setcredit(int CREDIT){credit = CREDIT;}
void Student::setgpa(double GPA){gpa = GPA;}
void Student::setfirstname(string FIRSTNAME){firstname = FIRSTNAME;}
void Student::setlastname(string LASTNAME){lastname = LASTNAME;}
void Student::setmajor(string MAJOR){major = MAJOR;}
