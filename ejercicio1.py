# -*- coding: utf-8 -*-
"""
@author: Arael Paloma & Oswaldo Robles
"""

"""
Ejercicio 
Defina una funcion que resuelva con verdadero o falso segun corresponada
Laura esta en Queretaro
Alena esta en Paris
Claudia esta en San Francisco
Queretaro esta en Mexico
Paris esta en Francia
San Francisco esta en EUA
Mexico esta en America
Francia esta en Europa
EUA esta en America

"""
def esta(e1, e2):
    base = [["Laura","Queretaro"],
             ["Alena", "Paris"],
             ["Claudia","San Francisco"],
            ["Queretaro","Mexico"],
             ["San Francisco","EUA"],
             ["Paris","Francia"],
            ["EUA","America"],
             ["Mexico","America"],
             ["Francia","Europa"]
    ]
    #quien = ""
    lugar = ""
    for x in base:
        if x[0] == e1:
            print(x)
            #quien = x[0]
            lugar = x[1]
        if lugar != "":
            if lugar == e2:
                return True
            else:
                for y in base:
                    if lugar == y[0]:
                        print("lugar_:",lugar)
                        lugar = y[1]
                        if lugar == e2:
                            print("lugar_:",lugar)
                            return True
                return False
                        
print("Respuesta final:",esta('Alena','Europa'))
print()
print("Respuesta final:",esta('Laura','America'))
print()
print("Respuesta final:",esta('Laura','Europa'))
