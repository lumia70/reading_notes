--[[ 当函数参数很多的时候，这种用表的结构作为实参，是很好的传参方式
w = Window {
x=0, y=0, width=300, height=200,
title = "Lua", background="blue",
border = true
}
function Window(options)
-- check mandatory options
if type(options.title) ~= "string" then
error("no title")
elseif type(options.width) ~= "number" then
error("no width")
elseif type(options.height) ~= "number" then
error("no height")
end

-- everything else is optional
_Window(options.title,
options.x or 0, -- default value
options.y or 0, -- default value
options.width, options.height,
options.background or "white", -- default
options.border -- default is false (nil)
)
--]]


--[[
	逻辑运算符
	and or not

	逻辑运算符认为false和nil是假（false），其他为真，0也是true.
	and和or的运算结果不是true和false，而是和它的两个操作数相关。
	a and b -- 如果a为false，则返回a，否则返回b
	a or b 	-- 如果a为true，则返回a，否则返回b


	一个很实用的技巧：如果x为false或者nil则给x赋初始值v
	x = x or v
	等价于
	if not x then
	x = v
	end

	and的优先级比or高。

	C语言中的三元运算符
	a ? b : c
	在Lua中可以这样实现：
	(a and b) or c

--]]



--[[
	构造函数可以使用任何表达式初始化,也可以直接初始化数组。
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

print("------------用表做数组")
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[3])	--输出:Tuesday

--[[
	每次调用构造函数，Lua都会创建一个新的table，可以使用table构造一个list

	不管用何种方式创建table，我们都可以向表中添加或者删除任何类型的域(即表中的数据可以是八种基本类型中的一种)，构造函数仅仅影响表的初始化?
	也就是说table中的成员可以是 function函数、table表等数据类型（可以参考下面的实例 “一种简单的对象实现方式”）
--]]

print("-----------使用table表构造一个链表list")
list = nil
--for line in io.lines() do
for x = 1,10 do
	list = {next=list, value=x}
end

local i = 1
while i <= 10 do
	print(list.value)
	i = i + 1
	list = list.next
end

--[[
	 可以嵌套构造函数来表示复杂的数据结构.
--]]
--在同一个构造函数中可以混合列表风格和record风格进行初始化，如下
polyline = {color="blue", thickness=2, npoints=4,
	{x=0, y=0},
	{x=-10, y=0},
	{x=-10, y=1},
	{x=0, y=1}
	}

print(polyline[2].x)	 --输出： -10

--[[ 循环语句--]]
--数值for循环打印一组数
print("-----------------数值for循环")

for i = 1, 10 do
	print(i)
end

--[[
	范型for循环,print all keys of table 't'
--]]
print("----------------范型for循环")
--t = {7,8,34,10,65,23,11}
t = {}
t2 = {x = 1, ["hello"] = "world!"}

t.astring = "ni,hao!"
t[1] = 100
t["a table"] = b

function foo()
end
function bar()
end
t[foo] = bar

--分别穷举表t和t2
for k,v in pairs(t) do
	print(k,"==>",v)
end
print("-------------------------")
for k,v in pairs(t2) do
	print(k, "==>", v)
end


--[[
	while循环
--]]
print("while loop demo")
x = 10
local i = 1	--local to the chunk

while i <= x do
	local x = i*2	--local to the while body
	print(x)	-->2,4,6,8,..
	i = i + 1
end

if i > 20 then
	local x	--local to the "then" body
	x = 20
	print(x + 2)
else
	print(x)	-->10 (the global one)
end

print(x)	-->10 (the global one)



--repeat-until 循环语句
print("repeat ... until 循环语句")
--string.format("%q", 'repeat ... until循环语句\n new line!') 可以按指定格式输出字符串,跟C的Printf格式类似，而pint不能指定格式输出
local num = 1

repeat
	i = 1
	local n = i
	num = num + n
	i = i + 1
until i <= 10

print(num)


--test
print(".....................");
local x = 1;
if (x > 0) then
	print("test");
end


--function函数编写和调用
print("----------------function函数调用---------")
function foo(a, b, c)
	local sum = a + b
	return sum, c
end

r1, r2 = foo(1, '123', 'hello world')
r3,r4 = 10 .."ping", "xiexie"
print(r1, r2, r3, r4)

--[[
	Lua也提供了面向对象方式调用函数的语法，比如o:foo(x)与o.foo(o, x)是等价的.

	下面实例解说
	1.对象工厂模式
	如前面代码的create函数

	2.用表来表示对象
	把对象的数据和方法都放在一张表内，虽然没有隐藏私有成员，但对于简单
	脚本来说完全可以接受。

	3.成员方法的定义
	function obj:method(a1, a2, ...) … end 等价于
	function obj.method(self, a1, a2, ...) … end 等价于
	obj.method = function (self, a1, a2, ...) … end

	4.成员方法的调用
	obj:method(a1, a2, …) 等价于
	obj.method(obj, a1, a2, ...)
--]]
--一种简单的对象实现方式

function PFN_Create(name, id)
	local C_Obj = {m_name = name, m_id = id}
	function C_Obj:SetName(name)
		self.m_name = name
	end
	function C_Obj:GetName()
		return self.m_name
	end

	function C_Obj:SetId(id)
		self.m_id = id
	end
	function C_Obj:GetId()
		return self.m_id
	end

	return C_Obj
end

print("----------一种简单的对象实现方式")

C_O1 = PFN_Create("Sam", 001)

print("C_O1'S name:", C_O1:GetName(), "C_O1's id:", C_O1:GetId())

C_O1.SetName(C_O1, "SUerge Ping")
C_O1.SetId(C_O1, 100)
print("C_O1's name:", C_O1.GetName(C_O1), "C_O1's id:", C_O1.GetId(C_O1))


--[[
简单继承

优点：
	简单、直观
缺点：
	传统、不够动态
--]]
print("------------------简单继承")

function PFN_CreateRobot(name, id)
	local C_Obj = { m_name = name, m_id = id}
	function C_Obj:SetName(name)
		self.m_name = name
	end
	function C_Obj:GetName()
		return self.m_name
	end

	function C_Obj:SetId(id)
		return self.m_id
	end
	function C_Obj:GetId()
		return self.m_id
	end

	return C_Obj
end

function PFN_CreateFootballRobot(name, id, position)
	local C_Obj = PFN_CreateRobot(name, id)
	C_Obj.m_position = "right back"

	function C_Obj:SetPosition(position)
		self.m_position = position
	end
	function C_Obj:GetPostion()
		return self.m_position
	end

	return C_Obj
end

C_OX = PFN_CreateFootballRobot("Surge Ping", 248, "右后卫")

C_OX.SetName(C_OX, "luonaerduo")
C_OX.SetPosition(C_OX, "右后卫")

print("C_OX's name,id,position:", C_OX.GetName(C_OX), C_OX.GetId(C_OX), C_OX.GetPostion(C_OX))

--[[
	函数闭包

	1.一个函数所使用的定义在它的函数体之外的局部变量（external local variable）称为这个函数的upvalue。
	在前面的代码中，函数countDown使用的定义在函数createCountdownTimer中的局部变量ms就是countDown的upvalue，但ms对createCountdownTimer而
	言只是一个局部变量，不是upvalue。
	Upvalue是Lua不同于C/C++的特有属性，需要结合代码仔细体会。

	2.函数闭包
	一个函数和它所使用的所有upvalue构成了一个函数闭包。

	3.Lua函数闭包与C函数的比较
	Lua函数闭包使函数具有保持它自己的状态的能力，从这个意义上说，可以与带静态局部变量的C函数相类比。但二者有显著的不同：对Lua来说，函数
	是一种基本数据类型——代表一种（可执行）对象，可以有自己的状态；但是对带静态局部变量的C函数来说，它并不是C的一种数据类型，更不会产生
	什么对象实例，它只是一个静态地址的符号名称。

	4.说明：
		局部函数（非全局函数）
		声明局部函数的两种方式：
		1）. 方式一
			local f = function (...)
			...
			end
			local g = function (...)
			...
			f() -- external local `f' is visible here
			...
			end
		2）. 方式二
			local function f (...)
			...
			end

		有一点需要注意的是在声明递归局部函数的方式：

		local fact = function (n)
			if n == 0 then
			return 1
			else
			return n*fact(n-1) --有问题的
			end
		end


		local fact	--上面这种方式导致Lua编译时遇到fact(n-1)并不知道他是局部函数fact，Lua会去查
									找是否有这样的全局函数fact。为了解决这个问题我们必须在定义函数以前先声明：

		fact = function (n)
			if n == 0 then
			return 1
			else
			return n*fact(n-1)
			end
		end
		这样在fact内部fact(n-1)调用是一个局部函数调用，运行时fact就可以获取正确的值了。
--]]

function PFN_CreateCountdownTimer(seconds)
	local ms = seconds * 1000	--局部变量ms，就是PFN_CountDown函数的upvalue
	local function PFN_CountDown()	--局部函数
		ms = ms - 1
		return ms
	end

	return PFN_CountDown
end

print("------------函数闭包")
timer1 = PFN_CreateCountdownTimer(1)
for i = 1, 3 do
	print(timer1())
end

print("------")

timer2 = PFN_CreateCountdownTimer(1)
for i = 1, 3 do
	print(timer2())
end

--[[
	基于对象的实现方式

	1.实现方式
	把需要隐藏的成员放在一张表里，把该表作为成员函数的upvalue。

	2.局限性
	基于对象的实现不涉及继承及多态。但另一方面，脚本编程是否需要继承和
	多态要视情况而定。
--]]
function PFN_Create(name, id)
	local data = {m_name = name, m_id = id}	--把需要隐藏的数据成员m_name,m_id放入data表中
	local c_obj = {}
	function c_obj:SetName(name)
		data.m_name = name
	end
	function c_obj:GetName()
		return data.m_name
	end

	function c_obj:SetId(id)
		data.m_id = id
	end
	function c_obj:GetId()
		return data.m_id
	end

	return c_obj
end

c_o1 = PFN_Create("Suregeping", 6565)
c_o2 = PFN_Create("hello".. ",Jim", 007)

c_o1.SetName(c_o1, "welcome")
--c_o2.SetName(c_o2, "Jim")

print("c_o1's name,id:", c_o1.GetName(c_O1), c_o1.GetId(c_o1))
print("c_o2's name,id:", c_o2.GetName(c_o2), c_o2.GetId(c_o2))


--[[
	元表

	Lua 中的每个值都可以用一个 metatable。这个 metatable 就是一个原始的Lua table ，它用来定义原始值在特定操作下的行为。你可以通过在 metatable 中的特定域设一些值来改变拥有这个 metatable 的值的指定操作之行为。举例来说，当一个非数字的值作加法操作的时候， Lua 会检查它的 metatable 中 "__add" 域中的是否有一个函数。如果有这么一个函数的话，Lua 调用这个函数来执行一次加法。

	可以通过 getmetatable 函数来查询到任何一个值的 metatable。
	你可以通过 setmetatable 函数来替换掉 table 的 metatable

	每个 table 和 userdata都可以拥有独立的 metatable
	（当然多个 table 和userdata可以共享一个相同的表作它们的metatable）；其它所有类型的值，每种类型都分别共享唯一的一个 metatable。
	因此，所有的数字一起只有一个 metatable ，所有的字符串也是，等等。

	元表的键名称为 事件,其中的值（换而言之就是函数）称为元方法。

	一个 metatable 可以控制一个对象做数学运算操作、比较操作、连接操作、取长度操作、取下标操作时的行为，
    metatable 可以控制的操作已在下面列出来。每个操作都用相应的名字区分。
	每个操作的键名都是用操作名字加上两个下划线 '__' 前缀的字符串；举例来说，"add" 操作的键名就是字符串 "__add"。这些操作的语义用一个 Lua 函数来描述解释器如何执行更为恰当。

	1.定义
	元表本身只是一个普通的表，通过特定的方法（比如setmetatable）设置到
	某个对象上，进而影响这个对象的行为；一个对象有哪些行为受到元表影响
	以及这些行为按照何种方式受到影响是受Lua语言约束的。比如在前面的代
	码里，两个表对象的加法运算，如果没有元表的干预，就是一种错误；但是
	Lua规定了元表可以“重载”对象的加法运算符，因此若把定义了加法运算
	的元表设置到那两个表上，它们就可以做加法了。元表是Lua最关键的概念
	之一，内容也很丰富，请参考Lua文档了解详情。

	2.元表与C++虚表的比较
	如果把表比作对象，元表就是可以改变对象行为的“元”对象。在某种程度
	上，元表可以与C++的虚表做一类比。但二者还是迥然不同的：元表可以动
	态的改变，C++虚表是静态不变的；元表可以影响表（以及其他类型的对
	象）的很多方面的行为，虚表主要是为了定位对象的虚方法（最多再带上一
	点点RTTI）

	__concat连接操作，__add加法操作（其他算法运算类似)，取下标操作（用于访问table[key]）__index,
	比较操作，如等于__eq,小于__lt，小于等于__le等,取长度操作__len

--]]
print("---------------元表01")

t = {}
m = {a = "and", b = "Li Lei", c = "Han Meimei"}

setmetatable(t, {__index = m}) --表{__index = m}作为表t的元表

for k, v in pairs(t) do --穷举表
	print(k, v)	--其实没数据
end
print("--------")
print(t.b, t.a, t.c)





print("----------------元表02")

function add(t1, t2)
	assert(#t1 == #t2)	--运算符#取表长度

	local length = #t1
	for	i = 1, length do
		t1[i] = t1[i] + t2[i]
	end

	return t1
end

t1 = setmetatable({1, 2, 3}, {__add = add})	--setmetatable返回被设置的表
t2 = setmetatable({10, 20, 30}, {__add = add})

t1 = t1 + t2
for i = 1, #t1 do
	print(t1[i])
end


--[[
	基于原型的继承

	1.prototype模式
	一个对象既是一个普通的对象，同时也可以作为创建其他对象的原型的对象（即类对象，class object）；动态的改变原型对象的属性就可以动态的影
	响所有基于此原型的对象；另外，基于一个原型被创建出来的对象可以重载任何属于这个原型对象的方法、属性而不影响原型对象；同时，基于原型被
	创建出来的对象还可以作为原型来创建其他对象。

--]]

print("-------------------基于原型的继承")

Robot = {m_name = "Sam", m_id = 001}

function Robot:PFN_New(extension)
	local t = setmetatable(extension or {}, self)
	self.__index = self
	return t
end

function Robot:PFN_SetName(name)
	self.m_name = name
end
function Robot:PFN_GetName()
	return self.m_name
end

function Robot:PFN_SetId(id)
	self.m_id = id
end
function Robot:PFN_GetId()
	return self.m_id
end

robot = Robot:PFN_New()

print("Robot's name:", Robot:PFN_GetName())
print("Robot's id:", Robot:PFN_GetId())
print("-------------")

FootBallRobot = Robot:PFN_New({m_position = "right back"})

function FootBallRobot:PFN_SetPosition(p)
	self.m_position = p
end
function FootBallRobot:PFN_GetPosition()
	return self.m_position
end

fbr = FootBallRobot:PFN_New()

print("fbr's position:", FootBallRobot:PFN_GetPosition())
print("fbr's name:", FootBallRobot:PFN_GetName())
print("fbr's id:", FootBallRobot:PFN_GetId())
print("-------------")

fbr:PFN_SetName("Surge Ping")
print("fbr's name:", fbr:PFN_GetName())
print("Robot's Name:", Robot:PFN_GetName())



--[[
	函数环境
	1.定义
	函数环境就是函数在执行时所见的全局变量的集合，以一个表来承载。

	2.说明
	每个函数都可以有自己的环境，可以通过setfenv来显示的指定一个函数的环境。如果不显示的指定，函数的环境缺省为定义该函数的函数的环境。
	类型为 thread ，function ，以及 userdata 的对象，除了 metatable元表外，还可以用另外一个与之关联的被称作它们的环境的一个表，像 metatable 一样，环境也是一个常规的 table ，多个对象可以共享同一个环境。

	关联在线程上的环境被称作全局环境。全局环境被用作它其中的线程以及线程创建的非嵌套函数（通过 loadfile ， loadstring 或是 load ）的缺省环境。
	关联在 C 函数上的环境可以直接被 C 代码访问（参见 §3.3）。它们会作为这个 C 函数中创建的其它函数的缺省环境。
	关联在 Lua 函数上的环境用来接管在函数内对全局变量的所有访问。它们也会作为这个函数内创建的其它函数的缺省环境。

	可以通过调用 setfenv 来改变一个 Lua函数或是正在运行中的线程的环境。而想操控其它对象（userdata、C函数、其它线程）的环境的话，就必须使用 C API 。


	在前面的代码中，函数foo的缺省环境里没有定义变量g，因此第一次执行foo， g为nil，表达式g or "No g defined!"的值就是"No g defined!"。
	随后，foo被指定了一个环境 { g = 100, print = print }。这个环境定义了（全局）变量g，以及打印函数print，因此第二次执行foo，g的值就是
	100。但是在定义函数foo的函数的环境下，g仍然是一个未定义的变量。

	3.应用
	函数环境的作用很多，利用它可以实现函数执行的“安全沙箱”；另外Lua的包的实现也依赖它。

--]]
print("---------------函数环境")

function foo()
	print(g or "No g defined!")
end

foo()

setfenv(foo, {g = 100, print = print})	--设置foo的环境为表{g=100,...}
foo()
print(g or "No g defined!")



--[[
	包

	1.使用方式
	       一般用require函数来导入一个包，要导入的包必须被置于包路径（packagepath）上。包路径可以通过package.path或者环境变量来设定。一般来说，当前工作路径总是在包路径中。

--]]
print("----------------包的使用")

pack = require("mypack")	--导入包

print(ver or "No ver defined!")
print(pack.ver)

print(PFN_FunInMyPack or "No PFN_FunInMyPack defined!")
pack.PFN_FunInMyPack()

print(PFN_FunFromMyPack or "No PFN_FunFromMyPack defined!")
PFN_FunFromMyPack()


--[[
	高阶话题： 迭代

	1.定义
	迭代是for语句的一种特殊形式，可以通过for语句驱动迭代函数对一个给定集合进行遍历。正式、完备的语法说明较复杂，请参考Lua手册。

	2.实现
	如前面代码所示：enum函数返回一个匿名的迭代函数，for语句每次调用该迭代函数都得到一个值（通过element变量引用），若该值为nil，则for循
	环结束。

	3.说明
	用范型for循环，也可以对一个给定的集合进行遍历；
	这两种方式都适合遍历一个不清楚集合长度的遍历
	如
	days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

	for k,v in pairs(days) do
		print(v)
	end

--]]

print("-----------------迭代（for循环迭代器）")
function PFN_Enum(array)
	local index = 1
	return function()
		local ret = array[index]
		index = index + 1
		return ret
	end
end

function PFN_Foreach(array, action)
	for element in PFN_Enum(array) do
		action(element)
	end
end

PFN_Foreach({1, 2, 3}, print)

--[[
	协作线程coroutine

	1.创建协作线程
	通过coroutine.create可以创建一个协作线程，该函数接收一个函数类型的参数作为线程的执行体，返回一个线程对象。
	也可以通过coroutine.wrap来创建一个协作线程，该函数接收一个函数类型的参数作为线程的执行体，只是它的返回值是一个函数。

	2.启动线程
	通过coroutine.resume可以启动一个线程或者继续一个挂起的线程。该函数接收一个线程对象以及其他需要传递给该线程的参数。线程可以通过线程函
	数的参数或者coroutine.yield调用的返回值来获取这些参数。当线程初次执行时，resume传递的参数通过线程函数的参数传递给线程，线程从线程函
	数开始执行；当线程由挂起转为执行时，resume传递的参数以yield调用返回值的形式传递给线程，线程从yield调用后继续执行。

	3.线程放弃调度
	线程调用coroutine.yield暂停自己的执行，并把执行权返回给启动/继续它
	的线程；线程还可利用yield返回一些值给后者，这些值以resume调用的返
	回值的形式返回。

	注意：
	协作线程，简称协程。协程与VC中的线程一样，只是它是同一时刻只有一个在运行，是串行的，不是并行的。
	多线程中宏观意义上来说 ，是多个线程同时运行。
	所以这样的话，协程并不能体现出线程的并发优势。

--]]
print("-----------协作线程的创建和启动")

function PFN_Procducer()	--创建线程和线程处理函数
	return coroutine.create(
		function(salt)
			local t = {1, 2, 3}
			for i = 1,#t do
				salt = coroutine.yield(t[i] + salt)	--显示的调用yield函数时，线程会被挂起，且通过yield函数将其一些参数作为结果传递给resume
			end
		end
	)
end

function PFN_Consumer(prod)	--启动线程
	local salt = 10
	while true do
		local running, product = coroutine.resume(prod, salt)
		--resume函数是启动一个线程或继续执行一个被挂起的线程。当第一次resume线程时，其一些参数是作为线程处理函数的参数被传递的，若线程已经创建了，则参数是被作为来自yield函数的结果传递过来的
		--返回值：如果协作线程执行没有错误，resume则返回true，和一些参数被传递到yield或一些值从线程处理函数中返回;如果有错误resume返回false和错误信息。

		salt = salt * salt
		if running then
			print(product or "END!")
		else
			break
		end

	end
end

PFN_Consumer(PFN_Procducer())



--协作线程02
print("-----------------协作线程02\n利用协作线程可以方便地设计出类似Unix管道或者Stream IO的结构-----------")

function instream()
	return coroutine.wrap(
		function()
			while true do
				local line = io.read("*l")
				if line then
					coroutine.yield(line)
				else
					break
				end
			end
		end)
end

function filter(ins)
	return coroutine.wrap(
		function()
			while true do
				local line = ins()
				if line then
					line = "**"..line.."**"
					coroutine.yield(line)
				else
					break
				end
			end
		end)
end

function outstream(ins)
	while true do
		local line = ins()
		if line then
			print(line)
		else
			break
		end
	end
end

outstream(filter(instream()))


--协作线程03
--[[
	另一种迭代方式
	协作线程可以作为for循环迭代器的另一种实现方式。虽然对于简单的数组遍历来说，没有必要这么做，但是考虑一下，如果需要遍历的数据集合是一
	个复杂数据结构，比如一棵树，那么协作线程在简化实现上就大有用武之地
	了。
--]]
print("--------------协作线程03\n协作线程可以作为for循环迭代器的另一种实现方式")

function PFN_Enum(array)
	return coroutine.wrap(
		function()
			local len = #array
			for i = 1, len do
				coroutine.yield(array[i])
			end

		end)
end

function PFN_Foreach(array, action)
	for element in PFN_Enum(array) do
		action(element)
	end
end

PFN_Foreach({1, 2, 3}, print)









