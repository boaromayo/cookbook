#include <iostream>
#include <string>
#include "bst.h"

using namespace std;

/**===============================
/* CONSTRUCTOR.
/**===============================**/
bst::bst() : root(NULL) {}

/**===============================
/* DESTRUCTOR.
/**===============================**/
bst::~bst() {}

void bst::nodeInsert(string newkey) {
	node * target = new node;
	target->key = newkey;
	target->left = NULL;
	target->right = NULL;
	
	node * prev = NULL; // Create previous node.
	node * curr = root; // Let the current node point to the root
	
	if (root == NULL) { // If there's no root in the tree...
		return; // Return if root is null
	} else {
		while (curr != NULL) {
			prev = curr;
			if (newkey < curr->key) {
				curr = curr->left;
			} else { 
				curr = curr->right; 
			}
		}
		
		target->parent = prev;
		
		if (prev == NULL) {
			root = target;
		} else if (newkey < prev->key) {
			prev->left = target;
		} else { 
			prev->right = target; 
		}
	}
}

void bst::nodeDelete(string delkey) {
	node * target = nodeFind(delkey); // target delete node, search before deleting
	
	// Transplant node depending on children of target node
	if (target != NULL) {
		if (target->left == NULL) {
			transplant(target, target->right);
		} else if (target->right == NULL) {
			transplant(target, target->left);
		} else {
			node * prev = nodeMin(target->right);
			if (prev->parent != target) {
				transplant(prev, prev->right);
				prev->right = target->right;
				prev->right->parent = prev;
			}
			
			// Move successor node to deleted node's position.
			transplant(target,prev);
			prev->left = target->left;
			prev->left->parent = prev;
		}
	}
}

node * bst::nodeFind(string findkey) {
	
	return find;
}

void bst::print(string order) {
	if (order=="IN")
		inorder(root);
	else if (order=="PRE")
		preorder(root);
	else if (order=="POST")
		postorder(root);
}

node * bst::nodeMin(node * x) {
	while (x->left != NULL) {
		x = x->left;
	}
	return x;
}

node * bst::nodeMax(node * x) {
	while (x->right != NULL) {
		x = x->right;
	}
	return x;
}

node * bst::successor(node * x) {
	return x;
}

void bst::transplant(node * u, node * v) {
	// If node u has no parent, then v is the root
	if (u->parent == NULL) {
		v = root;
	} else if (u == u->parent->left) {
		// Otherwise if u is the left child,
		// Make sure node v is the left child
		u->parent->left = v;
	} else {
		// otherwise set node v as the right child
		u->parent->right = v;
	}
	
	// Verify that v is a full node,
	// have v and u point to the same parent
	if (v != NULL) { v->parent = u->parent; }
}

void bst::preorder(node * x) {
	while (x != NULL) {
		cout << x->key << endl;
		preorder(x->left);
		preorder(x->right);
	}
}

void bst::postorder(node * x) {
	while (x != NULL) {
		postorder(x->left);
		postorder(x->right);
		cout << x->key << endl;
	}
}

void bst::inorder(node * x) {
	while (x != NULL) {
		inorder(x->left);
		cout << x->key << endl;
		inorder(x->right);
	}
}

int main() 
{
	bst t;
	
	t.print("POST");
	
	return 0;
}