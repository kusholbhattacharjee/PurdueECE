
Node* Shell_Sort(Node* list){
	int size = 0;
	Node* temp = list;
	while(temp!=NULL){
		temp = temp->next;
		size++;
	}
	printf("%d",size);
	int* gap = getGapArray(size);
	int k = sizeof(gap)-1;
	Node* head = list;	
	Node* minP = list;
	Node* cP = list;
	Node* m = list;
	while (k>=0){
		int j;
		for(j=0;j<gap[k];j++){
			int x = j;
			while(x < (size-gap[k])){
				if (x==0){
					Node* ex = head;
					int i = x;
					while ((i+gap[k])<size){
						i = i+gap[k];
						if (cP->next->value < head->value)
							ex = cP;			
					}
					if(head->next == ex){
						//swap adjacent
						x = x+gap[k];
					}
					else{
						temp = ex->next->next;
						head = ex->next;
						ex->next = list;
						head->next = list->next;
						list->next = temp;
						x = x+gap[k];
					}
				}
				else{
					temp = head;
					minP = getLink(temp,x);
					temp = head;
					Node* ex = minP;
					int i = x;
					while ((i+gap[k])<size){
						i = i+gap[k];
						temp = head;
						cP = getLink(temp,i);
