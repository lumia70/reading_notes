#include<iostream>

#include "lua.hpp" 

using namespace std;


int getFromLua_fact(lua_State *pLua,const char* funName,int Num)
{
	lua_getglobal(pLua,funName); //���Ҷ�Ӧ�ĺ�����
	lua_pushnumber(pLua,Num);    //ѹ���һ������
	lua_pcall(pLua,1,1,0);      //���ýű�
	
	int Sum =(int)lua_tointeger(pLua,-1); //ת������
	lua_pop(pLua,1);    //��ջ

	return Sum;
}

int getFromLua_add(lua_State *pLua, const char *funName,int Num1,int Num2)
{ 
	lua_getglobal(pLua,funName);

	lua_pushnumber(pLua,Num1);
	lua_pushnumber(pLua,Num2);

	lua_pcall(pLua,2,1,0);

	int Sum =(int)lua_tointeger(pLua,-1);

	return Sum;
}
int main()
{
	lua_State * pLua;  //����ָ��
	pLua = lua_open(); //��ʼ������ָ��

    luaL_openlibs(pLua);    //���غ�����
	luaL_dofile(pLua,"test.lua"); //����ű�
    
	cout<<"������һ������"<<endl;
	int num;
	cin>>num;

	cout<<num<<"�Ľ׳�Ϊ"<<getFromLua_fact(pLua,"fact",num)<<endl; //���ú���

	cout<<num<<"�ӱ�Ϊ"<<getFromLua_add(pLua,"add",num,num)<<endl;

	lua_close(pLua); //�رն���ָ��

	return 0;

}