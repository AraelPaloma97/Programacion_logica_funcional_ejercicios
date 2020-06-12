"""
	https://www.computrabajo.com.mx/ofertas-de-trabajo/oferta-de-trabajo-de-desarrollador-batch-exp-sistemas-abiertos-en-queretaro-601BC72F6CEBB0F761373E686DCF3405
	En una empresa solicitan Lic./Ing. en Sistemas, Computación o afín.
	con los siguientes requisitos:
	• Oracle BBDD
	• SQL y PL/SQL
	• Linux
	• Unix
	• Shell (Linux - Unix)
	• C++, Proc*C y Tuxedo V12 o anteriores
	• Visual Basic 6.0
	• Java (Frameworks) , Web Services y Micro Servicios APIs
    
	Realizar un programa que realice preguntas al usuario
	y que apartir de sus respuestas evalue si es cadidato o no
	(usen conjuntos)
"""
Requisitos = {
	"Oracle","SQL/PL","Linux","Unix","Shell","C++",
	"Proc*C","TuxedoV12", "VB6", "Java","WebServices","MicroServicios"
}
#print(Requisitos)
print("¿Tiene Experiencia en el manejo de el siguiente software?")
print("Conteste si o no")

def esCandidato():
	R1 = input("\n Oracle BBDD : ").upper()
	R2 = input(" SQL y PL/SQL : ").upper()
	R3 = input(" Linux : ").upper()
	R4 = input(" Unix  : ").upper()
	R5 = input(" Shell (Linux - Unix) : ").upper()
	R6 = input(" C++ : ").upper()
	R7 = input(" Proc*C : ").upper()
	R8 = input(" TuxedoV12 : ").upper()
	R9 = input(" VB6 : ").upper()
	R10 = input(" Java : ").upper()
	R11 = input(" WebServices  : ").upper()
	R12 = input(" MicroServicios : ").upper()
    
	ExpeUsu = set()
	if R1 == "SI":
		ExpeUsu.add("Oracle")
	if R2 == "SI":
		ExpeUsu.add("SQL/PL")
	if R3 == "SI":
		ExpeUsu.add("Linux")
	if R4 == "SI":
		ExpeUsu.add("Unix")
	if R5 == "SI":
		ExpeUsu.add("Shell")
	if R6 == "SI":
		ExpeUsu.add("C++")
	if R7 == "SI":
		ExpeUsu.add("Proc*C")
	if R8 == "SI":
		ExpeUsu.add("TuxedoV12")
	if R9 == "SI":
		ExpeUsu.add("VB6")
	if R10 == "SI":
		ExpeUsu.add("Java")
	if R11 == "SI":
		ExpeUsu.add("WebServices")
	if R12 == "SI":
		ExpeUsu.add("MicroServicios")
	cdifer = Requisitos - ExpeUsu
	cinter = Requisitos & ExpeUsu
    
	print("\nRequisitos que cumple: ",ExpeUsu)
	print("Requsitos que carece: ",cdifer)
    
	Req = len(Requisitos)
	Exp = len(cinter)
	RMinimos = Req - 5
	if Exp >= RMinimos:
		return "Es candidato para el puesto"
	else:
		return "No es candidato para el puesto"

print(esCandidato())