#include <string>
#include <vector>
#include <sstream>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <sys/stat.h>
#include <unistd.h>
#include "ArgumentManager.h"

//definition prototypes
bool read_matrix(const char* filename, std::vector<std::vector<double> >& m);
void write_matrix(const char* filename, const std::vector<std::vector<double> >& o);
void Sum_Matrix(const std::vector<std::vector<double> >& m, std::vector<std::vector<double> >& o);

int main(int argc, char* argv[])
{
    if (argc < 2) {
        std::cout << "Usage: \"A=<file>;C=<file>\" A=Input file C=Output File" << std::endl;
        return -1;
    }
    
    ArgumentManager am(argc, argv);
    std::string infilename = am.get("A");
    std::string outfilename = am.get("C");
    std::cout << "File name for matrix A: " << infilename << std::endl
    << "File name for matrix C: " << outfilename << std::endl;
    
    std::vector<std::vector<double> > m;
    std::vector<std::vector<double> > o;
    if (read_matrix(infilename.c_str(), m))
        Sum_Matrix(m, o);
    write_matrix(outfilename.c_str(), o);
    
    return 0;
}

bool is_number(const std::string& s)
{
    std::string::const_iterator it = s.begin();
    while (it != s.end() && std::isdigit(*it)) ++it;
    return !s.empty() && it == s.end();
}

int get_matrix_size(const std::string& str){
    std::stringstream ss(str);
    int size = 0;
    std::string word;
    while (ss >> word){
        if (is_number(word)){
            size = std::stoi(word);
            break;
        }
    }
    return size;
}

bool read_matrix(const char* filename, std::vector<std::vector<double> >& m){
    std::ifstream ifs(filename);
    std::string str;
    getline(ifs, str);
    if (str.empty()){
        std::cout << "ERROR! Input file EMPTY!" << std::endl;
        return false;
    }
    
    if (get_matrix_size(str) <= 0) {
        std::cout << "ERROR! The size of Matrix is not valid!" << std::endl;
        return false;
    }
    
    while (getline(ifs, str)) {
        std::vector<double> row;
        std::stringstream ss(str);
        double num;
        while (ss >> num)
            row.push_back(num);
        if (!row.empty())
            m.push_back(row);
    }
    
    return true;
}

void write_matrix(const char* filename, const std::vector<std::vector<double> >& o){
    std::ofstream ofs(filename);
    if (o.empty()){
        ofs << " ";
        return;
    }
    //ofs << "#Matrix C=AA, 2 decimals\n";
    ofs.precision(2);
    ofs.setf(std::ios::fixed);
    for (size_t i = 0; i < o.size(); i++) {
        ofs << o[i][0];
        for (size_t j = 1; j < o[i].size(); j++)
            ofs << " " << o[i][j];
        ofs << "\n";
    }
}

void Sum_Matrix(const std::vector<std::vector<double> >& m, std::vector<std::vector<double> >& o) {
    double temprow,tempcol;
    //resizing output matrix to fit correct output
    o.clear();
    o.resize( 2, std::vector<double>(m.size(), 0));
    
    //setting output vector to sum of rows and columns
    for (size_t i = 0; i < m.size(); i++) {
        temprow = 0.0;
        tempcol = 0.0;
        for (size_t j = 0; j < m[i].size(); j++) {
            temprow+=m[i][j];
            tempcol+=m[j][i];
        }
        //sum of rows
        o[0][i]=temprow;
        //sum of columns
        o[1][i]=tempcol;
    }
    
}
