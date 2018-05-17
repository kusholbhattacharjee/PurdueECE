
void getNextBox(Node* root,double* x, double* y,char Power){
	Node* curr = root;
	char Me = curr->label;
	if (curr->label == 'H'){
		if (curr->right->label!='H' && curr->right->label!='V') //if the right!=H/V
			createBox(curr->right,x,y,root->label);
		else 
			getNextBox(curr->right,x,y,root->label);

		if (curr->left->label!='H' && curr->left->label!='V') //if the right!=H/V
			createBox(curr->left,x,y,root->label);
		else 
			getNextBox(curr->left,x,y,root->label);

		createBox(curr,x,y,root->label);
	}
	else if (curr->label == 'V'){
		if (curr->left->label!='H' && curr->left->label!='V')
			createBox(curr->left,x,y,Me);
		else
			getNextBox(curr->left,x,y,Power);

		if (curr->right->label!='H' && curr->right->label!='V') //if the right!=H/V
			createBox(curr->right,x,y,root->label);
		else 
			getNextBox(curr->right,x,y,root->label);

		createBox(curr,x,y,root->label);
	}
	return;
}

void createBox(Node* root,double* x,double* y,char r){ //pass in block needed to be made
	Node* node = root;
	if (node->label!='H' && node->label!='V'){ //end num on one side 
		if (r=='H'){
			root->xcoord = 0.0;
			root->ycoord = *y;
			*y = *y + root->height; 
		}
		else{
			root->xcoord = *x;
			//root->xcoord = *x + root->width;
			root->ycoord = 0.0;
			*x = *x + root->width;
		}
	}
	else { //both created boxes
		if (node->label=='H'){
			//both left and right are coordinated wau

			node->xcoord = node->right->xcoord;
			node->ycoord = node->right->height;

			if (node->right->width > node->left->width)
				node->width = node->right->width;
			else
				node->width = node->left->width;
			node->height = node->left->height + node->right->height;

			*x = node->width;
			*y = node->height;
		}
		else{ 
			//both left and right are coordinated wau
			node->ycoord = node->left->ycoord;
			node->xcoord = node->left->width;
			if (node->right->height > node->left->height)
				node->height = node->right->height;
			else
				node->height = node->left->height;
			node->width = node->left->width + node->right->width;

			*x = node->width;
			*y = node->height;
		}
	}
}
void getNextBox(Node* root){
	Node* curr = root;
	double x = 0.0;
	double y = 0.0;
	if (curr->label == 'H'){
		if (curr->right->label!='H' || curr->right->label!='V') //if the right!=H/V
			createBox(curr->right,&x,&y,root->label);
		else 
			getNextBox(curr->right);

		if (curr->left->label!='H' || curr->left->label!='V') //if the right!=H/V
			createBox(curr->left,&x,&y,root->label);
		else 
			getNextBox(curr->left);

		createBox(curr,&x,&y,root->label);
	}
	else if (curr->label == 'V'){
		if (curr->left->label!='H' || curr->left->label!='V')
			createBox(curr->left,&x,&y,root->label);
		else
			getNextBox(curr->left);

		if (curr->right->label!='H' || curr->right->label!='V') //if the right!=H/V
			createBox(curr->right,&x,&y,root->label);
		else 
			getNextBox(curr->right);

		createBox(curr,&x,&y,root->label);
	}
	return;
}
