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
utilisateurs.user_id=commentaires.user_id
INNER JOIN
photos
utilisateurs.user_id=photos.user_id
HAVING photos.photo_id=3;
