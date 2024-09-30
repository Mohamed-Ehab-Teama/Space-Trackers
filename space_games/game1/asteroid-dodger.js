const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

// Load images
const spaceshipImg = new Image();
spaceshipImg.src = "../../images/spaceShip.jpg";

const asteroidImg = new Image();
asteroidImg.src = "../../images/ast.jpeg";

let spaceship = {
  x: canvas.width / 2 - 25,
  y: canvas.height - 80,
  width: 50,
  height: 50,
  speed: 10,
  movingLeft: false,
  movingRight: false,
};

let asteroids = [];
let score = 0;
let gameOver = false;

// Create asteroids
function createAsteroid() {
  const asteroid = {
    x: Math.random() * canvas.width,
    y: -100,
    width: 50,
    height: 50,
    speed: 5 + Math.random() * 3,
  };
  asteroids.push(asteroid);
}

function updateAsteroids() {
  for (let i = 0; i < asteroids.length; i++) {
    asteroids[i].y += asteroids[i].speed;

    // Check for collision
    if (
      asteroids[i].x < spaceship.x + spaceship.width &&
      asteroids[i].x + asteroids[i].width > spaceship.x &&
      asteroids[i].y < spaceship.y + spaceship.height &&
      asteroids[i].height + asteroids[i].y > spaceship.y
    ) {
      gameOver = true;
    }

    // Remove asteroids if off the screen
    if (asteroids[i].y > canvas.height) {
      asteroids.splice(i, 1);
      i--;
      score++;
    }
  }
}

// Handle spaceship movement
function updateSpaceship() {
  if (spaceship.movingLeft && spaceship.x > 0) {
    spaceship.x -= spaceship.speed;
  }
  if (spaceship.movingRight && spaceship.x + spaceship.width < canvas.width) {
    spaceship.x += spaceship.speed;
  }
}

// Draw spaceship
function drawSpaceship() {
  ctx.drawImage(
    spaceshipImg,
    spaceship.x,
    spaceship.y,
    spaceship.width,
    spaceship.height
  );
}

// Draw asteroids
function drawAsteroids() {
  for (const asteroid of asteroids) {
    ctx.drawImage(
      asteroidImg,
      asteroid.x,
      asteroid.y,
      asteroid.width,
      asteroid.height
    );
  }
}

// Draw score
function drawScore() {
  ctx.fillStyle = "white";
  ctx.font = "20px Arial";
  ctx.fillText("Score: " + score, 20, 30);
}

// Game loop
function gameLoop() {
  if (gameOver) {
    ctx.fillStyle = "red";
    ctx.font = "50px Arial";
    ctx.fillText("Game Over!", canvas.width / 2 - 150, canvas.height / 2);
    ctx.font = "30px Arial";
    ctx.fillText(
      "Score: " + score,
      canvas.width / 2 - 70,
      canvas.height / 2 + 50
    );
    return;
  }

  ctx.clearRect(0, 0, canvas.width, canvas.height);
  updateSpaceship();
  updateAsteroids();

  drawSpaceship();
  drawAsteroids();
  drawScore();

  requestAnimationFrame(gameLoop);
}

// Handle keyboard input
window.addEventListener("keydown", (e) => {
  if (e.code === "ArrowLeft") {
    spaceship.movingLeft = true;
  }
  if (e.code === "ArrowRight") {
    spaceship.movingRight = true;
  }
});

window.addEventListener("keyup", (e) => {
  if (e.code === "ArrowLeft") {
    spaceship.movingLeft = false;
  }
  if (e.code === "ArrowRight") {
    spaceship.movingRight = false;
  }
});

// Start the game
setInterval(createAsteroid, 1000);
gameLoop();
