<?php
require_once 'src/ConnectionInformation.php';

abstract class DbConnection implements ConnectionInformation
{
    protected $database;
    protected $user;
    protected $password;
    protected $hostname;
    protected $port;
    protected $connection = null;


    public function __construct($database, $user, $password, $hostname = 'localhost', $port = 50000)
    {
        $this->database = $database;
        $this->user = $user;
        $this->password = $password;
        $this->hostname = $hostname;
        $this->port = $port;
    }

    public function isLive()
    {
        return (bool)$this->connection;
    }

    public function close()
    {
        $this->connection = null;
    }
}
