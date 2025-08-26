/*
#Exercice 0 : Connection à la base de donnée
*/

mariadb -u root -p
USE mydatabase




/*
#Exercice 1 : Création d une base de données et de tables

    Créez une table nommée client avec les champs suivants :

    Id(clé primaire).
    Nom.
    Prénom.
    Adresse email.
    Date d inscription.

    Insérez 2 clients dans la table pour tester.
    
*/

CREATE TABLE customer(
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    email VARCHAR(100),
    registration_date Date
);

SHOW TABLES;

INSERT INTO `customer` (`last_name`, `first_name`, `email`, `registration_date`)
VALUES ('Un', 'A', 'Un.A@mail', '2019-08-20'),
('Deux', 'B', 'Deux.B@mail', '2016-02-02');

SELECT * FROM `customer`

ALTER TABLE `customer`
CHANGE `first_name` `prenom` VARCHAR(100);

ALTER TABLE `customer`
CHANGE `prenom` `first_name` VARCHAR(100);




/*
#Exercice 2 : Création d'une base de données et de tables

    Créez une table nommée commande avec les champs suivants :
        Id (clé primaire).
        Id_client (clé étrangère).
        Date de la commande.
        Montant total.

    Insérez quelques valeurs dans la tables commande pour tester la configuration.
    Afficher toutes les commandes du client avec l'id 1
*/

CREATE TABLE `order` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `id_customer` INT,
    `date` Date, 
    `total` FLOAT,
    FOREIGN KEY (id_customer) REFERENCES customer(id)
);

SHOW TABLES;

INSERT INTO `order` (`id_customer`,`date`,`total`)
VALUES( 1,'2025-07-12',22.5),(2 ,'2025-04-24',11);

SELECT * FROM `order`;

SELECT *
FROM `customer`
INNER JOIN `order` ON `customer`.`id` = `order`.`id_customer`;
WHERE `customer`.`id` = 1;







