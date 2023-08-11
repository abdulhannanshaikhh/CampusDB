<!DOCTYPE html>
<html>
<head>
    <title>Subjects Data</title>
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
    <h1>Subjects Data</h1>
</header>
<div class="container">
    <a href="subjects.php?action=show" class="button">Show Subjects Details</a>
    <a href="subjects.php?action=add" class="button">Add Subjects</a>
    <a href="subjects.php?action=remove" class="button">Remove Subjects</a>
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
        $sql = "SELECT * FROM subjects";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<h2>Subjects Details</h2>";
            echo "<table>";
            echo "<tr><th>ID</th><th>Department ID</th><th>Name</th><th>Faculty ID</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>".$row["id"]."</td><td>".$row["department_id"]."</td><td>".$row["name"]."</td><td>".$row["faculty_id"]."</td></tr>";
            }
            echo "</table>";
        } else {
            echo "No subjects records found.";
        }
    }
    elseif($action === 'add') {
        if(isset($_POST['add_id']) && isset($_POST['add_department_id']) && isset($_POST['add_name']) && isset($_POST['add_faculty_id'])) {
            $id = $_POST['add_id'];
            $department_id = $_POST['add_department_id'];
            $name = $_POST['add_name'];
            $faculty_id = $_POST['add_faculty_id'];
            $sql = "INSERT INTO subjects (id, department_id, name, faculty_id) VALUES ($id, $department_id, '$name', $faculty_id)";
            if ($conn->query($sql) === TRUE) {
                echo "Subjects record added successfully.";
            } else {
                echo "Error adding subjects record: " . $conn->error;
            }
        }
        else {
            echo '<h2>Add Subjects</h2>';
            echo '<form method="POST">';
            echo '<input type="number" name="add_id" placeholder="ID" required>';
            echo '<input type="number" name="add_department_id" placeholder="Department ID" required>';
            echo '<input type="text" name="add_name" placeholder="Name" required>';
            echo '<input type="number" name="add_faculty_id" placeholder="Faculty ID" required>';
            echo '<input type="submit" value="Add">';
            echo '</form>';
        }
    }
    elseif($action === 'remove') {
        if(isset($_POST['remove_id'])) {
            $id = $_POST['remove_id'];
            $sql = "DELETE FROM subjects WHERE id = $id";
            if ($conn->query($sql) === TRUE) {
                echo "Subjects record with ID $id has been removed.";
            } else {
                echo "Error removing subjects record: " . $conn->error;
            }
        }
        else {
            echo '<h2>Remove Subjects</h2>';
            echo '<form method="POST">';
            echo '<input type="number" name="remove_id" placeholder="ID to Remove" required>';
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
