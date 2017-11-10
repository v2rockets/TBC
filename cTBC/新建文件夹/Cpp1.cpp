#include<iostream.h>
#include"list.h"
int main()
{
	int a[]={1,2,3,4,5};
    int n;
	FastList<int,15> L(a,5);
	L.DeleteElem(2);
	L.DeleteElem(4);
	L.InsertElem(6);
	L.InsertElem(7);
	L.InsertElem(8);
	L.DeleteElem(0);
	L.InsertElem(9);
	for(n=0;n<10;n++)
		cout<<L.data[n]<<endl;
	for(n=0;n<5;)
		a[++n]=n;
	for(n=0;n<5;n++)
		cout<<a[n]<<endl;
	return 0;
}