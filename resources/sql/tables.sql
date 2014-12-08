CREATE TABLE IF NOT EXISTS flash_cards (
	flash_card_id INT AUTO_INCREMENT NOT NULL,
	deck_id INT NOT NULL,
	front TEXT,
	back TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS decks (
	id INT AUTO_INCREMENT NOT NULL,
	edit_id varchar(255),
	nickname VARCHAR(255),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT NOT NULL,
	username varchar(30) NOT NULL,
	password varchar(30) NOT NULL,
	email varchar(255),
	PRIMARY KEY (id)
);


-- TODO: foreign key constraints
