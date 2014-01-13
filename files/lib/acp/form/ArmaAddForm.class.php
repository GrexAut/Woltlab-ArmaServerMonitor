<?php
namespace wcf\acp\form;
use wcf\data\arma\ArmaAction;
use wcf\form\AbstractForm;
use wcf\system\WCF;

/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @subpackage wcf.acp
 * @category 	ARMA Server Monitor
 */
class ArmaAddForm extends AbstractForm {
	/**
	 * @see	\wcf\page\AbstractPage::$activeMenuItem
	 */
	public $activeMenuItem = 'wcf.acp.menu.link.community.arma.add';
	public $templateName = 'armaAdd';
	
	// parameters
	public $serverID = '';
        public $serverActive = '';
        public $serverVersion = '';
        public $descr = '';
	
	
	/**
	 * @see Form::readFormParameters()
	 */
	public function readFormParameters() {
		parent::readFormParameters();
		
		if (isset($_POST['serverID'])) $this->serverID = $_POST['serverID'];
		if (isset($_POST['serverVersion'])) $this->serverVersion = $_POST['serverVersion'];
		if (isset($_POST['serverActive'])) $this->serverActive = $_POST['serverActive'];
		if (isset($_POST['descr'])) $this->descr = $_POST['descr'];
	}
	
	/**
	 * @see	\wcf\form\IForm::validate()
	 */
	public function validate() {
		parent::validate();
        }
        
        
	
	/**
	 * @see Form::save()
	 */
	public function save() {
		parent::save();
		
		$this->objectAction = new ArmaAction(array(), 'create', array('data' => array_merge($this->additionalFields, array(
			'serverID' => $this->serverID,
			'serverVersion' => $this->serverVersion,
			'descr' => $this->descr
                    
		))));
		$this->objectAction->executeAction();
                
                $this->saved();
                
                // reset values
                $this->serverID = '';
                $this->serverVersion = '';
                $this->descr = '';
                
		// show success
		WCF::getTPL()->assign(array(
			'success' => true
		));
	}
        
	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
                
		WCF::getTPL()->assign(array(
			'serverActive' => $this->serverActive,
			'serverID' => $this->serverID,
                        'serverVersion' => $this->serverVersion,
                        'descr' => $this->descr,
                        'action' => 'add'
		));
	}
}
?>