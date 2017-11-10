#define EMPTY -1
template<class type,int max_length>
class FastList//simple realization for fast insert and delete
{
private:
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
	
};
template<class type,int max_length>
class CloseList
{
	type data[max_length];
	int next[max_length];
	int i,cur;
public:
	CloseList()
	{
		for(i=0;i<max_length-1;i++)
			next[i]=i+1;
		next[i]=EMPTY;
		cur=0;
	}
	CloseList(type elem_array[],int n)//copy and intialize
	{
		for(i=0;i<n;i++)
		{
			data[i]=elem_array[i];
		}
		cur=n-1;
		for(i=0;i<max_length-1;i++)
			next[i]=i+1;
		next[i]=EMPTY;
	}
	~CloseList()
	{}
};