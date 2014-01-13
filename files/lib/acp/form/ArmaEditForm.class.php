<?php
namespace wcf\acp\form;
use wcf\data\arma\Arma;
use wcf\data\arma\ArmaAction;
use wcf\form\AbstractForm;
use wcf\system\exception\IllegalLinkException;
use wcf\system\WCF;
/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @subpackage wcf.acp
 * @category 	ARMA Server Monitor
 */
class ArmaEditForm extends ArmaAddForm {
	/**
	 * @see	\wcf\page\AbstractPage::$activeMenuItem
	 */
	public $activeMenuItem = 'wcf.acp.menu.link.arma';
	
	/**
	 * @see	\wcf\page\AbstractPage::$neededPermissions
	 */
//	public $neededPermissions = array('admin.content.bbcode.canManageBBCode');
	
	/**
	 * bbcode id
	 * @var	integer
	 */
	public $serverID = 0;
	
	public $arma = null;

        
        
	/**
	 * @see	\wcf\page\IPage::readParameters()
	 */
	public function readParameters() {
		AbstractForm::readParameters();
		
		if (isset($_REQUEST['id'])) $this->serverID = intval($_REQUEST['id']);
		$this->arma = new Arma($this->serverID);
		if (!$this->arma->serverID) {
			throw new IllegalLinkException();
		}
	}
	

	
	/**
	 * @see Form::validate()
	 */
	public function save() {
		AbstractForm::save();
		
		// update
                $this->objectAction = new ArmaAction(array($this->serverID), 'update', array('data' => array_merge($this->additionalFields, array(
			'serverID' => $this->serverID,
			'serverVersion' => $this->serverVersion,
			'descr' => $this->descr
                ))));
                $this->objectAction->executeAction();
                
		$this->saved();

                // show success message
		WCF::getTPL()->assign(array(
			'success' => true
		));
                
	}
	
	/**
	 * @see Page::readData()
	 */
	public function readData() {
		parent::readData();
		
		if (empty($_POST)) {
			// default value
			$this->serverID = $this->arma->serverID;
			$this->serverVersion = $this->arma->serverVersion;
			$this->descr = $this->arma->descr;
		}
	}
        
	
	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		WCF::getTPL()->assign(array(
                    'arma' => $this->arma,
                    'action'    => 'edit'
		));
	}
}
?>