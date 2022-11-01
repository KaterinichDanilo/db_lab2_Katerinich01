import psycopg2
import matplotlib.pyplot as plt


username = 'postgres'
password = '0000'
database = 'Lab_DB'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT "order".id, SUM(order_item.quantity)
FROM "order"
LEFT JOIN order_item ON order_item.order_id = "order".id
GROUP BY "order".id;
'''
query_2 = '''
SELECT TRIM(pizza.id), SUM(order_item.quantity)
FROM pizza
LEFT JOIN order_item ON order_item.pizza_id = pizza.id
GROUP BY pizza.id;
'''
query_3 = '''
SELECT "order".id, SUM(order_item.total_price) 
FROM "order"
LEFT JOIN order_item ON order_item.order_id = "order".id
GROUP BY "order".id
ORDER BY "order".id
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur1 = conn.cursor()
    cur1.execute(query_1)
    orderId = []
    amount = []

    for row in cur1:
        orderId.append(row[0])
        amount.append(row[1])

    plt.bar(orderId, amount)
    plt.title('Кількість піц в кожному замовленні', size=10)
    plt.ylabel('Піци', size=10)
    plt.show()


    cur2 = conn.cursor()
    cur2.execute(query_2)
    pizzaId = []
    sum = []

    for row in cur2:
        pizzaId.append(row[0])
        sum.append(row[1])

    x, y = plt.subplots()
    plt.title('Кількість замовлень кожної піци', size=20)
    y.pie(sum, labels=pizzaId, autopct='%1.1f%%')
    plt.show()


    cur3 = conn.cursor()
    cur3.execute(query_3)
    orderId = []
    price = []

    for row in cur3:
        orderId.append(row[0])
        price.append(row[1])

    plt.plot(orderId, price)
    plt.plot(price, marker='o')
    plt.title('Вартість кожного замовлення', size=20)
    plt.ylabel('Загальна вартіть', size=15)
    plt.show()