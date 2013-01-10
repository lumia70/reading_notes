--逻辑运算符
--逻辑运算符认为false和nil是假（false），其他为真，0也是true.

--[[ and or not  短路求值
	a and b  a is false return a else return b
	a or  b  a is true  return a else return b

	and: 谁先假 返回谁  都不假 返回后者 --都假 返回nil
	or:  谁先真 返回谁  都不真 返回前者 --都真 返回前者

	x = x or v --判断之后赋初值
	in c:   a ? b: c
	in lua: (a and b) or c
]]

function add(x,y)
 local x= x or 0
 local y= y or 0

  return x+y
end


print(add(1,2))


