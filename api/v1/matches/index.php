<?php
header('Content-Type: application/json');

$number = $_GET['number'];
echo passthru("ruby app.rb $number");
?>
