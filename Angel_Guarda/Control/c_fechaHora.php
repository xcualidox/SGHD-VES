<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING);
require_once(__DIR__.'/../../libraries/vendor/autoload.php');
use Bt51\NTP\Socket;
use Bt51\NTP\Client;

class ControladorFechaHora{

    public function obtenerFechaOnline($maxRetries = 2, $timezone = 'America/Caracas', $tries = 0){ //tries=intentos, maxRetries = maximos reintentos

        $port=123; //el puerto para obtener la hora, por default es 123 para los ntp

        $servers = [
            'time.google.com',
            'pool.ntp.org',
            'time.windows.com',
            'time.apple.com',
            'ntp.ubuntu.com'
        ];

        while($tries<$maxRetries){ //mientras los intentos sean menores a la cantidad maxima de reintentos
            
            $times=[];
            $errors=[];
            foreach ($servers as $server) {
                try{
                    $socket = new Socket($server,$port);
                    $ntp = new Client($socket);
                    $timeRaw=$ntp->getTime();
                    $timeRaw->setTimezone(new DateTimeZone($timezone));
                    $times[]=$timeRaw->format('Y-m-d');
                }

                catch (\Exception $e){ //Si agarra errores los almacena pa mostrarlo despues, potente pa debug supongo
                    $errors[] = $server.': '.$e->getMessage();
                }
            }

            $countedTimes=array_count_values($times);
            $numServers = count($servers);
            //max() obtiene el valor mayor de la array assoc, en este caso returnea el que se repitio mas
            if (count($countedTimes)> 0) {$maxCount = max($countedTimes);} 
            else{$maxCount = 0;}
            

            if($maxCount > $numServers/2){
                return array_keys($countedTimes, $maxCount)[0]; //returnea fuera del while con el resultado
            }
            
            ++$tries; //si no returneó nada pues que siga intentando
        }
    
        return [
            'error' => true,
            'Errores al obtener la hora:' => $errors]; //espero no tener q usar esto krajo
    }

}

?>