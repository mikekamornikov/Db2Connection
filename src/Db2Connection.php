<?php
require_once 'src/DbConnection.php';

class Db2Connection extends DbConnection
{
    public function __construct($database, $user, $password, $hostname = 'localhost', $port = 50000)
    {
        parent::__construct($database, $user, $password, $hostname, $port);

        $connectionString = "DRIVER={IBM DB@ ODBC DRIVER};DATABASE={$this->database};"
            . "HOSTNAME={$this->hostname};PORT={$this->port};PROTOCOL=TCPIP;UID={$this->user};PWD={$this->password}";
        $this->connection = db2_connect($connectionString, '', '');
    }

    public function close()
    {
        if ($this->isLive()) {
            db2_close($this->connection);
            parent::close();
        }
    }
}
