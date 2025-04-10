#netflix_data_insertion

import mysql.connector
import pandas as pd

# Step 1: Read the Netflix CSV file

csv_file_path = 'use your path'
df = pd.read_csv(csv_file_path)

try:
        # Step 2: Connect to MySQL database
        connection = mysql.connector.connect(
                host = 'localhost',
                user = 'your username', # replace with your username
                password = 'your password', # replace with your MySQL password
                database = 'your db name' # replace your database name
        )
        
        if connection.is_connected():
            print("Successfully connected to MySQL Server version:", connection.get_server_info())

            cursor = connection.cursor()
        
        # Optional: Print the database and user you are connected to
        cursor.execute("SELECT DATABASE(), USER();")
        db_info = cursor.fetchone()
        print(f"Connected to Database: {db_info[0]}, as User: {db_info[1]}") 
        
        
        # Step 3: Perpare the INSERT query
        insert_query = """
        INSERT INTO netflix (show_id, title, director, cast, country, date_added, release_year, rating, duration, listed_in, descrip)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """

        # Step 4: Prepare all values
        def safe_value(val):
              if pd.isna(val):
                    return None
              elif isinstance(val, list):
                    return ', '.join(map(str, val))
              else:
                    return str(val)

        values = []
        for _, row in df.iterrows():
              value = (
                    safe_value(row['show_id']),
                    safe_value(row['title']),
                    safe_value(row['director']),
                    safe_value(row['cast']),
                    safe_value(row['country']),
                    safe_value(row['date_added']),
                    int(row['release_year']) if not pd.isna(row['release_year']) else None,
                    safe_value(row['rating']),
                    safe_value(row['duration']),
                    safe_value(row['listed_in']),
                    safe_value(row['description'])
                    )

              values.append(value)

        # Step 5: Insert all records at once
        cursor.executemany(insert_query, values)
        connection.commit()

        print(f"Successfully inserted {cursor.rowcount} records into 'netflix' table!") # 8807 records
except mysql.connector.Error as e:
      print("Error while connecting to MySQL:", e)

finally:
      # Step 6: Clean up
      if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection closed")


