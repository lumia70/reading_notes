--���캯����ʼ�����ʽ

--[[���캯������ʹ���κα��ʽ��ʼ��,Ҳ����ֱ�ӳ�ʼ�����顣
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

days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}

print(days[1+2])
print(days)  --��ӡ���Ǳ�ĵ�ַ

days={[0]="Sunday",["Mon"]="Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"}

print(days[0],days["Mon"])


days={"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday";["Sun"]="������","����һ"}
print(days["Sun"],days.Sun)   --һ�����������
print(days[8])                --�������һ


days={Sun="Sunday",Mon="Monday",["Tue"]="Tuesday","Wednesday","Thursday","Friday","Saturday"}
print(days["Sun"],days.Sun,days["Tue"],days.Tue)
