<?php

echo $_SERVER['REQUEST_TIME'];
echo $_SERVER['REMOTE_ADDR'];

if ($_SERVER['REQUEST_METHOD'] !== "GET" ) {
  echo "Only accepting GET requests, exiting.";
  exit(1);
} else {
  echo "Received GET request.";
}

if (isset($_GET['to']) && isset($_GET['subject']) && isset($_GET['message'])) {
  echo "Received the required arguments: to, subject and message.";
  echo "Trying to send mail.";
  $success=mail(urldecode($_GET['to']), urldecode($_GET['subject'],urldecode($_GET['message'])));
  if ($success == false) {
    echo "Sending mail failed.";
    exit(1);
  } else {
    echo "Mail send succesfully.";
  }
} else {
  echo "Missing to, subject and/or message parameters. Arguments must be URL Encoded. Example usage of this script: http://hostname/webhooks.php?to=receiver%40e-mail.com&subject=Test%20alert&message=Alert%20started";
  echo "Exiting.";
  exit(1);
}

exit(0);

?>
