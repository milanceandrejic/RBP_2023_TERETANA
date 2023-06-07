# #!/usr/bin/python3
# import pymysql
# # Open database connection
# db = pymysql.connect(host="localhost", user='root', passwd='', port=3306, db="teretana_db")
# # prepare a cursor object using cursor() method
# cursor = db.cursor()
# # execute SQL query using execute() method.
# cursor.execute("SELECT VERSION()")
# # Fetch a single row using fetchone() method.
# data = cursor.fetchone()
# print ("Database version : %s " % data)
# # disconnect from server
# db.close()

import mysql.connector
import hashlib

# Establish a connection
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="teretana_rbp"
)

# Check if the connection is successful
if conn.is_connected():
    print("Connected to MySQL database!")

pwd = "admin"
pwd = hashlib.sha256(pwd.encode()).hexdigest()
print((pwd))
# Execute a query

data = ('Administrator','Administrator','Administrator@Administrator.com','admin', pwd)

cursor = conn.cursor()
cursor.execute("insert into korisnik(ime, prezime, mail, username, password) values(%s,%s,%s,%s,%s)", data)
cursor.close()
conn.commit()
cursor = conn.cursor()
cursor.execute('Select * from korisnik')

a = input('Unesi User')
b = input('Unesi pw')

b = hashlib.sha256(b.encode()).hexdigest()

# Fetch all the results
results = cursor.fetchall()
#conn.commit()

# Display the results
for row in results:
    if(row[4]==a and row[5]==b):
        print('Uspesno logovanje!', row)

# Close the cursor and connection
cursor.close()
conn.close()
