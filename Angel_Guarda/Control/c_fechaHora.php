<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
require_once(__DIR__.'/../../libraries/vendor/autoload.php');
use Bt51\NTP\Socket;
use Bt51\NTP\Client;

class ControladorFechaHora{




    private function isDate($date) {
            $timestamp = strtotime($date);
            return $timestamp ? true : false;
        }




    public function obtenerFechaOnline($timezone = 'America/Caracas'){

        $port=123; //el puerto para obtener la hora, por default es 123 para los ntp

        $servers = [
            'time.google.com',
            'pool.ntp.org',
            'time.windows.com',
            'time.apple.com',
            'ntp.ubuntu.com'
        ];
            
            $errors=[];
            foreach ($servers as $server) {
                try{
                    $socket = new Socket($server,$port);
                    $ntp = new Client($socket);
                    $timeRaw=$ntp->getTime();
                    $timeRaw->setTimezone(new DateTimeZone($timezone));
                    $time=$timeRaw->format('Y-m-d');
                    if($this->isDate($time)){ break; } // si es fecha entonces salirse del
                }

                catch (\Exception $e){ //Si agarra errores los almacena pa mostrarlo despues, potente pa debug supongo
                    $errors[] = $server.': '.$e->getMessage();
                }
            }   
            //max() obtiene el valor mayor de la array assoc, en este caso returnea el que se repitio mas
            

            if(isset($time) && $time){ return $time;} //returnea fuera del while con el resultado
            else{
                return [
                    'error' => true,
                    'Errores al obtener la hora:' => $errors]; //espero no tener q usar esto krajo
            }
    
    }

}

?>