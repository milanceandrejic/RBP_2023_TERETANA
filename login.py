import tkinter
import hashlib
import os
import sys
import mysql.connector
import tkinter as tk
from tkinter import ttk

# Establish a connection


# Create the Tkinter window
window = tk.Tk()
window.geometry("320x200")

# Create a Treeview widget



def open():
    window.destroy()
    pyexec = sys.executable
    PathPy = "show_data.py"
    os.system('%s %s' % (pyexec, PathPy))

def fun_login():
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="teretana_rbp"
    )
    cursor = conn.cursor()
    cursor.execute('Select * from korisnik')

    a = E1.get()
    b = E2.get()
    print(a)

    b = hashlib.sha256(b.encode()).hexdigest()
    print(b)
    # Fetch all the results
    results = cursor.fetchall()

    # Display the results
    for row in results:
        if (row[4] == a and row[5] == b):
            L1.config(text="Uspesno ste se ulogovali!")
            print("USPESNOO")
            open()
            return
    print("NEUSPESNO")
    L1.config(text = "Neuspesno logovanje, pokusajte ponovo!")



tkinter.Label(window, text="USERNAME").pack()
E1 = tkinter.Entry(window, bd=5)
E1.pack()
tkinter.Label(window, text="PASSWORD").pack()
E2 = tkinter.Entry(window, bd=5)
E2.pack()
B1 = tkinter.Button(window, bd=5, text='LOGIN', command=fun_login)
B1.pack()
L1 = tkinter.Label(window, text=' ')
L1.pack()

# Run the Tkinter event loop
window.mainloop()