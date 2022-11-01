import psycopg2

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

def max_len_x(x):
  max_len = 0
  for i in range(len(x)):
    if len(x[i]) > max_len:
      max_len = len(x[i])
  return max_len

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
  print ("Database opened successfully");

  print("Query 1")
  cur1 = conn.cursor()
  cur1.execute(query_1)
  print("order.id  amount")
  for row in cur1:
    print(row)

  print("Query 2")
  cur2 = conn.cursor()
  cur2.execute(query_2)
  pizzaId = []
  sum1 = []

  for row in cur2:
    pizzaId.append(row[0])
    sum1.append(row[1])

  print("SUM  pizza.id")
  for i in range(len(pizzaId)):
    print(pizzaId[i], sum1[i])

  print("Query 3")
  cur3 = conn.cursor()
  cur3.execute(query_3)
  orderId = []
  totalCost = []

  for row in cur3:
    orderId.append(row[0])
    totalCost.append(row[1])

  print("order.id  price")
  for i in range(len(orderId)):
    print(f"{orderId[i]}  {totalCost[i]}")