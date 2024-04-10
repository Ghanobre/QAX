import psycopg2

db_con = """
        host='localhost'
        dbname='smartbit'
        user='postgres'
        password='QAx@123'
        """
                                                              
def execut_query(query):
    conn = psycopg2.connect(db_con)
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()


def insert_account(account):
    query = f"INSERT into accounts (name,email,cpf) values ('{account["name"]}','{account["email"]}','{account["cpf"]}');"
    execut_query(query)
    print(query)

def delete_acount_by_email(email):

    query = f"DELETE FROM accounts WHERE email ='{email}'"
    execut_query(query)
    print(query)