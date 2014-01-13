<?php
namespace wcf\data\arma;
use wcf\system\WCF;
use wcf\system\exception\SystemException;


/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @category 	ARMA Server Monitor
 */
 
class Arma {
	
    private $serverID = ARMA_SERVERID;
    private $gameversion = ARMA_GAMEVERSION;
    private $xmlPath = "http://{version}.swec.se/server/xml/{serverID}";
    private $xml = false;
    
    
    
    public function connect() {
        $xmlPath = str_replace('{serverID}',$this->serverID,$this->xmlPath);
        $xmlPath = str_replace('{version}',$this->gameversion,$xmlPath);
        $this->xml = simplexml_load_file($xmlPath);
        if(!$this->xml) {
            return false;
        }
    }
    
    public function getServerInfo() {
        $result = array (
            'hostname' => $this->xml->name,
            'serverAddress' => $this->xml->host,
            'serverPort' => $this->xml->port,
            'version' => $this->xml->version,
            'version_required' => $this->xml->required_version,
            'platform' => $this->xml->platform,
            'status' => $this->xml->state,
            'gamemod' => $this->xml->mod,
            'gamename' => $this->xml->gamename,
            'mission' => $this->xml->mission,
            'mapname' => $this->xml->island,
            'players' => $this->xml->players,
            'maxplayers' => $this->xml->game->max_players,
            'password' => $this->xml->passworded,
            'dedicated' => $this->xml->dedicated,
            'startDate' => $this->xml->game->start
        );
        $result['platform'] = $result['platform'] == "win" ? "Windows" : $result['platform'];
        $tmpDate = new \DateTime($result['startDate']);
        $result['startDate'] = $tmpDate->getTimestamp();
        return $result;
    }
    
    public function getPlayers() {
        $result = array();
        foreach($this->xml->game->players->player as $player) {
            $player = (array) $player;
            if(!$player['disconnect_time']) {
                $result[] = $player;
            }
        }
        return $result;
    }
}
    
