<!DOCTYPE html>
<html>
<head>
    <title>College Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        
        header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }
        
        h1 {
            margin-top: 20px;
        }
        
        .container {
            max-width: 90%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        p {
            font-size: 16px;
            line-height: 1.5;
        }
        
        ul {
            list-style-type: none;
            padding: 0;
        }
        
        li {
            margin-bottom: 10px;
        }
        
        .buttons-container {
            display: flex;
            flex-wrap: wrap;
            justify-content:center;
        }
        
        .button {
            margin: 5px;
            padding:10px 20px;
            background-color: #333;
        }
        
        a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }
        
        a:hover {
            color: #333;
            background-color: white;
        }
    </style>
</head>
<body>
    <header>
        <h1>College Database Management System</h1>
    </header>
    <div class="container">
        <center><p>Welcome to the College Database Management System. This system provides tools for managing various aspects of the college, including departments, faculty, students, marks, and subjects.</p></center>
        
        <center><h2>Navigation</h2></center>
        <div class="buttons-container">
            <div class="button"><a href="departments.php">Departments</a></div>
            <div class="button"><a href="faculty.php">Faculty</a></div>
            <div class="button"><a href="students.php">Students</a></div>
            <div class="button"><a href="marks.php">Marks</a></div>
            <div class="button"><a href="subjects.php">Subjects</a></div>
        </div>
    </div>
</body>
</html>
