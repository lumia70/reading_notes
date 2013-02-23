#include<iostream>

#include "lua.hpp" 

using namespace std;


int getFromLua_fact(lua_State *pLua,const char* funName,int Num)
{
	lua_getglobal(pLua,funName); //查找对应的函数名
	lua_pushnumber(pLua,Num);    //压入第一个参数
	lua_pcall(pLua,1,1,0);      //调用脚本
	
	int Sum =(int)lua_tointeger(pLua,-1); //转换类型
	lua_pop(pLua,1);    //出栈

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
	lua_State * pLua;  //对象指针
	pLua = lua_open(); //初始化对象指针

    luaL_openlibs(pLua);    //加载函数库
	luaL_dofile(pLua,"test.lua"); //载入脚本
    
	cout<<"请输入一个整数"<<endl;
	int num;
	cin>>num;

	cout<<num<<"的阶乘为"<<getFromLua_fact(pLua,"fact",num)<<endl; //调用函数

	cout<<num<<"加倍为"<<getFromLua_add(pLua,"add",num,num)<<endl;

	lua_close(pLua); //关闭对象指针

	return 0;

}