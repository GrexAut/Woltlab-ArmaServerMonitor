DROP TABLE IF EXISTS wcf1_arma_servers;
CREATE TABLE wcf1_arma_servers (
	serverID INT(10) NOT NULL PRIMARY KEY ,
	active SMALLINT(1) DEFAULT 1,
	serverVersion VARCHAR(10) NOT NULL,
	descr TEXT NULL,
	);