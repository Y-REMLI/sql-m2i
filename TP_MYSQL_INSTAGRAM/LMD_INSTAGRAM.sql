--4 Pour tous les commentaires, montrer le contenu et le username de l'auteur

SELECT utilisateurs.user_name,commentaire FROM commentaires INNER JOIN utilisateurs ON utilisateurs.user_id=commentaires.user_id; -- limit 5;


--5 Pour chaque commentaire, afficher son contenu et l'url de la photo à laquel le commentaire a été ajouté

SELECT commentaire,url FROM commentaires INNER JOIN photos ON commentaires.photo_id=photos.photo_id LIMIT 20;

--6 Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur


SELECT url,user_name FROM photos INNER JOIN utilisateurs ON utilisateurs.user_id=photos.user_id LIMIT 20;

--7 Trouver tous les commentaires pour la photo d'id 3, avec le username de l'utilisateur qui a commenté
SELECT commentaire, user_name 
FROM 
commentaires 
INNER JOIN 
utilisateurs
ON
utilisateurs.user_id=commentaires.user_id
INNER JOIN
photos
ON
utilisateurs.user_id=photos.user_id
WHERE photos.photo_id=3;

--8 Trouver tous les url des photos ainsi que tous les commentaire qui ont été posté par l'auteur de la photo

SELECT url,commentaire FROM photos 
INNER JOIN commentaires ON commentaires.photo_id=photos.photo_id 
INNER JOIN utilisateurs ON utilisateurs.user_id=commentaires.user_id
GROUP BY user_name;

--9 A l'exercice précedent afficher aussi le nom de l'utilisateur qui a commenté ses propres photos


SELECT url,commentaire,user_name FROM photos 
INNER JOIN commentaires ON commentaires.photo_id=photos.photo_id 
INNER JOIN utilisateurs ON utilisateurs.user_id=commentaires.user_id
GROUP BY user_name;


--10 Le nombre de likes pour la photo d’ID 4

SELECT COUNT(like_id) FROM likes where photo_id=4; 
