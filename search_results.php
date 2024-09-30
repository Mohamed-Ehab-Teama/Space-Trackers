<?php
require_once('./connection.php');

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to access this page.");
}

// Get the search query
$search_query = $_GET['query'] ?? '';

if ($search_query) {
    $search_query = "%" . $search_query . "%";

    // Search in quizzes table
    $quizzes_query = "SELECT * FROM quizzes WHERE quiz_name LIKE :search_query ";
    $quizzes_stmt = $connection->prepare($quizzes_query);
    $quizzes_stmt->bindParam(':search_query', $search_query);
    $quizzes_stmt->execute();
    $quizzes_results = $quizzes_stmt->fetchAll(PDO::FETCH_ASSOC);

    // Search in users table
    $users_query = "SELECT * FROM users WHERE username LIKE :search_query OR email LIKE :search_query";
    $users_stmt = $connection->prepare($users_query);
    $users_stmt->bindParam(':search_query', $search_query);
    $users_stmt->execute();
    $users_results = $users_stmt->fetchAll(PDO::FETCH_ASSOC);

    // Search in levels table
    $levels_query = "SELECT * FROM levels WHERE level_name LIKE :search_query OR description LIKE :search_query";
    $levels_stmt = $connection->prepare($levels_query);
    $levels_stmt->bindParam(':search_query', $search_query);
    $levels_stmt->execute();
    $levels_results = $levels_stmt->fetchAll(PDO::FETCH_ASSOC);

    // Search in Sessions table
    $sessions_query = "SELECT * FROM sessions WHERE content LIKE :search_query";
    $sessions_stmt = $connection->prepare($sessions_query);
    $sessions_stmt->bindParam(':search_query', $search_query);
    $sessions_stmt->execute();
    $sessions_results = $sessions_stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <div class="container mt-5">
        <h1>Search Results</h1>

        <!-- Display Quizzes Results -->
        <?php if (!empty($quizzes_results)): ?>
            <h2>Quizzes</h2>
            <ul class="list-group mb-3">
                <?php foreach ($quizzes_results as $quiz): ?>
                    <li class="list-group-item">
                        <!-- <a href="quiz.php?quiz_id=<?= htmlspecialchars($quiz['id']); ?>"> -->
                        <a href="#">
                            <?= htmlspecialchars($quiz['quiz_name']); ?>
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>

        <!-- Display Users Results -->
        <?php if (!empty($users_results)): ?>
            <h2>Users</h2>
            <ul class="list-group mb-3">
                <?php foreach ($users_results as $user): ?>
                    <li class="list-group-item">
                        <!-- <a href="progress.php?user_id=<?= htmlspecialchars($user['id']); ?>"> -->
                        <a href="#">
                            <?= htmlspecialchars($user['username']); ?> (<?= htmlspecialchars($user['email']); ?>)
                        </a>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>

        <!-- Display levels Results -->
        <?php if (!empty($levels_results)): ?>
            <h2>Levels</h2>
            <ul class="list-group mb-3">
                <?php foreach ($levels_results as $level): ?>
                    <li class="list-group-item">
                        <!-- <a href="level.php?id=<?= htmlspecialchars($level['level_number']); ?>"> -->
                        <a href="#">
                            <?= htmlspecialchars($level['level_name']); ?>
                        </a>
                        <p><?= htmlspecialchars(substr($level['description'], 0, 100)); ?>...</p>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>

        <!-- Display sessions Results -->
        <?php if (!empty($sessions_results)): ?>
            <h2>Levels</h2>
            <ul class="list-group mb-3">
                <?php foreach ($sessions_results as $session): ?>
                    <li class="list-group-item">
                        <a href="#">
                            <?= htmlspecialchars($session['session_number']); ?>
                        </a>
                        <p><?= htmlspecialchars(substr($session['content'], 0, 100)); ?>...</p>
                    </li>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>

        <!-- If No Results Found -->
        <?php if (empty($quizzes_results) && empty($users_results) && empty($articles_results)): ?>
            <p>No results found for your search query.</p>
        <?php endif; ?>

        <a href="search.php" class="btn btn-secondary mt-3">Go Back to Search</a>
    </div>
</body>

</html>