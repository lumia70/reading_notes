# XXG 2012-11-14

#简单数据库
people ={
    'Alice':{
        'phone':'123',
        'addr':'abc'

        },
    'Jimmy':{
        'phone':'456',
        'addr':'def'
        }
    }

#针对电话号码和地址使用描述标签
labels={
    'phone':u'电话号码',
    'addr':u'地址'
    }

info    = u"请输入你要查询的分类 电话号码(p) 地址(a)"
name    = raw_input(u"请输入姓名：")
request = raw_input(info)

if request=='p': key='phone'
if request=='a': key='addr'

if name in people:
    print u"%s %s 是 %s" % (name,labels[key],people[name][key])

#？全部输出
