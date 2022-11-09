DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;

DROP TABLE IF EXISTS materials;

DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS items;

DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS items_types;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
  id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(32) NOT NULL,
  age INT NOT NULL,
  race VARCHAR(16) NOT NULL,
  gender CHAR(1) NOT NULL,
  class VARCHAR(16) NOT NULL,
  height FLOAT NOT NULL,
  weight FLOAT NOT NULL,
  country CHAR(3) NOT NULL,
  description TEXT
);

INSERT INTO characters (name, age, race, gender, class, height, weight, country, description) VALUES
('Payoh', 64, 'Cambiapieles', 'L', 'Dictador', 1.75, 80, 'RUM', 'Payoh es... un cambiapieles.'),
('Yuca', 27, 'Sirénido', 'F', 'Cryptolai', 0.7, 80, 'PUR', 'Una sirena de puertorrico que trafica con ezereum'),
('Yulen', 70, 'Nomuerto', 'D', 'Minero', 0.8, 25, 'NDE', ''),
('Josema', 3000, 'Deidad', 'T', 'Procrastinador', 3.14, 0, 'PER', 'Es una deidad que deja las cosas pa\' después');


CREATE TABLE stats (
  id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  agility INT NOT NULL,
  hp FLOAT NOT NULL,
  hp_max INT NOT NULL,
  xp FLOAT NOT NULL,
  xp_max INT NOT NULL,
  mp FLOAT NOT NULL,
  mp_max INT NOT NULL,
  `level` INT NOT NULL,
  physic_attack FLOAT NOT NULL,
  magic_attack FLOAT NOT NULL,
  physic_defense FLOAT NOT NULL,
  magic_defense FLOAT NOT NULL,
  stamina INT NOT NULL,
  mana INT NOT NULL,
  intel INT NOT NULL,
  stealth INT NOT NULL,
  luck INT NOT NULL,
  faith INT NOT NULL,
  velocity INT NOT NULL,
  dexterity INT NOT NULL,
  strength INT NOT NULL,
  charisma INT NOT NULL,
  vigor INT NOT NULL,
  tenacity INT NOT NULL,
  critical_rate FLOAT NOT NULL,
  balance FLOAT NOT NULL,
  id_character INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_character) REFERENCES characters(id_character)
);

INSERT INTO stats (agility, hp, hp_max, xp, xp_max, mp, mp_max, level, physic_attack, magic_attack, physic_defense, magic_defense, stamina, mana, intel, stealth, luck, faith, velocity, dexterity, strength, charisma, vigor, tenacity, critical_rate, balance, id_character) VALUES
(900, 950, 0, 820, 0, 300, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(75, 0, 0, 500, 0, 700, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
(1000, 1000, 0, 999, 0, 1000, 0, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4),
(200, 600, 0, 150, 0, 750, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2);


CREATE TABLE weapons_types(
    id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);

INSERT INTO weapons_types (type, description, icon)
VALUES ("Melee", "Cuerpo a cuerpo", "melee.png"),
       ("Range", "Distancia", "range.png"),
       ("Magical", "Magia potagia", "magic.png"),
       ("Divine", "Es divino", "divine.png");


CREATE TABLE weapons (
    id_weapon  INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(24),
    grip INT,
    durability INT,
    distance FLOAT,
    quality INT,
    physic_attack FLOAT,
    physic_defense FLOAT,
    magic_attack FLOAT,
    magic_defense FLOAT,
    description TEXT,
    `level` INT,
    level_min INT,
    id_weapon_type INT UNSIGNED,
    FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);

INSERT INTO weapons (weapon, grip, durability, distance,
	quality, physic_attack, physic_defense, magic_attack,
	magic_defense, description, level, level_min,
	id_weapon_type)
VALUES	("Brazo de bebé", 1, 100, 0.5,
	0, 0, 0, 0,
	0, "", 0, 0,
	1),	
	("Estelada", 1, 1714, 3,
	100, 1, 1, 1,
	1, "Bandera con una estrella :D", 100, 100,
	1),
	("Astrapé", 1, -1, 1000,
	1000, 1, 1, 1,
	30, "El rayo de Zeus", 100, 100,
	2),
	("Espada de Yerba", 1, 900, 3,
	100, 1, 1, 1,
	1, "La mítica espada de YERBA todo el mundo la conoce", 100, 100,
	1);



CREATE TABLE armours_types(
    id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);

INSERT INTO armours_types (type, description, icon)
VALUES ("Peto", "Pa'l pexito", "peto.png"),
("Traje", "Pa'l cuerpesito", "traje.png"),
("Casco", "Pa' la cabesa", "casco.png");


CREATE TABLE armours (
  id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  armour VARCHAR(24) NOT NULL,
  weight FLOAT NOT NULL,
  class VARCHAR(16) NOT NULL,
  magic_defense FLOAT NOT NULL,
  physic_defense FLOAT NOT NULL,
  durability INT NOT NULL,
  `level` INT NOT NULL,
  level_min INT NOT NULL,
  cost FLOAT NOT NULL,
  rarity INT NOT NULL,
  description TEXT,
  notriety INT NOT NULL,
  id_armour_type INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_armour_type) REFERENCES armours_types (id_armour_type)
);
    
INSERT INTO armours (armour, weight, class, magic_defense, physic_defense, durability, level, level_min, cost, rarity, description, notriety, id_armour_type)
VALUES
('Túnica de asesino', 0.5, 'Asesino', 100, 300, 400, 50, 30, 1500, 300, 'Túnica perfecta pa\' que no te vean', 1, 2),
('Kronus de jagged helmet', 30, 'Paladin', 300, 120, -1, 120, 99, -1, 999, 'Casco hecho para dioses', 80, 1);




CREATE TABLE items_types(
    id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(24),
    description TEXT,
    icon VARCHAR(16)
);

INSERT INTO items_types (type, description, icon)
VALUES ("Comida", "alimento rico", "food.png"),
("Poción", "Te cura o te mata o lo que sea", "pocion.png"),
("Tesoro", "$__$", "tesoro.png");




CREATE TABLE materials (
    id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    material VARCHAR(16),
    color CHAR(6),
    cost FLOAT
);

INSERT INTO materials (material, color, cost) 
	VALUES ("Obsidiana", "000000", 40),
    	   ("Madera", "ddeeaa", 10),
           ("Carne", "ffff00", 5),
           ("Pana", "ffdddd", 50),
           ("Goma sagrada", "ffffff", 1000),
           ("Piedra", "cccccc", 1),
           ("Cuero", "ddddaa", 20),
           ("Bandera España", "ESPAÑA", 2030),
           ("Plumas de ángel", "ffffff", 10000),
           ("Materia oscura", "000000", 10000),
           ("Hueso", "dddddd", 10),
           ("Agua", "0000ff", 1),
           ("Lava", "ff0000", 500);
           


CREATE TABLE weapons_materials (
    id_weapon_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_weapon INT UNSIGNED,
    id_material INT UNSIGNED,
    FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon),
    FOREIGN KEY (id_material) REFERENCES materials(id_material)
);

INSERT INTO weapons_materials (id_weapon, id_material)
VALUES (1, 3),(1,11),(2, 7),(2, 8),(3,9),(3,10);




CREATE TABLE armours_materials (
    id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_armour INT UNSIGNED,
    id_material INT UNSIGNED,
    FOREIGN KEY (id_armour) REFERENCES armours(id_armour),
    FOREIGN KEY (id_material) REFERENCES materials(id_material)
);


CREATE TABLE items(
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24),
    consumible BOOLEAN,
    cost FLOAT,
    `key` BOOLEAN,
    rarity INT,
    weight FLOAT,
    `usage` INT,
    fusionable BOOLEAN,
    width FLOAT,
    height FLOAT,
    durability INT,
    description TEXT,
    disassamble BOOLEAN,
    id_item_type INT UNSIGNED,
    FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
);

INSERT INTO items (item, consumible, cost, `key`,
                   rarity, weight, `usage`, fusionable,
                   width, height, durability, description,
                   disassamble, id_item_type)
VALUES ("Queso", true, 40, false,
        3, 20, 1, true,
        0.1, 0.1, 3, "Queso que sabe a beso",
        false, 1),
       ("Carne de zombie", true, 20, false,
        2, 40, 1, true,
        0.3, 0.3, 1, "Esto huele mal",
        false, 1),
       ("Fragmento escarlata", true, 500, false,
        45, 10000, 1, true,
        0.5, 0.25, -1, "Piedra rara de volcán",
        false, 2);
         
         
         
CREATE TABLE characters_weapons (
id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_weapon INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters(id_character),
FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);


INSERT INTO characters_weapons (id_character, id_weapon)
VALUES (1, 1), (4, 3), (4, 1);


         
CREATE TABLE characters_armours (
id_character_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_armour INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters(id_character),
FOREIGN KEY (id_armour) REFERENCES armours(id_armour)
);


CREATE TABLE characters_items (
id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_character INT UNSIGNED,
id_item INT UNSIGNED,
FOREIGN KEY (id_character) REFERENCES characters(id_character),
FOREIGN KEY (id_item) REFERENCES items(id_item)
);


