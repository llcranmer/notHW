#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>
#include "student.h"

using namespace std;

template <class Type>
class orderedLinkedList : public linkedListType<Type> {

public:
    // default constructor
	orderedLinkedList();
    
    // insert function
	void INSERT(Type& Student);

	void PRINT_ROSTER(fstream&);

	void PRINT_STUDENT(const string& First_Name, const string& Last_Name, fstream&);

	void DELETE_STUDENT(const string& First_Name, const string& Last_Name);

	void DELETE_ID(const int& ID_number);

	void UPDATE_GPA(const string& First_Name, const string& Last_Name, const double& GPA);

	void UPDATE_MAJOR(const string& First_Name, const string& Last_Name, const string& Major);

	void ADD_CLASS(const string& First_Name, const string& Last_Name, int& Current_Credits = 3);

	void REMOVE_CLASS(const string& First_Name, const string& Last_Name, const int& credits = 3);

	void PRINT_BY_MAJOR(const string& Major, fstream&);

	void PRINT_BY_GPA(const double& GPA, fstream&);

	void CMD(string command, fstream& infile, fstream& outfile);

	void GPA(fstream&);


};


template<class Type>
orderedLinkedList<Type>::orderedLinkedList() {}

template<class Type>
void orderedLinkedList<Type>::INSERT(Type& student) {

	//setting pointers
	nodeType<Type> *current;
	nodeType<Type> *trailCurrent;
	nodeType<Type> *newNode;

	current = this->first;
	// filling the new node

	newNode = new nodeType<Type>;
	// new node filled 
	newNode->info = student;
	bool found = false;

	// first node 
	if (this->first == NULL) {
		this->first = newNode;
		this->last = newNode;
		this->count++;
	}
	else {
	
		trailCurrent = this->first;
	
		while (current != NULL && !found) {
			if (newNode->info.getlastname() > current->info.getlastname()) {
				trailCurrent = current;
				current = current->link;
			

			}
			else if (newNode->info.getlastname() == current->info.getlastname()) {
			
				found = true;
				break;
			}
			else {
				

				break;
			}

		}

		if (current == NULL) { //if inserting node at the end of the node
			trailCurrent->link = newNode;
			newNode->link = NULL;
			this->count++;

		}
		else if ((newNode->info.getlastname() == current->info.getlastname()) && (newNode->info.getfirstname() == current->info.getfirstname())) {
		}
		else {
			trailCurrent = current->link;
			current->link = newNode;
			newNode->link = trailCurrent;

			
		}

	}
}

template <class Type>
void orderedLinkedList<Type>::PRINT_ROSTER(fstream& poofile) {
	nodeType<Type> *current;

	current = this->first;

	while (current != NULL) {
		poofile << current->info.getfirstname() << " " << current->info.getlastname() << ", " << current->info.getid() << endl;
		current = current->link;
	}
	poofile << endl;
}

template <class Type>
void orderedLinkedList<Type>::PRINT_STUDENT(const string& First_Name, const string& Last_Name, fstream& poofile) { // finding an individual student in the list and printing their information
	nodeType<Type> *current;
	double gpa = 0.00;

	current = this->first;

	while (current != NULL) {
		if ((current->info.getfirstname() == First_Name) && (current->info.getlastname() == Last_Name)) {
			gpa += current->info.getgpa();
			poofile << current->info.getfirstname() << " " << current->info.getlastname() << ", " << current->info.getid() << endl
				<< "Major: " << current->info.getmajor() << endl << "GPA: " << setprecision(3) << gpa << endl << "Credits Enrolled: "
				<< current->info.getcredit();
		}
		current = current->link;
	}
}

template <class Type>
void orderedLinkedList<Type>::DELETE_STUDENT(const string& First_Name, const string& Last_Name) { // deleting a student from the list
	nodeType<Type> *current;
	nodeType<Type> *trailCurrent;
	bool found;
	if (this->first == NULL) { //if list is empty
		cout << "Cannot delete from an empty list." << endl;
	}
	else {
		current = this->first;
		found = false;
		while (current != NULL && !found)
		{
			if ((current->info.getfirstname() >= First_Name) && (current->info.getlastname() >= Last_Name))
			{
				found = true;
			}
			else {
				trailCurrent = current;
				current = current->link;
			}
			if (current == NULL)
			{
				cout << "The item to be deleted is not in the list" << endl;
			}
			else {
				if (current->info.getfirstname() == First_Name && current->info.getlastname() == Last_Name)
				{
					if (this->first == current)
					{
						this->first = this->first->link;

						if (this->first == NULL) {
							this->last = NULL;
						}
                        // delete the node
						delete current;
					}
					else {
						trailCurrent->link = current->link;
						if (current == this->last)
						{
							this->last = trailCurrent;
							delete current;
						}
						this->count--;

					}
				}
			}

		}
	}
}

template <class Type>
void orderedLinkedList<Type>::DELETE_ID(const int& ID_number) {
    // delete student by id number
	nodeType<Type> *current;
	current = this->first;

	while (ID_number != current->info.getid() && current != NULL) {
        // check name of student with the id
		current = current->link;
	} // delete the student
	if (ID_number == current->info.getid())
		DELETE_STUDENT(current->info.getfirstname(), current->info.getlastname());

}

template <class Type>
void orderedLinkedList<Type>::UPDATE_GPA(const string& First_Name, const string& Last_Name, const double& GPA) {
	nodeType<Type> *current;
	current = this->first;

	while (((First_Name != current->info.getfirstname() && current->info.getlastname() != Last_Name) && current != NULL))
	{
		current = current->link;
	}
	if ((First_Name == current->info.getfirstname() && current->info.getlastname() == Last_Name))
    {
		current->info.setgpa(GPA);

	}
}

template <class Type>
void orderedLinkedList<Type>::UPDATE_MAJOR(const string& First_Name, const string& Last_Name, const string& Major) {
	nodeType<Type> *current;
	current = this->first;
    // searching for the student node
	while ((First_Name != current->info.getfirstname() && current->info.getlastname() != Last_Name) && current != NULL)
	{
		current = current->link;
	}
	if (First_Name != current->info.getfirstname() && current->info.getlastname() != Last_Name)
        // change nodes major
	{
		current->info.setmajor(Major);

	}
}

template <class Type>
void orderedLinkedList<Type>::ADD_CLASS(const string& First_Name, const string& Last_Name, int& Current_Credits) {
	nodeType<Type> *current;
	current = this->first;

	while ((First_Name != current->info.getfirstname() && current->info.getlastname() != Last_Name) && current != NULL) {
        // finds students node
		current = current->link;
	}
	if ((First_Name == current->info.getfirstname() && current->info.getlastname() == Last_Name)) {
        // changes the students credits
		current->info.setcredit(current->info.getcredit() + Current_Credits);
	}
}

template <class Type>
void orderedLinkedList<Type>::REMOVE_CLASS(const string& First_Name, const string& Last_Name, const int& Credits) {
	nodeType<Type> *current;
	current = this->first;

	while ((First_Name != current->info.getfirstname() && current->info.getlastname() != Last_Name) && current != NULL) {
  
		current = current->link;
	}
	if ((First_Name == current->info.getfirstname() && current->info.getlastname() == Last_Name)) {
		current->info.setcredit(current->info.getcredit() - Credits);
	}
}

template <class Type>
void orderedLinkedList<Type>::PRINT_BY_MAJOR(const string& Major, fstream& poofile) {
	nodeType<Type> *current;
	current = this->first;

	while (current != NULL) {
	
		if (Major == current->info.getmajor()) {
			poofile << current->info.getfirstname() << " " << current->info.getlastname() << " " << current->info.getid() << "\n";
			current = current->link;
			
		}
		else {
			current = current->link;
			
		}
	}
}

template <class Type>
void orderedLinkedList<Type>::PRINT_BY_GPA(const double& GPA, fstream& poofile) {
	nodeType<Type> *current;

	current = this->first;

	while (current != NULL) {

		if (current->info.getgpa() >= GPA) {
			poofile << current->info.getfirstname() << " " << current->info.getlastname() << " " << current->info.getid() << "\n";
			current = current->link;
		}
		else {
			current = current->link;
		}
	}
}

template <class Type>
void orderedLinkedList<Type>::GPA(fstream& poofile) {
	nodeType<Type> *current;
	current = this->first;
	double gpa = 0.00;
	double ct = 0;
    // searches the list and  computes the mean
	while (current != NULL) {
        gpa += current->info.getgpa();
		current = current->link;
		ct++;
	}


	gpa = gpa / ct;

	poofile << "GPA mean: " << setprecision(3) << gpa << endl; // prints
}





// Reads the commands fed to it
template<class Type>
void orderedLinkedList<Type>::CMD(string command, fstream& infile, fstream& outfile) {
	int count = 0;
	string str, str2;
	int id = 0;
	int credits = 0;
	double gpa = 0.0;
	Student node;
	cout << command << endl;
	stringstream ss;
	if (command == "INSERT" || command == "INSERT\n" || command == "INSERT ") {
		
		getline(infile, str);
		id = stoi(str);
		node.setid(id);

		getline(infile, str);
		node.setfirstname(str);

		getline(infile, str);
		node.setlastname(str);

		getline(infile, str);
		node.setmajor(str);

		getline(infile, str);
		ss << str;
		ss >> gpa;
		node.setgpa(gpa);
		ss.clear();

		getline(infile, str);
		credits = stoi(str);
		node.setcredit(credits);

		INSERT(node);

	}
	else if (command == "PRINT_ROSTER") {
	
		PRINT_ROSTER(outfile);

	}
	else if (command == "PRINT_BY_MAJOR") {
		getline(infile, str);

		PRINT_BY_MAJOR(str, outfile);
		outfile << "\n";

	}
	else if (command == "PRINT_BY_GPA") {
		getline(infile, str);
		gpa = stod(str);
		PRINT_BY_GPA(gpa, outfile);
		outfile << "\n";

	}
	else if (command == "PRINT_STUDENT") {
		getline(infile, str);
		getline(infile, str2);
		PRINT_STUDENT(str, str2, outfile);
		outfile << "\n";

	}
	else if (command == "DELETE_STUDENT") {
		getline(infile, str);
		getline(infile, str2);
		DELETE_STUDENT(str, str2);


	}
	else if (command == "DELETE_ID") {
		getline(infile, str);
		id = stoi(str);
		DELETE_ID(id);


	}
	else if (command == "UPDATE_GPA") {
		string str3;
		getline(infile, str);
		getline(infile, str2);
		getline(infile, str3);
		ss << str3;
		ss >> gpa;
		UPDATE_GPA(str, str2, gpa);
		ss.clear();


	}
	else if (command == "UPDATE_MAJOR") {
		string str3;
		getline(infile, str);
		getline(infile, str2);
		getline(infile, str3);


		UPDATE_MAJOR(str, str2, str3);


	}
	else if (command == "ADD_CLASS") {
		string str3;
		getline(infile, str);
		getline(infile, str2);
		getline(infile, str3);
		id = stoi(str3);

		ADD_CLASS(str, str2, id);


	}
	else if (command == "REMOVE_CLASS") {
		string str3;
		getline(infile, str);
		getline(infile, str2);
		getline(infile, str3);
		id = stoi(str3);
		REMOVE_CLASS(str, str2, id);

	}
	else if (command == "GPA") {
		GPA(outfile);
		outfile << "\n";

	}
	else if (command == "") {

	}
	else {
		cerr << "ERROR Command not recognized! " << endl;
	}
}
