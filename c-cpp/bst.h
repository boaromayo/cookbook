#ifndef bst_h
#define bst_h

#include <string>

class bst {
public:
	// The node struct
	struct node {
		string key;  // the key string
		node * parent; // the parent node of the node
		node * left;   // the left child node of the node
		node * right;  // the right child node of the node
	}
	
private:
	node * root; // The starting node of the tree

public:
	bst();	// CONSTRUCTOR.
	bst(node * r) { root = r; } // CONSTRUCTOR(root).
	~bst(); // DESTRUCTOR.
	void nodeInsert(string newkey); // insert a node into tree.
	void nodeDelete(string delkey); // delete a node from tree.
	node * nodeFind(string findkey);
	void print(string order); // print the node.
	
private:
	node * nodeMin(node * x);
	node * nodeMax(node * x);
	node * successor(node * x);
	void transplant(node * u, node * v);
	void preorder(node * x); // print node pre-order
	void postorder(node * x); // print node post-order
	void inorder(node * x); // print node in-order
};

#endif // bst.h