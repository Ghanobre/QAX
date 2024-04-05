import psycopg2

def delete_acount_by_email(email):

    query = f"DELETE FROM accounts WHERE email ='{email}'"

    conn = psycopg2.connect(
        host='isabelle.db.elephantsql.com',
        database='zzclsbls',
        user='zzclsbls',
        password='NIT8j7FTdgqiHIfceKUiIbqqD3J_6vMs'
    )
    cur = conn.cursor()
    cur.execute(query)
    conn.commit()
    conn.close()