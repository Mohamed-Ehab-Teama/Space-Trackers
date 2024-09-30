<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card {
            transition: 1.5s;
        }

        .card:hover {
            transform: scale(1.2);
            box-shadow: 10px 10px 10px white;
            background-color: rgba(150, 250, 20, 0.2) !important;
        }
    </style>
</head>

<body style=" background-image: url('./black.png') ">


    <h1 class="text-center mt-5 text-warning"> (: <u>Space Games</u> :) </h1>

    <div class="container">


        <!-- Row 01 -->
        <div class="row mt-5 mb-5">

            <div class="col">
                <div class="card rounded-pill" style="width: auto; background-color: rgba(150, 250, 20, 0.6); ">
                    <div class="card-body">
                        <h5 class="card-title text-center mt-4 text-white">Asteroid Dodger</h5>
                        <p class="card-text mt-4 text-white text-center">Dodge the asteroids to win!</p>
                        <center>
                            <a href="./game1/index.html" class="card-link btn btn-outline-dark mt-4">Start Game</a>
                        </center>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card rounded-pill" style="width: auto; background-color: rgba(150, 250, 20, 0.6); ">
                    <div class="card-body">
                        <h5 class="card-title text-center mt-4 text-white">Planet Quiz </h5>
                        <p class="card-text mt-4 text-white text-center">Try answering all questions without one mistake</p>
                        <center>
                            <a href="./game2/index.html" class="card-link btn btn-outline-dark mt-4">Start Game</a>
                        </center>
                    </div>
                </div>
            </div>

        </div>

        <!-- Row 2 -->
        <div class="row mt-5 mb-5">

            <div class="col">
                <div class="card rounded-pill" style="width: auto; background-color: rgba(150, 250, 20, 0.6); ">
                    <div class="card-body">
                        <h5 class="card-title text-center mt-4 text-white">Flip the Matched Cards </h5>
                        <p class="card-text mt-4 text-white text-center">Flip the Matched Cards game where the cards contain images of planets, and when the player matches two cards, they see information about the planet.</p>
                        <center>
                            <a href="./game3/index.html" class="card-link btn btn-outline-dark mt-4">Start Game</a>
                        </center>
                    </div>
                </div>
            </div>


        </div>


    </div>




    <center>
        <a href="../index.php" class="btn btn-warning m-5">Home Page</a>
    </center>







    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>