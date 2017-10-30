#pragma once
#include "nodeType.h"

using namespace std;

// =========================================================================
// =======                   class linkedListType                    =======
// =========================================================================

template <class Type>
class linkedListType {
public:
	const linkedListType<Type>& operator=(const linkedListType<Type>&); 

	void initializedList(); 

	bool isEmptyList() const; 

	void print() const; 

	int length() const; 

	void destroyList(); 

	Type front() const; 

	Type back() const; 

	linkedListType();

	linkedListType(const linkedListType<Type>& otherList); 

	~linkedListType();

protected:
	int count = 0;
	nodeType<Type> *first; 
	nodeType<Type> *last;

private: 
	void copyList(const linkedListType<Type>& otherList); 
};

template <class Type>
bool linkedListType<Type>::isEmptyList() const {
	return (first == NULL);
}

template <class Type>
linkedListType<Type>::linkedListType() { 
	first = NULL;
	last = NULL;
	count = 0;
}

template <class Type>
void linkedListType<Type>::destroyList() {
	nodeType<Type>* temp; 

	while (first != NULL) { 
		temp = first; 
		first = first->link;
		delete temp; 
	}

	last = NULL; 

	count = 0;
}

template <class Type>
void linkedListType<Type>::initializedList() {
	destroyList();
}

template <class Type>
void linkedListType<Type>::print() const {
	nodeType<Type> *current; 

	current = first; 
	while (current != NULL) {
		cout << current->info << " ";
		current = current->link;
	}
}

template <class Type>
int linkedListType<Type>::length() const {
	return count;
}

template <class Type>
Type linkedListType<Type>::front() const {
	assert(first != NULL);

	return first->info;
};

template <class Type>
Type linkedListType<Type>::back() const {
	assert(last != NULL);

	return last->info; 
};

template <class Type>
void linkedListType<Type>::copyList(const linkedListType<Type>& otherList) {
	nodeType<Type> *newNode; 
	nodeType<Type> *current; 

	if (first != NULL) {
		destroyList();
	}
	if (otherList.first == NULL) {
		first = NULL;
		last = NULL;
		count = 0;
	}
	else {
		current = otherList.first; 
		count = otherList.count;

		first = new nodeType<Type>;
		first->info = current->info; 
		first->link = NULL; 
		last = first; 
		current = current->link; 

		while (current != NULL) {
			newNode = new nodeType<Type>;
			newNode->info = current->info;
			newNode->link = NULL; 
			last->link = newNode;
			last = newNode;
			current = current->link; 
		} 
	} 
}; 

template <class Type>
linkedListType<Type>::~linkedListType() {
	destroyList();
}

template <class Type>
linkedListType<Type>::linkedListType(const linkedListType<Type>& otherList) {
	first = NULL;
	copyList(otherList);
};

// Overload the assignment operator
template <class Type>
const linkedListType<Type>& linkedListType<Type>::operator=(const linkedListType<Type>& otherList) {
	if (this != &otherList) { 
		copyList(otherList);
	}

	return *this;
};
