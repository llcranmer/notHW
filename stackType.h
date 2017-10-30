//
//  stackType.h
//  hw3
//
//  Created by Toul T. DeGuia-Cranmer on 10/14/17.
//  Copyright © 2017 Toul T. DeGuia-Cranmer. All rights reserved.
//
#include <iostream>
#include <cassert>
#include <string.h>
#ifndef stackType_h
#define stackType_h

template <class T>
class stackType {
public:
    
    void initializeStack();
    void pop();
    bool push(const T& newItem);
    void copyStack(const int& newMaxStackSize);
    
    // copy constructor
    stackType(const stackType<T>& otherStack);
    
    // constructor
    stackType(int stackSize = 10 ); // make the default 10
    
    
    ~stackType();
    
    
    // top
    T top() const;
    bool isStackFull() const;
    bool isStackEmpty() const;
    
    // overloading the assignment operator
    
    const stackType<T>& operator=(const stackType<T>&);
    int numOF=0;
    
    
private:
    int  stackTop;
    int  maxStackSize;
    T *list;
    
    
    void copyStack(const stackType<T>& otherStack);
    
};

// top
template <class Type>
Type stackType<Type>::top() const
{
    assert(stackTop != 0); //if stack is empty, terminate the
    //program
    return list[stackTop - 1]; //return the element of the stack
    //indicated by stackTop - 1
}//end top

// Initialize
template <class T>
void stackType<T>::initializeStack(){
    stackTop = 0;
}

// constructor
template <class T>
stackType<T>::stackType(int stackSize){
    if (stackSize <= 0)
    {
        std::cout << "Size of the array to hold the stack must "
        << "be positive." << std::endl;
        std::cout << "Creating an array of size 10." << std::endl;
        maxStackSize = 10;
    }else
        maxStackSize = stackSize; //set the stack size to
    //the value specified by
    //the parameter stackSize
    stackTop = 0; //set stackTop to 0
    list = new T[maxStackSize]; //create the array to
    //hold the stack elements
}

// copy stack
template <class T>
void stackType<T>::copyStack(const int& newMaxStackSize){
    
    if(newMaxStackSize < maxStackSize)
        return;
    
    // deep copying the old stack into the new stack
    T *newStack = new T[newMaxStackSize];
    for( int k = 0; k < stackTop; ++k)
        newStack[k] = std::move(list[k]);
    
    maxStackSize = newMaxStackSize;
    std::swap(list, newStack);
    delete [] newStack;
    
    
}

// copy constructor
template <class T>
stackType<T>::stackType(const stackType<T>& otherStack){
    list = NULL;
    copyStack(otherStack);
}

// destructor
template <class T>
stackType<T>::~stackType(){
    delete [] list;
    
}

// delete item
template <class T>
void stackType<T>::pop( ){
    if( !isStackEmpty() )
        stackTop--;
    else
        std::cout << "It is not possible to delete from an empty array stack";
}
// add item; change this to eliminate words with iphone2345
template <class T>
bool stackType<T>::push( const T& string) {
    if(!isStackFull()){
        std::string final;
        for(int i = 0; i < string.length(); i++) {
            if(string[i] == 35 || string[i] == 36 || string[i] == 37 || string[i] == 38 || string[i] == 42| string[i] == 43 || string[i] == 45 || string[i] == 47 || string[i] == 58 || string[i] == 59 || string[i] == 60 || string[i] == 61 || string[i] == 62 || string[i] == 64 || string[i] == 91 || string[i] == 93 || string[i] == 94 || string[i] == 95 ||  string[i] == 96 || string[i] == 123 || string[i] == 124 || string[i] == 125 || string[i] == 126 ) return false;
            else if((string[i] == 39 ) || (isalpha(string[i]))) final += string[i];
            
        }
        list[stackTop++] = final;
    } else {
        copyStack(2*maxStackSize);
        ++numOF;
    }
}


template <class T>
bool stackType<T>::isStackFull() const{
    return(stackTop == maxStackSize);
}

template <class T>
bool stackType<T>::isStackEmpty() const{
    return(stackTop == 0);
}

template <class Type>
const stackType<Type>& stackType<Type>::operator=(const stackType<Type>& otherStack)
{
    if (this != &otherStack) //avoid self-copy
        copyStack(otherStack);
    return *this;
} //end operator=




#endif /* stackType_h */
