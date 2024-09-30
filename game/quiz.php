<?php
require_once('../connection.php');

if (!isset($_SESSION['user_id'])) {
    die("You must be logged in to access this page.");
}

// Get the quiz ID from the URL
$quiz_id = $_GET['quiz_id'] ?? null;

if (!$quiz_id) {
    die("Quiz not found.");
}

// Get the user ID
$user_id = $_SESSION['user_id'];

// Check if the user has already taken the quiz
$attempt_check_query = "SELECT * FROM quiz_attempts WHERE user_id = :user_id AND quiz_id = :quiz_id";
$attempt_check_stmt = $connection->prepare($attempt_check_query);
$attempt_check_stmt->execute([
    'user_id' => $user_id,
    'quiz_id' => $quiz_id
]);

$quiz_attempted = $attempt_check_stmt->fetch(PDO::FETCH_ASSOC);

if ($quiz_attempted) {
    die("You have already completed this quiz.");
}

// Fetch quiz details
$quiz_query = "SELECT * FROM quizzes WHERE id = :quiz_id";
$quiz_stmt = $connection->prepare($quiz_query);
$quiz_stmt->bindParam(':quiz_id', $quiz_id);
$quiz_stmt->execute();
$quiz = $quiz_stmt->fetch(PDO::FETCH_ASSOC);

if (!$quiz) {
    die("Quiz not found.");
}

// Fetch quiz questions
$questions_query = "SELECT * FROM quiz_questions WHERE quiz_id = :quiz_id";
$questions_stmt = $connection->prepare($questions_query);
$questions_stmt->bindParam(':quiz_id', $quiz_id);
$questions_stmt->execute();
$questions = $questions_stmt->fetchAll(PDO::FETCH_ASSOC);

// Handle quiz submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $correct_answers = 0;
    $total_questions = count($questions);

    foreach ($questions as $question) {
        // Retrieve the user's answer for each question
        $user_answer = $_POST['question_' . $question['id']] ?? null;

        // Check if the user's answer matches the correct answer
        if ($user_answer == $question['correct_answer']) {
            $correct_answers++;
        }
    }

    // Calculate the user's score as a percentage
    $score = ($correct_answers / $total_questions) * 100;

    if ($score >= 70) { // Set your passing score, here it is 70%
        // Award coins for passing the quiz
        $coins_awarded = 50; // Set the coins awarded
        $user_id = $_SESSION['user_id'];

        // Update the user's coins and levels_completed columns
        $coins_query = "UPDATE users SET coins = coins + :coins_awarded, levels_completed = levels_completed + 1 WHERE id = :user_id";
        $coins_stmt = $connection->prepare($coins_query);
        $coins_stmt->execute([
            'coins_awarded' => $coins_awarded,
            'user_id' => $user_id,
        ]);

        // Log the quiz attempt in the quiz_attempts table
        $attempt_log_query = "INSERT INTO quiz_attempts (user_id, quiz_id) VALUES (:user_id, :quiz_id)";
        $attempt_log_stmt = $connection->prepare($attempt_log_query);
        $attempt_log_stmt->execute([
            'user_id' => $user_id,
            'quiz_id' => $quiz_id,
        ]);

        // Notify the user of success
        echo "Congratulations! You passed the quiz with a score of $score%. You earned $coins_awarded coins.";
        
        // Redirect after a delay
        header("refresh:2; url=game.php");
        exit;
    } else {
        // Notify the user of failure
        echo "You failed the quiz with a score of $score%. Try again!";
        
        // Redirect after a delay
        header("refresh:2; url=game.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($quiz['quiz_name']); ?></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        #myVideo {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            z-index: -100;
        }

        .content {
            position: fixed;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            color: #f1f1f1;
            width: 100%;
            padding: 20px;
        }

        #myBtn {
            width: 200px;
            font-size: 18px;
            padding: 10px;
            border: none;
            background: #000;
            color: #fff;
            cursor: pointer;
        }

        #myBtn:hover {
            background: #ddd;
            color: black;
        }
    </style>
</head>

<body>

    <video autoplay muted loop id="myVideo">
        <source src="../vids/background-vid.mp4" type="video/mp4">
    </video>

    <div class="container">
        <h1 class="text-warning text-center mt-5"><?= htmlspecialchars($quiz['quiz_name']); ?></h1>
        <form method="POST">
            <?php foreach ($questions as $question): ?>
                <div class="form-group border border-warning rounded-pill p-5">
                    <h5 class="text-white"><?= htmlspecialchars($question['question_text']); ?></h5><br>
                    <div>
                        <input type="radio" name="question_<?= $question['id']; ?>" value="<?= htmlspecialchars($question['option_a']); ?>">
                        <span class="text-white-50"><?= htmlspecialchars($question['option_a']); ?></span>
                        <br>
                        <input type="radio" name="question_<?= $question['id']; ?>" value="<?= htmlspecialchars($question['option_b']); ?>">
                        <span class="text-white-50"><?= htmlspecialchars($question['option_b']); ?></span>
                        <br>
                        <input type="radio" name="question_<?= $question['id']; ?>" value="<?= htmlspecialchars($question['option_c']); ?>">
                        <span class="text-white-50"><?= htmlspecialchars($question['option_c']); ?></span>
                        <br>
                        <input type="radio" name="question_<?= $question['id']; ?>" value="<?= htmlspecialchars($question['option_d']); ?>">
                        <span class="text-white-50"><?= htmlspecialchars($question['option_d']); ?></span>
                        <br>
                    </div>
                </div>
            <?php endforeach; ?>

            <center>
                <button type="submit" class="btn btn-outline-primary mb-5">Submit Quiz</button>
            </center>
        </form>
    </div>

    <script src="../js/back-vid.js"></script>

</body>

</html>
