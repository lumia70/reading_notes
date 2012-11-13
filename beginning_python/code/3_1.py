#XXG 2012-11-13

#使用给定的宽度打印格式化后的价格列表

width = input("please enter width:") #使用raw_input更安全

price_width = 10
item_width = width - price_width

header_format = '%-*s%*s'
format        = '%-*s%*.2f'

print '=' * width

print header_format % (item_width,'Item',price_width,'Pice')

print '-' * width

print format % (item_width,'Apples',price_width,0.4)
print format % (item_width,'Pears',price_width,0.5)


print '=' * width
