<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <h1 class="text-center mt-4">Search Everything:</h1>
        <form action="./search_results.php" method="GET">
            <div class="form-group">
                <input type="text" name="query" class="form-control mt-5" placeholder="Enter keywords to search..." required>
            </div>
            <center>
                <button type="submit" class="btn btn-primary mt-3">Search</button>
            </center>
        </form>
        <center>
            <a href="./index.php">
                <button type="submit" class="btn btn-warning mt-5">Home</button>
            </a>
        </center>
    </div>
</body>

</html>