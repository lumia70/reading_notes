--[[ �����������ܶ��ʱ�������ñ�Ľṹ��Ϊʵ�Σ��ǺܺõĴ��η�ʽ
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
	�߼������
	and or not

	�߼��������Ϊfalse��nil�Ǽ٣�false��������Ϊ�棬0Ҳ��true.
	and��or������������true��false�����Ǻ�����������������ء�
	a and b -- ���aΪfalse���򷵻�a�����򷵻�b
	a or b 	-- ���aΪtrue���򷵻�a�����򷵻�b


	һ����ʵ�õļ��ɣ����xΪfalse����nil���x����ʼֵv
	x = x or v
	�ȼ���
	if not x then
	x = v
	end

	and�����ȼ���or�ߡ�

	C�����е���Ԫ�����
	a ? b : c
	��Lua�п�������ʵ�֣�
	(a and b) or c

--]]



--[[
	���캯������ʹ���κα��ʽ��ʼ��,Ҳ����ֱ�ӳ�ʼ�����顣
	��Lua����һ��Ԫ�س�ʼ��days[1]����һ��Ԫ������Ϊ1��

	������ʼ��һ������Ϊ��¼����ʹ�ÿ���������
	a = {x=0, y=0}  �൱��  a = {}; a.x=0; a.y=0

	�ڹ��캯��������","�ǿ�ѡ�ģ����Է����Ժ����չ��
	a = {[1]="red", [2]="green", [3]="blue",}

	�ڹ��캯������ָ������ţ�","�������÷ֺţ�";"�������ͨ������ʹ�÷ֺ������ָͬ���͵ı�Ԫ�ء�
	{x=10, y=45; "one", "two", "three"}

	��������Ҫ�����±��0��ʼ��
	days = {[0]="Sunday", "Monday", "Tuesday", "Wednesday",
	"Thursday", "Friday", "Saturday"}
	ע�⣺���Ƽ������±��0��ʼ������ܶ��׼�ⲻ��ʹ�á�
--]]

print("------------�ñ�������")
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[3])	--���:Tuesday

--[[
	ÿ�ε��ù��캯����Lua���ᴴ��һ���µ�table������ʹ��table����һ��list

	�����ú��ַ�ʽ����table�����Ƕ������������ӻ���ɾ���κ����͵���(�����е����ݿ����ǰ��ֻ��������е�һ��)�����캯������Ӱ���ĳ�ʼ��?
	Ҳ����˵table�еĳ�Ա������ function������table����������ͣ����Բο������ʵ�� ��һ�ּ򵥵Ķ���ʵ�ַ�ʽ����
--]]

print("-----------ʹ��table����һ������list")
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
	 ����Ƕ�׹��캯������ʾ���ӵ����ݽṹ.
--]]
--��ͬһ�����캯���п��Ի���б����record�����г�ʼ��������
polyline = {color="blue", thickness=2, npoints=4,
	{x=0, y=0},
	{x=-10, y=0},
	{x=-10, y=1},
	{x=0, y=1}
	}

print(polyline[2].x)	 --����� -10

--[[ ѭ�����--]]
--��ֵforѭ����ӡһ����
print("-----------------��ֵforѭ��")

for i = 1, 10 do
	print(i)
end

--[[
	����forѭ��,print all keys of table 't'
--]]
print("----------------����forѭ��")
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

--�ֱ���ٱ�t��t2
for k,v in pairs(t) do
	print(k,"==>",v)
end
print("-------------------------")
for k,v in pairs(t2) do
	print(k, "==>", v)
end


--[[
	whileѭ��
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



--repeat-until ѭ�����
print("repeat ... until ѭ�����")
--string.format("%q", 'repeat ... untilѭ�����\n new line!') ���԰�ָ����ʽ����ַ���,��C��Printf��ʽ���ƣ���pint����ָ����ʽ���
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


--function������д�͵���
print("----------------function��������---------")
function foo(a, b, c)
	local sum = a + b
	return sum, c
end

r1, r2 = foo(1, '123', 'hello world')
r3,r4 = 10 .."ping", "xiexie"
print(r1, r2, r3, r4)

--[[
	LuaҲ�ṩ���������ʽ���ú������﷨������o:foo(x)��o.foo(o, x)�ǵȼ۵�.

	����ʵ����˵
	1.���󹤳�ģʽ
	��ǰ������create����

	2.�ñ�����ʾ����
	�Ѷ�������ݺͷ���������һ�ű��ڣ���Ȼû������˽�г�Ա�������ڼ�
	�ű���˵��ȫ���Խ��ܡ�

	3.��Ա�����Ķ���
	function obj:method(a1, a2, ...) �� end �ȼ���
	function obj.method(self, a1, a2, ...) �� end �ȼ���
	obj.method = function (self, a1, a2, ...) �� end

	4.��Ա�����ĵ���
	obj:method(a1, a2, ��) �ȼ���
	obj.method(obj, a1, a2, ...)
--]]
--һ�ּ򵥵Ķ���ʵ�ַ�ʽ

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

print("----------һ�ּ򵥵Ķ���ʵ�ַ�ʽ")

C_O1 = PFN_Create("Sam", 001)

print("C_O1'S name:", C_O1:GetName(), "C_O1's id:", C_O1:GetId())

C_O1.SetName(C_O1, "SUerge Ping")
C_O1.SetId(C_O1, 100)
print("C_O1's name:", C_O1.GetName(C_O1), "C_O1's id:", C_O1.GetId(C_O1))


--[[
�򵥼̳�

�ŵ㣺
	�򵥡�ֱ��
ȱ�㣺
	��ͳ��������̬
--]]
print("------------------�򵥼̳�")

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

C_OX = PFN_CreateFootballRobot("Surge Ping", 248, "�Һ���")

C_OX.SetName(C_OX, "luonaerduo")
C_OX.SetPosition(C_OX, "�Һ���")

print("C_OX's name,id,position:", C_OX.GetName(C_OX), C_OX.GetId(C_OX), C_OX.GetPostion(C_OX))

--[[
	�����հ�

	1.һ��������ʹ�õĶ��������ĺ�����֮��ľֲ�������external local variable����Ϊ���������upvalue��
	��ǰ��Ĵ����У�����countDownʹ�õĶ����ں���createCountdownTimer�еľֲ�����ms����countDown��upvalue����ms��createCountdownTimer��
	��ֻ��һ���ֲ�����������upvalue��
	Upvalue��Lua��ͬ��C/C++���������ԣ���Ҫ��ϴ�����ϸ��ᡣ

	2.�����հ�
	һ������������ʹ�õ�����upvalue������һ�������հ���

	3.Lua�����հ���C�����ıȽ�
	Lua�����հ�ʹ�������б������Լ���״̬�������������������˵�����������̬�ֲ�������C��������ȡ��������������Ĳ�ͬ����Lua��˵������
	��һ�ֻ����������͡�������һ�֣���ִ�У����󣬿������Լ���״̬�����ǶԴ���̬�ֲ�������C������˵����������C��һ���������ͣ����������
	ʲô����ʵ������ֻ��һ����̬��ַ�ķ������ơ�

	4.˵����
		�ֲ���������ȫ�ֺ�����
		�����ֲ����������ַ�ʽ��
		1��. ��ʽһ
			local f = function (...)
			...
			end
			local g = function (...)
			...
			f() -- external local `f' is visible here
			...
			end
		2��. ��ʽ��
			local function f (...)
			...
			end

		��һ����Ҫע������������ݹ�ֲ������ķ�ʽ��

		local fact = function (n)
			if n == 0 then
			return 1
			else
			return n*fact(n-1) --�������
			end
		end


		local fact	--�������ַ�ʽ����Lua����ʱ����fact(n-1)����֪�����Ǿֲ�����fact��Lua��ȥ��
									���Ƿ���������ȫ�ֺ���fact��Ϊ�˽������������Ǳ����ڶ��庯����ǰ��������

		fact = function (n)
			if n == 0 then
			return 1
			else
			return n*fact(n-1)
			end
		end
		������fact�ڲ�fact(n-1)������һ���ֲ��������ã�����ʱfact�Ϳ��Ի�ȡ��ȷ��ֵ�ˡ�
--]]

function PFN_CreateCountdownTimer(seconds)
	local ms = seconds * 1000	--�ֲ�����ms������PFN_CountDown������upvalue
	local function PFN_CountDown()	--�ֲ�����
		ms = ms - 1
		return ms
	end

	return PFN_CountDown
end

print("------------�����հ�")
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
	���ڶ����ʵ�ַ�ʽ

	1.ʵ�ַ�ʽ
	����Ҫ���صĳ�Ա����һ�ű���Ѹñ���Ϊ��Ա������upvalue��

	2.������
	���ڶ����ʵ�ֲ��漰�̳м���̬������һ���棬�ű�����Ƿ���Ҫ�̳к�
	��̬Ҫ�����������
--]]
function PFN_Create(name, id)
	local data = {m_name = name, m_id = id}	--����Ҫ���ص����ݳ�Աm_name,m_id����data����
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
	Ԫ��

	Lua �е�ÿ��ֵ��������һ�� metatable����� metatable ����һ��ԭʼ��Lua table ������������ԭʼֵ���ض������µ���Ϊ�������ͨ���� metatable �е��ض�����һЩֵ���ı�ӵ����� metatable ��ֵ��ָ������֮��Ϊ��������˵����һ�������ֵ�ֵ���ӷ�������ʱ�� Lua �������� metatable �� "__add" ���е��Ƿ���һ���������������ôһ�������Ļ���Lua �������������ִ��һ�μӷ���

	����ͨ�� getmetatable ��������ѯ���κ�һ��ֵ�� metatable��
	�����ͨ�� setmetatable �������滻�� table �� metatable

	ÿ�� table �� userdata������ӵ�ж����� metatable
	����Ȼ��� table ��userdata���Թ���һ����ͬ�ı������ǵ�metatable���������������͵�ֵ��ÿ�����Ͷ��ֱ���Ψһ��һ�� metatable��
	��ˣ����е�����һ��ֻ��һ�� metatable �����е��ַ���Ҳ�ǣ��ȵȡ�

	Ԫ��ļ�����Ϊ �¼�,���е�ֵ��������֮���Ǻ�������ΪԪ������

	һ�� metatable ���Կ���һ����������ѧ����������Ƚϲ��������Ӳ�����ȡ���Ȳ�����ȡ�±����ʱ����Ϊ��
    metatable ���Կ��ƵĲ������������г�����ÿ������������Ӧ���������֡�
	ÿ�������ļ��������ò������ּ��������»��� '__' ǰ׺���ַ�����������˵��"add" �����ļ��������ַ��� "__add"����Щ������������һ�� Lua �������������������ִ�и�Ϊǡ����

	1.����
	Ԫ����ֻ��һ����ͨ�ı�ͨ���ض��ķ���������setmetatable�����õ�
	ĳ�������ϣ�����Ӱ������������Ϊ��һ����������Щ��Ϊ�ܵ�Ԫ��Ӱ��
	�Լ���Щ��Ϊ���պ��ַ�ʽ�ܵ�Ӱ������Lua����Լ���ġ�������ǰ��Ĵ�
	������������ļӷ����㣬���û��Ԫ��ĸ�Ԥ������һ�ִ��󣻵���
	Lua�涨��Ԫ����ԡ����ء�����ļӷ��������������Ѷ����˼ӷ�����
	��Ԫ�����õ����������ϣ����ǾͿ������ӷ��ˡ�Ԫ����Lua��ؼ��ĸ���
	֮һ������Ҳ�ܷḻ����ο�Lua�ĵ��˽����顣

	2.Ԫ����C++���ıȽ�
	����ѱ��������Ԫ����ǿ��Ըı������Ϊ�ġ�Ԫ��������ĳ�̶ֳ�
	�ϣ�Ԫ�������C++�������һ��ȡ������߻�����Ȼ��ͬ�ģ�Ԫ����Զ�
	̬�ĸı䣬C++����Ǿ�̬����ģ�Ԫ�����Ӱ����Լ��������͵Ķ�
	�󣩵ĺܶ෽�����Ϊ�������Ҫ��Ϊ�˶�λ������鷽��������ٴ���һ
	���RTTI��

	__concat���Ӳ�����__add�ӷ������������㷨��������)��ȡ�±���������ڷ���table[key]��__index,
	�Ƚϲ����������__eq,С��__lt��С�ڵ���__le��,ȡ���Ȳ���__len

--]]
print("---------------Ԫ��01")

t = {}
m = {a = "and", b = "Li Lei", c = "Han Meimei"}

setmetatable(t, {__index = m}) --��{__index = m}��Ϊ��t��Ԫ��

for k, v in pairs(t) do --��ٱ�
	print(k, v)	--��ʵû����
end
print("--------")
print(t.b, t.a, t.c)





print("----------------Ԫ��02")

function add(t1, t2)
	assert(#t1 == #t2)	--�����#ȡ����

	local length = #t1
	for	i = 1, length do
		t1[i] = t1[i] + t2[i]
	end

	return t1
end

t1 = setmetatable({1, 2, 3}, {__add = add})	--setmetatable���ر����õı�
t2 = setmetatable({10, 20, 30}, {__add = add})

t1 = t1 + t2
for i = 1, #t1 do
	print(t1[i])
end


--[[
	����ԭ�͵ļ̳�

	1.prototypeģʽ
	һ���������һ����ͨ�Ķ���ͬʱҲ������Ϊ�������������ԭ�͵Ķ��󣨼������class object������̬�ĸı�ԭ�Ͷ�������ԾͿ��Զ�̬��Ӱ
	�����л��ڴ�ԭ�͵Ķ������⣬����һ��ԭ�ͱ����������Ķ�����������κ��������ԭ�Ͷ���ķ��������Զ���Ӱ��ԭ�Ͷ���ͬʱ������ԭ�ͱ�
	���������Ķ��󻹿�����Ϊԭ����������������

--]]

print("-------------------����ԭ�͵ļ̳�")

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
	��������
	1.����
	�����������Ǻ�����ִ��ʱ������ȫ�ֱ����ļ��ϣ���һ���������ء�

	2.˵��
	ÿ���������������Լ��Ļ���������ͨ��setfenv����ʾ��ָ��һ�������Ļ������������ʾ��ָ���������Ļ���ȱʡΪ����ú����ĺ����Ļ�����
	����Ϊ thread ��function ���Լ� userdata �Ķ��󣬳��� metatableԪ���⣬������������һ����֮�����ı��������ǵĻ�����һ������ metatable һ��������Ҳ��һ������� table �����������Թ���ͬһ��������

	�������߳��ϵĻ���������ȫ�ֻ�����ȫ�ֻ��������������е��߳��Լ��̴߳����ķ�Ƕ�׺�����ͨ�� loadfile �� loadstring ���� load ����ȱʡ������
	������ C �����ϵĻ�������ֱ�ӱ� C ������ʣ��μ� ��3.3�������ǻ���Ϊ��� C �����д���������������ȱʡ������
	������ Lua �����ϵĻ��������ӹ��ں����ڶ�ȫ�ֱ��������з��ʡ�����Ҳ����Ϊ��������ڴ���������������ȱʡ������

	����ͨ������ setfenv ���ı�һ�� Lua�����������������е��̵߳Ļ���������ٿ���������userdata��C�����������̣߳��Ļ����Ļ����ͱ���ʹ�� C API ��


	��ǰ��Ĵ����У�����foo��ȱʡ������û�ж������g����˵�һ��ִ��foo�� gΪnil�����ʽg or "No g defined!"��ֵ����"No g defined!"��
	���foo��ָ����һ������ { g = 100, print = print }��������������ˣ�ȫ�֣�����g���Լ���ӡ����print����˵ڶ���ִ��foo��g��ֵ����
	100�������ڶ��庯��foo�ĺ����Ļ����£�g��Ȼ��һ��δ����ı�����

	3.Ӧ��
	�������������úܶ࣬����������ʵ�ֺ���ִ�еġ���ȫɳ�䡱������Lua�İ���ʵ��Ҳ��������

--]]
print("---------------��������")

function foo()
	print(g or "No g defined!")
end

foo()

setfenv(foo, {g = 100, print = print})	--����foo�Ļ���Ϊ��{g=100,...}
foo()
print(g or "No g defined!")



--[[
	��

	1.ʹ�÷�ʽ
	       һ����require����������һ������Ҫ����İ����뱻���ڰ�·����packagepath���ϡ���·������ͨ��package.path���߻����������趨��һ����˵����ǰ����·�������ڰ�·���С�

--]]
print("----------------����ʹ��")

pack = require("mypack")	--�����

print(ver or "No ver defined!")
print(pack.ver)

print(PFN_FunInMyPack or "No PFN_FunInMyPack defined!")
pack.PFN_FunInMyPack()

print(PFN_FunFromMyPack or "No PFN_FunFromMyPack defined!")
PFN_FunFromMyPack()


--[[
	�߽׻��⣺ ����

	1.����
	������for����һ��������ʽ������ͨ��for�����������������һ���������Ͻ��б�������ʽ���걸���﷨˵���ϸ��ӣ���ο�Lua�ֲᡣ

	2.ʵ��
	��ǰ�������ʾ��enum��������һ�������ĵ���������for���ÿ�ε��øõ����������õ�һ��ֵ��ͨ��element�������ã�������ֵΪnil����forѭ
	��������

	3.˵��
	�÷���forѭ����Ҳ���Զ�һ�������ļ��Ͻ��б�����
	�����ַ�ʽ���ʺϱ���һ����������ϳ��ȵı���
	��
	days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

	for k,v in pairs(days) do
		print(v)
	end

--]]

print("-----------------������forѭ����������")
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
	Э���߳�coroutine

	1.����Э���߳�
	ͨ��coroutine.create���Դ���һ��Э���̣߳��ú�������һ���������͵Ĳ�����Ϊ�̵߳�ִ���壬����һ���̶߳���
	Ҳ����ͨ��coroutine.wrap������һ��Э���̣߳��ú�������һ���������͵Ĳ�����Ϊ�̵߳�ִ���壬ֻ�����ķ���ֵ��һ��������

	2.�����߳�
	ͨ��coroutine.resume��������һ���̻߳��߼���һ��������̡߳��ú�������һ���̶߳����Լ�������Ҫ���ݸ����̵߳Ĳ������߳̿���ͨ���̺߳�
	���Ĳ�������coroutine.yield���õķ���ֵ����ȡ��Щ���������̳߳���ִ��ʱ��resume���ݵĲ���ͨ���̺߳����Ĳ������ݸ��̣߳��̴߳��̺߳�
	����ʼִ�У����߳��ɹ���תΪִ��ʱ��resume���ݵĲ�����yield���÷���ֵ����ʽ���ݸ��̣߳��̴߳�yield���ú����ִ�С�

	3.�̷߳�������
	�̵߳���coroutine.yield��ͣ�Լ���ִ�У�����ִ��Ȩ���ظ�����/������
	���̣߳��̻߳�������yield����һЩֵ�����ߣ���Щֵ��resume���õķ�
	��ֵ����ʽ���ء�

	ע�⣺
	Э���̣߳����Э�̡�Э����VC�е��߳�һ����ֻ������ͬһʱ��ֻ��һ�������У��Ǵ��еģ����ǲ��еġ�
	���߳��к����������˵ ���Ƕ���߳�ͬʱ���С�
	���������Ļ���Э�̲��������ֳ��̵߳Ĳ������ơ�

--]]
print("-----------Э���̵߳Ĵ���������")

function PFN_Procducer()	--�����̺߳��̴߳�����
	return coroutine.create(
		function(salt)
			local t = {1, 2, 3}
			for i = 1,#t do
				salt = coroutine.yield(t[i] + salt)	--��ʾ�ĵ���yield����ʱ���̻߳ᱻ������ͨ��yield��������һЩ������Ϊ������ݸ�resume
			end
		end
	)
end

function PFN_Consumer(prod)	--�����߳�
	local salt = 10
	while true do
		local running, product = coroutine.resume(prod, salt)
		--resume����������һ���̻߳����ִ��һ����������̡߳�����һ��resume�߳�ʱ����һЩ��������Ϊ�̴߳������Ĳ��������ݵģ����߳��Ѿ������ˣ�������Ǳ���Ϊ����yield�����Ľ�����ݹ�����
		--����ֵ�����Э���߳�ִ��û�д���resume�򷵻�true����һЩ���������ݵ�yield��һЩֵ���̴߳������з���;����д���resume����false�ʹ�����Ϣ��

		salt = salt * salt
		if running then
			print(product or "END!")
		else
			break
		end

	end
end

PFN_Consumer(PFN_Procducer())



--Э���߳�02
print("-----------------Э���߳�02\n����Э���߳̿��Է������Ƴ�����Unix�ܵ�����Stream IO�Ľṹ-----------")

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


--Э���߳�03
--[[
	��һ�ֵ�����ʽ
	Э���߳̿�����Ϊforѭ������������һ��ʵ�ַ�ʽ����Ȼ���ڼ򵥵����������˵��û�б�Ҫ��ô�������ǿ���һ�£������Ҫ���������ݼ�����һ
	���������ݽṹ������һ��������ôЭ���߳��ڼ�ʵ���Ͼʹ�������֮��
	�ˡ�
--]]
print("--------------Э���߳�03\nЭ���߳̿�����Ϊforѭ������������һ��ʵ�ַ�ʽ")

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









