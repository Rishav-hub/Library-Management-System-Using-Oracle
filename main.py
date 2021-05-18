from tkinter import *
from PIL import ImageTk,Image
from tkinter import messagebox

import cx_Oracle
from AddBook import *
from viewBook import *
from IssueBook import *
from viewBranch import *
from viewIssueBook import *
from addcust import *

# Connet Oracle with Python
try:
  
    con = cx_Oracle.connect('system/system@localhost')
    cursor = con.cursor()
    print(con.version)
  
except cx_Oracle.DatabaseError as e:
    print("There is a problem with Oracle", e)


#Code for Tkinter Frontend
root = Tk()
root.title("Library")
root.minsize(width=500,height=500)
root.geometry("600x600")

same=True
n=0.25

# Adding a background image
# background_image =Image.open("lib.jpeg")
# [imageSizeWidth, imageSizeHeight] = background_image.size

# newImageSizeWidth = int(imageSizeWidth*n)
# if same:
#     newImageSizeHeight = int(imageSizeHeight*n) 
# else:
#     newImageSizeHeight = int(imageSizeHeight/n) 
    
# background_image = background_image.resize((newImageSizeWidth,newImageSizeHeight),Image.ANTIALIAS)
# img = ImageTk.PhotoImage(background_image)
Canvas1 = Canvas(root)
# Canvas1.create_image(300,340,image = img)      
# Canvas1.config(bg="white",width = newImageSizeWidth, height = newImageSizeHeight)
# Canvas1.pack(expand=True,fill=BOTH)

#setting up header frame 
headingFrame1 = Frame(root,bg="#FFBB00",bd=5)
headingFrame1.place(relx=0.2,rely=0.1,relwidth=0.6,relheight=0.16)
headingLabel = Label(headingFrame1, text="Welcome to \n The Book Lounge", bg='black', fg='white', font=('Courier',15))
headingLabel.place(relx=0,rely=0, relwidth=1, relheight=1)

# Adding up buttons

btn1 = Button(root,text="Add Book Details",bg='black', fg='white', command=addBook)
btn1.place(relx=0.28,rely=0.4, relwidth=0.45,relheight=0.08)

btn2 = Button(root,text="Add New Customer",bg='black', fg='white', command=addCust)
btn2.place(relx=0.28,rely=0.5, relwidth=0.45,relheight=0.08)
    
btn3 = Button(root,text="View Book List",bg='black', fg='white', command=View)
btn3.place(relx=0.28,rely=0.6, relwidth=0.45,relheight=0.08)
    
btn4 = Button(root,text="Issue Book",bg='black', fg='white', command = issueBook)
btn4.place(relx=0.28,rely=0.7, relwidth=0.45,relheight=0.08)
    
btn5 = Button(root,text="View Issued Books",bg='black', fg='white', command = ViewI)
btn5.place(relx=0.28,rely=0.8, relwidth=0.45,relheight=0.08)

btn6 = Button(root,text="Branches Of Library",bg='black', fg='white', command = Viewb)
btn6.place(relx=0.28,rely=0.9, relwidth=0.45,relheight=0.08)
root.mainloop()