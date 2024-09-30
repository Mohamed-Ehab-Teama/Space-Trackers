<?php

require_once './connection.php';


if ($_SESSION['login'] != true) {
  header('location:login.php');
  exit();
}



$name = $_SESSION['username'];
$email = $_SESSION['email'];


?>





<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>3D Solar System</title>
  <link rel="stylesheet" href="./css/solar-system.css">
  <link rel="icon" href="./images/logo.png">
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
    crossorigin="anonymous" />
</head>

<body class="opening hide-UI view-2D zoom-large data-close controls-close">



  <!-- Nav Bar -->
  <div id="navbar">
    <a id="toggle-data" href="#data"><i class="icon-data"></i>Data</a>
    <h1>
      3D Solar System<br />
    </h1>
    <a id="toggle-controls" href="#controls"><i class="icon-controls"></i>Controls</a>
  </div>
  <div id="data">
    <a class="sun" title="sun" href="#sunspeed">Sun</a>
    <a class="mercury" title="mercury" href="#mercuryspeed">Mercury</a>
    <a class="venus" title="venus" href="#venusspeed">Venus</a>
    <a class="earth active" title="earth" href="#earthspeed">Earth</a>
    <a class="mars" title="mars" href="#marsspeed">Mars</a>
    <a class="jupiter" title="jupiter" href="#jupiterspeed">Jupiter</a>
    <a class="saturn" title="saturn" href="#saturnspeed">Saturn</a>
    <a class="uranus" title="uranus" href="#uranusspeed">Uranus</a>
    <a class="neptune" title="neptune" href="#neptunespeed">Neptune</a>
  </div>
  <div id="controls">
    <label class="set-view">
      <input type="checkbox" />
    </label>
    <label class="set-zoom">
      <input type="checkbox" />
    </label>
    <label>
      <input type="radio" class="set-speed" name="scale" checked />
      <span>Speed</span>
    </label>
    <label>
      <input type="radio" class="set-size" name="scale" />
      <span>Size</span>
    </label>
    <label>
      <input type="radio" class="set-distance" name="scale" />
      <span>Distance</span>
    </label>
  </div>
  <div id="universe" class="scale-stretched">
    <div id="galaxy">
      <div id="solar-system" class="earth">
        <div id="mercury" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Mercury</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="venus" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Venus</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="earth" class="orbit">
          <div class="pos">
            <div class="orbit">
              <div class="pos">
                <div class="moon"></div>
              </div>
            </div>
            <div class="planet">
              <dl class="infos">
                <dt>Earth</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="mars" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Mars</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="jupiter" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Jupiter</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="saturn" class="orbit">
          <div class="pos">
            <div class="planet">
              <div class="ring"></div>
              <dl class="infos">
                <dt>Saturn</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="uranus" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Uranus</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="neptune" class="orbit">
          <div class="pos">
            <div class="planet">
              <dl class="infos">
                <dt>Neptune</dt>
                <dd><span></span></dd>
              </dl>
            </div>
          </div>
        </div>
        <div id="sun">
          <dl class="infos">
            <dt>Sun</dt>
            <dd><span></span></dd>
          </dl>
        </div>
      </div>
    </div>
  </div>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
  <script type="text/javascript">
    if (typeof jQuery == "undefined") {
      document.write(
        unescape(
          "%3Cscript src='js/jquery.min.js' type='text/javascript'%3E%3C/script%3E"
        )
      );
    }
  </script>
  <!-- <script src="js/prefixfree.min.js"></script>
    <script src="js/scripts.min.js"></script> -->
  <script src="./js/home.js"></script>
  <!-- <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script> -->
</body>

</html>