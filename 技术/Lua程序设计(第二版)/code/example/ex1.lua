--使用表传参

w={
   x=0,y=0,
   width=30,height=200,
   title="lua",background="blue",
   border=true
  }

function test(value1,value2)
   value1 = value1 or 0
   value2=value2 or "while"
  return value1,value2
end

function window(option)
	if type(option.title)      ~= "string" then
	   error("no title")
	elseif type(option.width)  ~= "number" then
	   error("no width")
	elseif type(option.border) ~= "boolean" then
	   error("no border")
	end
end

print(test())
print(window(w))

