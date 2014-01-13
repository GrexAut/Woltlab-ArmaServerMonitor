<?php
namespace wcf\page;
use wcf\data\arma\arma;
use wcf\system\WCF;


/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @category 	ARMA Server Monitor
 */
 
 
class ArmaPage extends AbstractPage {
	/**
	 * @see	\wcf\page\AbstractPage::$activeMenuItem
	 */
	public $activeMenuItem = 'wcf.page.arma';
        
	/**
	 * @see	\wcf\page\AbstractPage::$neededPermissions
	 */
	public $neededPermissions = array('user.board.arma.canView');
        
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
		
                $server = new Arma();
                $server->connect();
                
                
                WCF::getTPL()->assign(array(
                    'serverInfo' => $server->getServerInfo(),
                    'players' => $server->getPlayers(),
                ));
                
	}
}
