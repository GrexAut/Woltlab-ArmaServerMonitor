<?php
namespace wcf\acp\page;
use wcf\page\SortablePage;

/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @category 	ARMA Server Monitor
 */
class ArmaListPage extends SortablePage {
    public $templateName = 'armaList';
    public $defaultSortField = 'serverID';
    public $objectListClassName = 'wcf\data\arma\ArmaList';
    public $activeMenuItem = 'wcf.acp.menu.link.community.arma.list';
}
?>