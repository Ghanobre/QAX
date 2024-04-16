from    faker   import  Faker

fake = Faker('pt_BR')

def get_fake_account():
    account ={
        "name": fake.name(),
        "email": fake.email(),
        "cpf": fake.ssn()
    }
    return  account
fake_account = get_fake_account()
print(fake_account)