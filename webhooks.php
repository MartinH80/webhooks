<?php

if ($_SERVER['REQUEST_METHOD'] !== "GET" ) {
  echo "Only accepting GET requests.";
  http_response_code(405);
  exit(1);
}

if (!isset($_GET['to'])) {
  echo "Missing mandatory argument 'to'.";
  http_response_code(400);
  exit(1);
} else {
  $to = $_GET['to'];
}

if (isset($_GET['subject'])) {
  $subject = $_GET['subject'];
} else {
  $subject = "";
}

if (isset($_GET['message'])) {
  $message = $_GET['message'];
} else {
  $message = "";
}

if (mail($to,$subject,$message)) {
  http_response_code(200);
  exit(0);
} else {
  http_response_code(500);
  exit(1);
}

?>
