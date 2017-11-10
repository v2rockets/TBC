#define For(i,bottom,top) for(i=bottom;i<=top;i++)
#define EMPTY -1
/*--------------------------------------------------------------------------------*/
template<class type>
class Matrix//dynomic 2d array
{
public:
	type*index;
	int rows,cols;
	Matrix(int m,int n):
	rows(m),cols(n){
		index=new type[m*n];
	}
	~Matrix(){
		delete []index;}
	inline type*operator[](int m){
		return index+m*cols;}
	int operator=(Matrix orgMatrix){
		if (rows!=orgMatrix.rows||cols!=orgMatrix.cols)
			return 0;
		for(int i=0;i<rows;i++)
			for(int j=0;j<cols;j++)
				index[i*cols+j]=orgMatrix.index[i*cols+j];
		return 1;
	}
};
/*--------------------------------------------------------------------------------*/
template<class type,int bottom1,int top1,int bottom2,int top2>
class FreeMatrix//This class may cause error when running in mutiple core computers.
{ 
public:
	type(*matrix)[top2-bottom2+1]; 
	FreeMatrix()
	{
		int*t;
		matrix=new type[top1-bottom1+1][top2-bottom2+1];
		t=(type*)matrix;
		t-=(top2-bottom2+1)*bottom1+bottom2;
		matrix=(type(*)[top2-bottom2+1])t;
	}
};
/*--------------------------------------------------------------------------------*/
template<class type>
struct Collection
{
	type*data;
	int count;
	int nmax;
	Collection(int max_length):
	nmax(max_length){
		data=new type[nmax];}
	int operator=(Collection orgCollection){
		this->count=orgCollection.count;
		for(int t=0;t<this->count;t++)
			this->data[t]=orgCollection.data[t];
		return 1;}
};
/*--------------------------------------------------------------------------------*/
template<class type,int max_length>
class FastList//simple realization to insert and delete fast.
{
protected:
	int i,p;
public:
	type data[max_length];
	bool exist[max_length];
	int count;
	FastList()
	{
		p=0;count=0;
		for(i=0;i<max_length;i++)
			exist[i]=false;
	}
	FastList(type elem_array[],int n)//copy and intialize
	{
		p=n;count=n;
		for(i=0;i<n;i++)
		{
			exist[i]=true;
			data[i]=elem_array[i];
		}
		for(;i<max_length;i++)
			exist[i]=false;
	}
	~FastList()
	{}
	int InsertElem(type elem)
	{
		for(;exist[p];p++);
		data[p]=elem;
		exist[p]=true;
		count++;
		return p++;
	}
	void DeleteElem(int num)
	{
		exist[num]=false;
		if (num<p)
			p=num;
		count--;
	}
	void ClearElem()
	{
		p=0;count=0;
		for(i=0;i<max_length;i++)
			exist[i]=false;
	}
};