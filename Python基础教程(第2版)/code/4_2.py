# XXG 2012-11-14

#使用get的简单数据库

people = {
    'Alice':{
        'phone':'123',
        'addr':'abc'
        }
    }

labels = {
    'phone': u'电话号码',
    'addr': u'地址'
    }

name = raw_input("请输入姓名：")

print  u"%s的%s是%s\n   %s 是 %s " % (name,labels.get('phone'),people.get(name).get('phone'),labels['addr'],people[name].get('addr'))

