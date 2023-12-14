# 1st Homework of the Java Test Automation Course (2nd block) - Solvd Laba
This repository stores the 1st homework given by our mentor in the 2nd block of 
the Java Test Automation Course at Solvd Laba. It consists of implementing the
hierarchy of classes created in previous homeworks into a database diagram, which
will create the proper SQL code to create the columns, tables and the relationships
between them. The topic of my hierarchy was "Animals", and you can check out the
generated SQL code in the src.main.resources package.

## Explanation

To accomplish the requirements of the homework, I've transferred the entire
hierarchy of the package named models to a MySQL database using the MySQL 
Workbench. All the entities were converted into tables and in some cases, there
were some minor modifications. Moreover, I used all the relationships types,
the MANY-TO-MANY relation was used to persist the time, day and spent money of
the customers in the zoos, the ONE-TO-MANY was the most used relation in all the
diagram and the ONE-TO-ONE was used in the "employees" table with the 
"employees_identifiers" table, since each employee has their own identifier.

## What did I learn?

Although I already had knowledge about relational databases, this homework
was very useful to revise concepts and apply them in a practical exercise like
this. I can say that I've learnt from my lecturers the good practices and 
conventions of SQL.

## Technologies

- Java
- Maven
- MySQL

## Set-Up

To run this project you will need an updated version of Java.
First, clone this repository in a folder of your PC.
You have to put the following command in a terminal:

```bash
  git clone this-repo-url
```
You will need an IDE to open the project folder and, finally, run the 
Main.java file to see the program output.

## Author

- [@Nazareno Bucciarelli](https://github.com/nazabucciarelli)
