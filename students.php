<!DOCTYPE html>
<html>
<head>
    <title>Students Data</title>
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
            text-align:center;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .button {
            background-color:#333;
            color:white;
            margin: 5px;
            padding:10px 20px;
        }
        a{
          text-decoration:none;
          color:white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        input{
        background-color: #333;
        color:white;
        padding:20px;
        margin:5px;
}
    </style>
</head>
<body>
<header>
    <h1>Students Data</h1>
</header>
<div class="container">
 <a href="students.php?action=show" class="button">Show Student Details</a>
    <a href="students.php?action=add" class="button">Add Student</a>
    <a href="students.php?action=remove" class="button">Remove Student</a>
    <?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "college_database";

    $conn = new mysqli($servername, $username, $password, $dbname);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $action = isset($_GET['action']) ? $_GET['action'] : '';

    if ($action === 'show') {
        $sql = "SELECT * FROM students";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<center><h2>Student Details</h2></center>";
            echo "<table>";
            echo "<tr><th>Roll Number</th><th>Name</th><th>Department ID</th><th>Phone</th><th>Admission Date</th><th>CET Number</th><th>Faculty ID</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>".$row["rollno"]."</td><td>".$row["name"]."</td><td>".$row["department_id"]."</td><td>".$row["phone"]."</td><td>".$row["admission_date"]."</td><td>".$row["cet_no"]."</td><td>".$row["faculty_id"]."</td></tr>";
            }
            echo "</table>";
        } else {
            echo "No student records found.";
        }
    }
    elseif($action === 'add') {
        if(isset($_POST['add_rollno']) && isset($_POST['add_name']) && isset($_POST['add_department_id']) && isset($_POST['add_phone']) && isset($_POST['add_admission_date']) && isset($_POST['add_cet_no']) && isset($_POST['add_faculty_id'])) {
            $rollno = $_POST['add_rollno'];
            $name = $_POST['add_name'];
            $department_id = $_POST['add_department_id'];
            $phone = $_POST['add_phone'];
            $admission_date = $_POST['add_admission_date'];
            $cet_no = $_POST['add_cet_no'];
            $faculty_id = $_POST['add_faculty_id'];
            $sql = "INSERT INTO students (rollno, name, department_id, phone, admission_date, cet_no, faculty_id) VALUES ($rollno, '$name', $department_id, '$phone', '$admission_date', $cet_no, $faculty_id)";
            if ($conn->query($sql) === TRUE) {
                echo "Student added successfully.";
            } else {
                echo "Error adding student: " . $conn->error;
            }
        }
        else {
            echo '<center><h2>Add Student</h2></center>';
            echo '<form method="POST">';
            echo '<input type="number" name="add_rollno" placeholder="Roll Number" required>';
            echo '<input type="text" name="add_name" placeholder="Student Name" required>';
            echo '<input type="number" name="add_department_id" placeholder="Department ID" required>';
            echo '<input type="text" name="add_phone" placeholder="Phone" required>';
            echo '<input type="date" name="add_admission_date" placeholder="Admission Date" required>';
            echo '<input type="number" name="add_cet_no" placeholder="CET Number" required>';
            echo '<input type="number" name="add_faculty_id" placeholder="Faculty ID" required>';
            echo '<input type="submit" value="Add">';
            echo '</form>';
        }
    }
    elseif($action === 'remove') {
        if(isset($_POST['remove_rollno'])) {
            $rollno = $_POST['remove_rollno'];
            $sql = "DELETE FROM students WHERE rollno = $rollno";
            if ($conn->query($sql) === TRUE) {
                echo "Student record with Roll Number $rollno has been removed.";
            } else {
                echo "Error removing student record: " . $conn->error;
            }
        }
        else {
            echo '<center><h2>Remove Student</h2></center>';
            echo '<form method="POST">';
            echo '<input type="number" name="remove_rollno" placeholder="Roll Number to Remove" required>';
            echo '<input type="submit" value="Remove">';
            echo '</form>';
        }
    }

    $conn->close();
    ?>

    <br>
</div>
</body>
</html>
