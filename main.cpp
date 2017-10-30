
#include <iostream>
#include <cmath>
using namespace std;

#define MAX 15
class Stack {
    
public:
    
    Stack() { top = -1; }
    bool push( bool x);
    bool pop();
    bool isEmpty();
    int top;
    
    
private:
    bool a[MAX];
    
};

int convert(Stack binary);
int main() {
    Stack s;
    string str = "10111";
    
    for(int i = 0; i<str.length(); i++){
        if(str[i] == '1') s.push(true);
        else s.push(false);
    }
    cout << str << " is equal to " << convert(s) << endl;
    return 0;
}

bool Stack::push(bool x)
{
    if (top >= MAX ) {
        cout << "Stack overflow";
        return false;
    }
    else
    {
        a[++top] = x;
        return true;
    }
    
}


bool Stack::pop(){
if (top < 0)
{
    cout << "Stack underflow";
    return false;
} else {
    bool x = a[top--];
    return x;
    }
}

int convert(Stack binary){
    int value = 0;
    int count = 0;
    
    while(!binary.isEmpty()){
        value += binary.pop() * pow(2, count);
        count++;
    }
    return value;
    
}

bool Stack::isEmpty(){
    return (top < 0);
}



