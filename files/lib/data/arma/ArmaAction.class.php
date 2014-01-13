<?php

namespace wcf\data\arma;

use wcf\data\AbstractDatabaseObjectAction;
use wcf\data\IToggleAction;
use wcf\system\database\util\PreparedStatementConditionBuilder;
use wcf\system\WCF;

/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @subpackage data.arma
 * @category 	ARMA Server Monitor
 */
class ArmaAction extends AbstractDatabaseObjectAction implements IToggleAction {

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$className
     */
    protected $className = 'wcf\data\arma\ArmaEditor';

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsDelete
     */
    protected $permissionsDelete = array('admin.community.arma.canDelete');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$permissionsUpdate
     */
    protected $permissionsUpdate = array('admin.community.arma.canEdit');

    /**
     * @see	\wcf\data\AbstractDatabaseObjectAction::$requireACP
     */
    protected $requireACP = array('delete', 'toggle', 'update');


    /**
     * @see	\wcf\data\IToggleAction::validateToggle()
     */
    public function validateToggle() {
        parent::validateUpdate();
    }

    /**
     * @see	\wcf\data\IToggleAction::toggle()
     */
    public function toggle() {
        foreach ($this->objects as $minecraft) {
            $minecraft->update(array(
                'active' => $minecraft->active ? 0 : 1
            ));
        }
    }

}
