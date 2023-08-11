<!DOCTYPE html>
<html>
<head>
    <title>Departments Data</title>
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
        <h1>Departments Data</h1>
    </header>
    <div class="container">
        <div class="button"><a href="departments.php?action=show">Show Department Details</a></div>
        <div class="button"><a href="departments.php?action=add">Add Department</a></div>
        <div class="button"><a href="departments.php?action=remove">Remove Department</a></div>
        
        <?php
        // Database connection
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "college_database";

        $conn = new mysqli($servername, $username, $password, $dbname);

        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        
        // Handle actions
        if(isset($_GET['action'])) {
            $action = $_GET['action'];
            
            if($action === 'show') {
                $sql = "SELECT * FROM departments";
                $result = $conn->query($sql);
                
                if ($result->num_rows > 0) {
                    echo "<h2>Department Details</h2>";
                    echo "<table>";
                    echo "<tr><th>ID</th><th>Name</th></tr>";
                    while($row = $result->fetch_assoc()) {
                        echo "<tr><td>" . $row["id"] . "</td><td>" . $row["name"] . "</td></tr>";
                    }
                    echo "</table>";
                } else {
                    echo "No departments found.";
                }
            }
            elseif($action === 'add') {
    if(isset($_POST['add_id']) && isset($_POST['add_name'])) {
        $id = $_POST['add_id'];
        $name = $_POST['add_name'];
        $sql = "INSERT INTO departments (id, name) VALUES ($id, '$name')";
        if ($conn->query($sql) === TRUE) {
            echo "Department added successfully.";
        } else {
            echo "Error adding department: " . $conn->error;
        }
    }
    else {
        echo '<h2>Add Department</h2>';
        echo '<form method="POST">';
        echo '<input type="number" name="add_id" placeholder="Department ID" required>';
        echo '<input type="text" name="add_name" placeholder="Department Name" required>';
        echo '<input type="submit" value="Add">';
        echo '</form>';
    }
}
            elseif($action === 'remove') {
                if(isset($_POST['remove_id'])) {
                    $id = $_POST['remove_id'];
                    $sql = "DELETE FROM departments WHERE id = $id";
                    if ($conn->query($sql) === TRUE) {
                        echo "Department removed successfully.";
                    } else {
                        echo "Error removing department: " . $conn->error;
                    }
                }
                else {
                    echo '<h2>Remove Department</h2>';
                    echo '<form method="POST">';
                    echo '<input type="number" name="remove_id" placeholder="Department ID" required>';
                    echo '<input type="submit" value="Remove">';
                    echo '</form>';
                }
            }
        }
        
        $conn->close();
        ?>
    </div>
</body>
</html>
