import mysql.connector

def fetch_data(table_name):
    try:
        # Connect to the MySQL database
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="airlines_performance"
        )

        # Create a cursor object to execute SQL queries
        cursor = connection.cursor()

        # Execute the SQL query to fetch data from the specified table
        query = f"SELECT * FROM {table_name}"
        cursor.execute(query)

        # Fetch all rows from the result set
        rows = cursor.fetchall()

        # Close the cursor and database connection
        cursor.close()
        connection.close()

        return rows

    except mysql.connector.Error as error:
        print("Error fetching data from MySQL database:", error)
        return None

def write_to_file(data, filename):
    try:
        # Open the text file in write mode
        with open(filename, 'w') as file:
            # Write data to the file
            for row in data:
                file.write(str(row) + '\n')
        
        print("Data has been written to the file successfully.")

    except Exception as e:
        print("Error writing data to the file:", e)

def display_data(data):
    # Display the fetched data on the screen
    for row in data:
        print(row)

def main():
    # Specify the table name from which data needs to be fetched
    table_name = "airline"

    # Fetch data from the specified table
    data = fetch_data(table_name)

    if data:
        # Specify the filename to which data will be written
        filename = f"{table_name}_data.txt"

        # Write data to a text file
        write_to_file(data, filename)

        # Display data on the screen
        display_data(data)

if __name__ == "__main__":
    main()
