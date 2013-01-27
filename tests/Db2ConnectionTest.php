<?php
require_once 'src/ConnectionInformation.php';
require_once 'src/DbConnection.php';
require_once 'src/Db2Connection.php';

class Db2ConnectionTest extends PHPUnit_Framework_TestCase
{
    public function testInstanceOfDbConnection()
    {
        $this->assertInstanceOf('DbConnection', new Db2Connection('', '', ''));
    }

    public function testInstanceOfConnectionInformation()
    {
        $this->assertInstanceOf('ConnectionInformation', new Db2Connection('', '', ''));
    }

    public function isLiveProvider()
    {
        return array(
            array('', '', '', false),
            array('SUGARULT', 'db2inst1', 'db2inst1', true),
        );
    }

    /**
     * @dataProvider isLiveProvider
     */
    public function testIsLive($database, $user, $password, $expected)
    {
        $connection = new Db2Connection($database, $user, $password);
        $this->assertEquals($expected, $connection->isLive());
    }

    /**
     * @dataProvider isLiveProvider
     */
    public function testClose($database, $user, $password)
    {
        $connection = new Db2Connection($database, $user, $password);
        $connection->close();
        $this->assertFalse($connection->isLive());
    }
}
