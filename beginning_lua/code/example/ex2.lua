--�߼������
--�߼��������Ϊfalse��nil�Ǽ٣�false��������Ϊ�棬0Ҳ��true.

--[[ and or not  ��·��ֵ
	a and b  a is false return a else return b
	a or  b  a is true  return a else return b

	and: ˭�ȼ� ����˭  ������ ���غ��� --���� ����nil
	or:  ˭���� ����˭  ������ ����ǰ�� --���� ����ǰ��

	x = x or v --�ж�֮�󸳳�ֵ
	in c:   a ? b: c
	in lua: (a and b) or c
]]

function add(x,y)
 local x= x or 0
 local y= y or 0

  return x+y
end


print(add(1,2))


