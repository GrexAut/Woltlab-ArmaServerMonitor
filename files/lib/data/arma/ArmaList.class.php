<?php
namespace wcf\data\arma;
use wcf\data\DatabaseObjectList;

/**
 * @author	Gregor Ganglberger
 * @copyright	2013 grexaut.net
 * @license	GNU Lesser General Public License <http://opensource.org/licenses/lgpl-license.php>
 * @package com.grex.wcf.arma
 * @subpackage data.arma
 * @category 	ARMA Server Monitor
 */
class ArmaList extends DatabaseObjectList {
	/**
	 * @see	\wcf\data\DatabaseObjectList::$className
	 */
	public $className = 'wcf\data\arma\Arma';
}
