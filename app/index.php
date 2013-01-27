<?php
require_once 'bootstrap.php';
require_once 'src/Db2Connection.php';

$connection = new Db2Connection('SUGARULT', 'db2inst1', 'db2inst1');

echo PHP_EOL;
if ($connection->isLive()) {
    echo 'Connection succeeded.';
    $connection->close();
} else {
    echo 'Connection failed.';
}
echo PHP_EOL;
