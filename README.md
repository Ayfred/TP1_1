Todo List Web Application on Tomcat using JavaEE
This is a simple Todo List Web Application built using JavaEE technologies such as JSP and the MVC architecture. The application allows users to create, read, update, and delete tasks.

Features
Add tasks with a title, description, and due date
Mark tasks as complete or incomplete
Edit and delete tasks
View all tasks or filter tasks by completion status
Technologies Used
JavaEE
Tomcat
JSP
Servlets
MVC Architecture
MySQL database
Getting Started
Prerequisites
Java Development Kit (JDK) 11 or higher
Apache Tomcat 9 or higher
MySQL database
Installing
Clone the repository:

bash
Copy code
git clone https://github.com/your-username/todo-list-web-app.git
Import the project into your IDE (Eclipse, NetBeans, etc.)

Configure the MySQL database settings in the persistence.xml file located in src/main/resources/META-INF/

Build the project using Maven:

Copy code
mvn clean install
Deploy the project to Tomcat:

bash
Copy code
cp target/todo-list-web-app.war $CATALINA_HOME/webapps/
Replace $CATALINA_HOME with the path to your Tomcat installation directory.

Start Tomcat:

bash
Copy code
$CATALINA_HOME/bin/startup.sh
Access the application in your browser:

bash
Copy code
http://localhost:8080/todo-list-web-app/
Usage
Create a new task by clicking the "Add Task" button on the home page.

Fill in the title, description, and due date fields and click "Save".

View all tasks by clicking the "View All Tasks" button on the home page.

Filter tasks by completion status using the dropdown menu on the home page.

Edit a task by clicking the "Edit" button next to the task on the View All Tasks page.

Delete a task by clicking the "Delete" button next to the task on the View All Tasks page.
