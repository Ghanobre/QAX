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

def insert_hard_code():
        
        query=f"""
        DELETE FROM accounts
        WHERE email = 'jr56@example.net';

	BEGIN;

        DELETE FROM accounts
        WHERE email = 'jr56@example.net';

        WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES ('Joana Ramos', 'jr56@example.net', '85693142051')
        RETURNING id
    )

        INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
        SELECT id, 1,'4242', 99.99, true
        FROM new_account;

        COMMIT;
        """
        execut_query(query)
        print (query) 

def insert_membership(data):
    account = data["account"]
    plan =  data["plan"]
    credit_card = data["credit_card"]["number"][-4]

    query=f"""
        BEGIN;

        DELETE FROM accounts
        WHERE email = '{account["email"]}';
        
        WITH new_account AS (
        INSERT INTO accounts (name, email, cpf)
        VALUES ('{account["name"]}', '{account["email"]}', '{account["cpf"]}')
        RETURNING id
        )
        
        INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
        SELECT id, {plan["id"]},'{credit_card}', {plan["price"]}, true
        FROM new_account;
        COMMIT;
"""
    execut_query(query)
    print (query)
    
def insert_account(account):
    query = f"INSERT into accounts (name,email,cpf) values ('{account["name"]}','{account["email"]}','{account["cpf"]}');"
    execut_query(query)
    print(query)

def delete_acount_by_email(email):

    query = f"DELETE FROM accounts WHERE email ='{email}'"
    execut_query(query)
    print(query)