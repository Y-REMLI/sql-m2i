

-- Insertion des donnes
INSERT INTO livres (titre,isnb, auteur,prix)VALUES("Forteresse digitale", 2709626306,"Dan Brown",20.5);
INSERT INTO livres (titre,isnb, auteur,prix)VALUES("La jeune fille et la nuit",2253237620,"Guillaume Musso",21.9);
INSERT INTO livres (titre,isnb, auteur,prix)VALUES("T'choupi se brosse les dents",2092589547,"Thierry Courtin",5.7);
INSERT INTO livres (titre,isnb, auteur,prix)VALUES("La Dernière Chasse",2226439412,"Jean-Christophe Grangé",22.9);
INSERT INTO livres (titre,isnb, auteur,prix)VALUES("Le Signal",2226319484,"Maxime Chattam",23.9);

-- 4.Quelle requête utiliser pour sélectionner uniquement les livres qui ont un prix strictement supérieur à 20 de la TABLE

SELECT titre FROM livres WHERE prix>20;

-- 5.Quelle requête utiliser pour trier les enregistrements de la table livres du prix le plus élevé aux prix le plus bas ?

SELECT titre FROM livres ORDER BY prix DESC;

-- 6.Quelle requête utiliser pour récupérer le prix du livre le plus élevé de la table livres ?

SELECT titre, prix FROM livres ORDER BY prix DESC LIMIT 1;

-- 7.Quelle requête utiliser pour récupérer les livres de la table livres qui ont un prix compris entre 20 et 22 ?

SELECT titre,prix FROM livres WHERE prix BETWEEN 20 AND 22;

-- 8.Quelle requête utiliser pour récupérer tous les livres de la table livres à l'exception de celui portant la valeur pour la colonne isbn : 2092589547 ?
-- FAUX
SELECT * FROM livres WHERE isnb NOT IN (20);

-- 9.Quelle requête utiliser pour récupérer le prix du livre le moins élevé de la table livres en renommant la colonne dans les résultats par minus ?

SELECT titre,prix AS minus FROM livres ORDER BY prix LIMIT 1;

-- 10.Quelle requête utiliser pour sélectionner uniquement les 3 premiers résultats sans le tout premier de la table livres ?

SELECT * FROM livres LIMIT 3;

-- 12.Renommer les champs `titre` en `title`, `auteur` en `author` , `prix` en `price`,

ALTER TABLE livres CHANGE COLUMN titre title VARCHAR(50) NOT NULL;
ALTER TABLE livres CHANGE COLUMN auteur author VARCHAR(50) NOT NULL;
ALTER TABLE livres CHANGE COLUMN prix price VARCHAR(50) NOT NULL;
DESC livres


-- 13.Ajouter un champ `published_year` avec une années par défault 2000

ALTER TABLE livres ADD COLUMN published_year VARCHAR(50) ;
UPDATE livres SET published_year="2000";