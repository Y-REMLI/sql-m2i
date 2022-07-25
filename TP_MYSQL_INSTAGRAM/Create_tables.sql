-- create database

CREATE DATABASE TP_MySQL_LDD

-- Create table "Utilisateurs"
 CREATE TABLE utilisateurs(
    user_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    avatar VARCHAR(50) NOT NULL,
    bio VARCHAR(500) NOT NULL,
    UNIQUE (user_name)
 );

-- Create table Photos
CREATE TABLE photos(
    photo_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    url VARCHAR(500) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES utilisateurs(user_id)
);

--Create table Commentaire

CREATE TABLE commentaires(
    commentaire_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    commentaire VARCHAR(500) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES utilisateurs(user_id),
    FOREIGN KEY (photo_id) REFERENCES photos(photo_id)
);

--CREATE table likes

CREATE TABLE likes(
    like_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    photo_id INT,
    commentaire_id INT, -- pet etre NULL si le like est pour une photo rst non un commentaire
    like_NoLike BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES utilisateurs(user_id),
    FOREIGN KEY (photo_id) REFERENCES photos(photo_id),
    FOREIGN KEY (commentaire_id) REFERENCES commentaires(commentaire_id)

);
