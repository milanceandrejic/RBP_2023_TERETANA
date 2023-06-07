import tkinter

import mysql.connector
import tkinter as tk
from tkinter import ttk
import os
import sys

# Establish a connection



# Create the Tkinter window
window = tk.Tk()

# Create a Treeview widget
tree = ttk.Treeview(window)


def prikaziSve():
    tree.delete(*tree.get_children())
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="teretana_rbp"
    )
    cursor = conn.cursor()
    #Fetch data from the database

    query = "SELECT * FROM VIEW_CLANOVI"
    cursor.execute(query)
    results = cursor.fetchall()

    print(results)

    columns_head = ['Clanski broj','Ime',"prezime",'Datum isteka clanarine']
    # Define columns
    tree["columns"] = tuple(range(len(results[0])))
    # Configure column headings
    for i, column in enumerate(results[0]):
        tree.heading(i, text=columns_head[i])

    # Insert data rows
    for row in results:
        tree.insert("", tk.END, values=row)
    cursor.close()
    conn.close()

prikaziSve()
# Pack the Treeview widget
def pretrazi_Bazu():
    tree.delete(*tree.get_children())
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="teretana_rbp"
    )
    cursor = conn.cursor()
    unos = E1.get()
    #query = "SELECT * FROM VIEW_CLANOVI where ime like '%" + unos +"%'"
    query = "call sp_pretrazi('"+ unos +"')"
    cursor.callproc("sp_pretrazi", [unos,])
    stored = cursor.stored_results()
    results = None
    for res in stored:
        #print(res.fetchall())
        results = res.fetchall()
    print(results)

    columns_head = ['Clanski broj', 'Ime', "prezime", 'Datum isteka clanarine']
    # Define columns
    try:
        tree["columns"] = tuple(range(len(results[0])))
    # Configure column headings
        for i, column in enumerate(results[0]):
            tree.heading(i, text=columns_head[i])

        for row in results:
            tree.insert("", tk.END, values=row)
    except:
        print("Greska")
    cursor.close()
    conn.close()

def openDodaj():
    pyexec = sys.executable
    PathPy = "add_member.py"
    os.system('%s %s' % (pyexec, PathPy))

def openProduzi():
    window.destroy()
    pyexec = sys.executable
    PathPy = "produzi.py"
    os.system('%s %s' % (pyexec, PathPy))

E1 = tkinter.Entry(window, bd =5)
E1.pack()
B1 = tkinter.Button(window, bd=5, text='Pretrazi clana', command=pretrazi_Bazu)
B1.pack()
B2 = tkinter.Button(window, bd=5, text='Prikazi sve clanove', command=prikaziSve)
B2.pack()

tree.pack()

# B3 = tkinter.Button(window, bd=5, text='Dodaj novog clana', command=openDodaj)
# B3.pack()
#
# B4 = tkinter.Button(window, bd=5, text='Produzi clanarinu', command=openProduzi)
# B4.pack()

# Run the Tkinter event loop
window.mainloop()