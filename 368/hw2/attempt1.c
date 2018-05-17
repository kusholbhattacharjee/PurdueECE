
/*  *** ATTEMPT 1 AT INSERTION SORT ***
	int gapSize = sizeof(gap); //size of gap array (loops of shell sort)
	int i = gapSize-1; //index of gap array which will get decremented until all gaps are done
	int j = 0; 
	int c = 0;
	while (i>=0){
		int **arr = (int **)malloc(gap[i] * sizeof(int *)); //2d array to be sorted
		for (j=0;j<gap[i]; j++){ //go through the gaps
			c = Size/gap[i]; 
			if ( (Size%gap[i]) > j )
				c = c+1;
			printf("\nfor gap:%d index:%d col:%d ",gap[i],j,c);
			arr[j] = (int *)malloc(c * sizeof(int));
		}
	
		int index1=0;
		int ct=0;
		int index2=0;
		while(index1<gap[i]){
			while(ct+gap[i]<Size){
				ct = ct+gap[i];
				arr[index1][index2] = Array[ct];
				index2++;
			}
			//_insertionSort(arr[index1],N_Comp,N_Move);
			index1++;
		}

		int a;int b;
		for (a=0;a<gap[i];a++){
			for(b=0;b<sizeof(arr[a]);b++){
				printf("%d ",arr[a][b]);
			}
			printf("\n");
		}

		i--;	
	}
*/
