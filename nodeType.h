
using namespace std;

template <class Type>
struct nodeType {
public:
	Type info;
	nodeType<Type> *link;
};
