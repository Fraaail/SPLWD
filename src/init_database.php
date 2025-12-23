<?php
// Database initialization script
// This script checks if the database exists and creates it if not, then imports the schema

$envFile = __DIR__ . '/.env';
if (!file_exists($envFile)) {
    die("Error: .env file not found. Please create .env file with database credentials.\n");
}

$env = parse_ini_file($envFile);
$servername = $env['DB_HOST'] ?? 'localhost';
$username = $env['DB_USER'] ?? 'root';
$password = $env['DB_PASS'] ?? '';
$db_name = $env['DB_NAME'] ?? 'sc_district';

// Connect to MySQL server without specifying database
$conn = mysqli_connect($servername, $username, $password);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Check if database exists
$result = mysqli_query($conn, "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = '$db_name'");
$databaseExists = mysqli_num_rows($result) > 0;

if (!$databaseExists) {
    // Create database
    $sql = "CREATE DATABASE `$db_name` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";
    if (mysqli_query($conn, $sql)) {
    } else {
        die("Error creating database: " . mysqli_error($conn));
    }
}

// Now connect to the specific database
mysqli_close($conn); // Close the connection without db
$conn = mysqli_connect($servername, $username, $password, $db_name);
if (!$conn) {
    die("Connection to database failed: " . mysqli_connect_error());
}

// Import schema if database was just created or if tables don't exist
// Check if tables exist by trying to select from a known table
$tablesExist = false;
$result = mysqli_query($conn, "SHOW TABLES LIKE 'teachers'");
if ($result && mysqli_num_rows($result) > 0) {
    $tablesExist = true;
}

if (!$tablesExist) {
    // Import schema
    $schemaFile = __DIR__ . '/database/sc_district.sql';
    if (!file_exists($schemaFile)) {
        die("Error: Schema file not found at $schemaFile\n");
    }

    $sql = file_get_contents($schemaFile);
    if ($sql === false) {
        die("Error reading schema file.\n");
    }

    // Split into individual statements
    $statements = array_filter(array_map('trim', explode(';', $sql)));

    foreach ($statements as $statement) {
        if (!empty($statement)) {
            if (mysqli_query($conn, $statement) === false) {
                die("Error executing SQL: " . mysqli_error($conn) . "\nStatement: $statement\n");
            }
        }
    }

}

// Close connection
mysqli_close($conn);
?>