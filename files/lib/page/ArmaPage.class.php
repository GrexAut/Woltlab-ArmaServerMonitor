<?php
namespace wcf\page;
use wcf\data\arma\Arma;
use wcf\system\WCF;


/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @category 	ARMA Server Monitor
 */
 
 
class ArmaPage extends AbstractPage {
	public $activeMenuItem = 'wcf.page.arma';
        
	public $neededPermissions = array('user.board.arma.canView');
        
        public $className = 'wcf\data\arma\Arma';
        
	/**
	 * @see	\wcf\page\IPage::readParameters()
	 */
	public function readParameters() {
		parent::readParameters();

	}

	/**
	 * @see	\wcf\page\IPage::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
                
                $servers = $this->getActiveServers();
                foreach($servers as $server) {
                    $server = (object) $server;
                    $arma = new Arma($server->serverID);
                    $arma->connect($server->serverID,$server->serverVersion);
                    $servers[$server->serverID]['serverInfo'] = $arma->getServerInfo();
                    $servers[$server->serverID]['players'] = $servers[$server->serverID]['serverInfo']['status'] == "playing" ? $arma->getPlayers() : false;
                    $arma->disconnect();
                }
                WCF::getTPL()->assign(array(
                    'servers' => $servers
                ));
                
	}
        
        
        
        public function getActiveServers() {
            $result = array();
            $sql = "SELECT	*
                    FROM	wcf".WCF_N."_arma_servers
                    WHERE	active = 1";
            $statement = WCF::getDB()->prepareStatement($sql);
            $statement->execute();
            while($row = $statement->fetchArray()) {
                $result[$row['serverID']] = $row;
            }
            return $result;
        }
}
