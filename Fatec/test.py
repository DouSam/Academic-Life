# pow(base,exp)
from tkinter import *
'''
par = 0
impar = 0

for x in range(1000):
    if x % 2 != 0:
        for y in range(1000):
            if pow(x,y) % 2 == 0:
                par = par +1
            else:
                impar = impar + 1

print("Base impar resultante em par: {}".format(par),"Base impar resultante em impar: {}".format(impar))
'''
'''
#Testando ex 1 mat
elementosM = [5,18,19,20,23,28]

impar =0

for num in elementosM:
    for exp in elementosM:
        if num != exp:
            if pow(num,exp) % 2 != 0:
                impar = impar + 1

print(impar)
'''
#Testando tkinter

root = Tk()

myLabel = Label(root,text="Hello monkey!")

myLabel.pack()

root.mainloop()