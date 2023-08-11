<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "college_database";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$action = isset($_GET['action']) ? $_GET['action'] : 'show';

echo '<!DOCTYPE html>
<html>
<head>
    <title>Faculty Data</title>
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
        <h1>Faculty Management System</h1>
    </header>
    <div class="container">
        <div class="button"><a href="faculty.php?action=show">Show Faculty Details</a></div>
        <div class="button"><a href="faculty.php?action=add">Add Faculty</a></div>
        <div class="button"><a href="faculty.php?action=remove">Remove Faculty</a></div>
    </div>
    <main>';

if($action === 'show') {
    $sql = "SELECT * FROM faculty";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        echo '<center><h2>Faculty Details</h2></center>';
        echo '<table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department ID</th>
                    <th>Phone</th>
                </tr>';
        while($row = $result->fetch_assoc()) {
            echo '<tr>';
            echo '<td>' . $row['id'] . '</td>';
            echo '<td>' . $row['name'] . '</td>';
            echo '<td>' . $row['department_id'] . '</td>';
            echo '<td>' . $row['phone'] . '</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo 'No faculty records available.';
    }
}

elseif($action === 'add') {
    if(isset($_POST['add_id']) && isset($_POST['add_name']) && isset($_POST['add_department_id']) && isset($_POST['add_phone'])) {
        $id = $_POST['add_id'];
        $name = $_POST['add_name'];
        $department_id = $_POST['add_department_id'];
        $phone = $_POST['add_phone'];
        $sql = "INSERT INTO faculty (id, name, department_id, phone) VALUES ($id, '$name', $department_id, '$phone')";
        if ($conn->query($sql) === TRUE) {
            echo "Faculty added successfully.";
        } else {
            echo "Error adding faculty: " . $conn->error;
        }
    }
    else {
        echo '<center><h2>Add Faculty</h2></center>';
        echo '<form method="POST">';
        echo '<input type="number" name="add_id" placeholder="Faculty ID" required>';
        echo '<input type="text" name="add_name" placeholder="Faculty Name" required>';
        echo '<input type="number" name="add_department_id" placeholder="Department ID" required>';
        echo '<input type="text" name="add_phone" placeholder="Phone" required>';
        echo '<input type="submit" value="Add">';
        echo '</form>';
    }
}
elseif($action === 'remove') {
    if(isset($_POST['remove_id'])) {
        $id = $_POST['remove_id'];
        $sql = "DELETE FROM faculty WHERE id = $id";
        if ($conn->query($sql) === TRUE) {
            echo "Faculty record with ID $id has been removed.";
        } else {
            echo "Error removing faculty record: " . $conn->error;
        }
    }
    else {
        echo '<center><h2>Remove Faculty</h2></center>';
        echo '<form method="POST">';
        echo '<input type="number" name="remove_id" placeholder="Faculty ID to Remove" required>';
        echo '<input type="submit" value="Remove">';
        echo '</form>';
    }
}

echo '</main>
    </body>
</html>';

$conn->close();
?>
