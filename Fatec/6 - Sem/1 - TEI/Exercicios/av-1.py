from datetime import datetime

def ex7():
    actual_date = datetime.now()
    print(actual_date)
    ano = actual_date.year
    print(ano)
    mes = actual_date.month
    print(mes)
    dia = actual_date.day
    print(dia)

    formated = actual_date.strftime("%d/%m/%Y")

    print(formated)

    formated = actual_date.strftime("%d de %B de %Y")

    print(formated)

ex7()