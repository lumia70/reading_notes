--构造函数初始化表达式

--[[构造函数可以使用任何表达式初始化,也可以直接初始化数组。
	如Lua将第一个元素初始化days[1]（第一个元素索引为1）

	如果想初始化一个表作为记录数据使用可以这样：
	a = {x=0, y=0}  相当于  a = {}; a.x=0; a.y=0
	在构造函数的最后的","是可选的，可以方便以后的扩展。
	a = {[1]="red", [2]="green", [3]="blue",}
	在构造函数中域分隔符逗号（","）可以用分号（";"）替代，通常我们使用分号用来分割不同类型的表元素。
	{x=10, y=45; "one", "two", "three"}
	如果真的想要数组下标从0开始：
	days = {[0]="Sunday", "Monday", "Tuesday", "Wednesday",
	"Thursday", "Friday", "Saturday"}
	注意：不推荐数组下标从0开始，否则很多标准库不能使用。
--]]

days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}

print(days[1+2])
print(days)  --打印的是表的地址

days={[0]="Sunday",["Mon"]="Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}

print(days[0],days["Mon"])


days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday";["Sun"]="星期日","星期一"}
print(days["Sun"],days.Sun)   --一样输出星期日
print(days[8])                --输出星期一


days={Sun="Sunday",Mon="Monday",["Tue"]="Tuesday","Wednesday","Thursday","Friday","Saturday"}
print(days["Sun"],days.Sun,days["Tue"],days.Tue)
