<!DOCTYPE html>
<html>
<head>
    <title>Marks Data</title>
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
    <h1>Marks Data</h1>
</header>
<div class="container">
    <a href="marks.php?action=show" class="button">Show Marks Details</a>
    <a href="marks.php?action=add" class="button">Add Marks</a>
    <a href="marks.php?action=remove" class="button">Remove Marks</a>
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
        $sql = "SELECT * FROM marks";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<h2>Marks Details</h2>";
            echo "<table>";
            echo "<tr><th>ID</th><th>Roll Number</th><th>Subject ID</th><th>Marks</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>".$row["id"]."</td><td>".$row["rollno"]."</td><td>".$row["subject_id"]."</td><td>".$row["marks"]."</td></tr>";
            }
            echo "</table>";
        } else {
            echo "No marks records found.";
        }
    }
    elseif($action === 'add') {
        if(isset($_POST['add_id']) && isset($_POST['add_rollno']) && isset($_POST['add_subject_id']) && isset($_POST['add_marks'])) {
            $id = $_POST['add_id'];
            $rollno = $_POST['add_rollno'];
            $subject_id = $_POST['add_subject_id'];
            $marks = $_POST['add_marks'];
            $sql = "INSERT INTO marks (id, rollno, subject_id, marks) VALUES ($id, $rollno, '$subject_id', $marks)";
            if ($conn->query($sql) === TRUE) {
                echo "Marks record added successfully.";
            } else {
                echo "Error adding marks record: " . $conn->error;
            }
        }
        else {
            echo '<h2>Add Marks</h2>';
            echo '<form method="POST">';
            echo '<input type="number" name="add_id" placeholder="ID" required>';
            echo '<input type="number" name="add_rollno" placeholder="Roll Number" required>';
            echo '<input type="text" name="add_subject_id" placeholder="Subject ID" required>';
            echo '<input type="number" name="add_marks" placeholder="Marks" required>';
            echo '<input type="submit" value="Add">';
            echo '</form>';
        }
    }
    elseif($action === 'remove') {
        if(isset($_POST['remove_id'])) {
            $id = $_POST['remove_id'];
            $sql = "DELETE FROM marks WHERE id = $id";
            if ($conn->query($sql) === TRUE) {
                echo "Marks record with ID $id has been removed.";
            } else {
                echo "Error removing marks record: " . $conn->error;
            }
        }
        else {
            echo '<h2>Remove Marks</h2>';
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
