# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

try:
    # Establishing a connection to the MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        user="your_username",
        password="your_password"
    )
    
    cursor = connection.cursor()

    # Creating the database
    cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
    print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print(err)
finally:
    # Closing the connection
    if connection.is_connected():
        cursor.close()
        connection.close()
