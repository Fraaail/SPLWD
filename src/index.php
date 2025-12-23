<?php
session_start();

// Initialize database if needed
include 'init_database.php';

// Handle login logic
if (isset($_POST['login'])) {
    include 'connect.php';
    date_default_timezone_set('Asia/Manila');

    // Sanitize inputs
    $username = mysqli_real_escape_string($conn, stripcslashes($_POST['user']));
    $password = mysqli_real_escape_string($conn, stripcslashes($_POST['pass']));

    // Function to log activity
    function logActivity($conn, $teacher_id, $school) {
        $date = date('Y-m-d h:i:sa');
        $sql = "INSERT INTO `log` (`log_id`, `date`, `teacher_id`, `action_type`, `details`, `previous`, `updated`, `student_id`, `status`, `school`) 
                VALUES (NULL, '$date', '$teacher_id', 'Log in', 'Log in to the system', '', '', '', '', '$school')";
        return $conn->query($sql);
    }

    // Check student login
    $sql_student = "SELECT * FROM new_student WHERE lrn = '$username'";
    $result_student = mysqli_query($conn, $sql_student);
    if ($result_student && $row = mysqli_fetch_assoc($result_student)) {
        if (password_verify($password, $row['password'])) {
            $_SESSION['logged_in'] = $row['lrn'];
            $_SESSION['id'] = $row['lrn'];
            $_SESSION['guardian'] = $row['guardian'];
            $_SESSION['color'] = 'bg-info';
            $_SESSION['folder_id'] = '';

            // Get latest folder ID
            $sql_folder = "SELECT folder_id FROM folder WHERE lrn = '$username' ORDER BY folder_id DESC LIMIT 1";
            $result_folder = mysqli_query($conn, $sql_folder);
            if ($result_folder && $folder_row = mysqli_fetch_assoc($result_folder)) {
                $_SESSION['folder_id'] = $folder_row['folder_id'];
            }

            header("Location: parent/change.php");
            exit;
        }
    }

    // Check teacher/admin login
    $sql_teacher = "SELECT * FROM teachers WHERE BINARY email = BINARY '$username'";
    $result_teacher = mysqli_query($conn, $sql_teacher);
    if ($result_teacher && $row = mysqli_fetch_assoc($result_teacher)) {
        if (password_verify($password, $row['password'])) {
            if ($username === "admin") {
                $_SESSION['admin'] = $username;
                $_SESSION['logged_in'] = $username;
                $_SESSION['logged_id'] = $row['id'];
                $_SESSION['color'] = 'bg-info';
                header("Location: district_admin/dashboard.php?id=" . $row['id']);
            } elseif ($row['status'] === 'approve') {
                $_SESSION['logged_in'] = $row['fname'];
                $_SESSION['teacher_id'] = $row['teacher_id'];
                $_SESSION['img'] = $row['img'];
                $_SESSION['logged_id'] = $row['id'];
                $_SESSION['school'] = $row['school'];
                $_SESSION['color'] = 'bg-info';

                logActivity($conn, $row['teacher_id'], $row['school']);

                switch ($row['category']) {
                    case 2:
                        header("Location: principal/dashboard.php?id=" . $row['id']);
                        break;
                    case 3:
                        header("Location: secretary/dashboard.php?id=" . $row['id']);
                        break;
                    case 4:
                        header("Location: teacher/profile.php?id=" . $row['id']);
                        break;
                    default:
                        header("Location: index.php?invalid=1");
                        break;
                }
            } else {
                header("Location: index.php?pending=1");
            }
            exit;
        }
    }

    // If no match found
    header("Location: index.php?invalid=1");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="https://www.favicon.cc/favicon/121/664/favicon.png">
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;600;700;800;900&display=swap" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Inline CSS for centering -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            position: relative;
            top: 30px; /* Slight downward adjustment */
        }
    </style>
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row p-5">
                            <div class="col-lg-6 d-none d-lg-block">
                                <img src="img/SC2.png" class="img-fluid" alt="">
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" method="POST">
                                        <div class="form-group">
                                            <input type="text" name="user" class="form-control form-control-user" 
                                                id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Email">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="pass" class="form-control form-control-user" 
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                        <input type="submit" name="login" value="Submit" class="btn btn-primary btn-user btn-block">
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot_password.php">Forgot Password?</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="signup.php">Create an Account</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <?php if (isset($_GET['pending'])): ?>
        <script>swal('Pending User Account', 'Your Account status is still pending wait for the admin to approve your account', 'info');</script>
    <?php elseif (isset($_GET['invalid'])): ?>
        <script>swal('Invalid username or password!', 'Please check your username or password', 'error');</script>
    <?php endif; ?>
</body>
</html>