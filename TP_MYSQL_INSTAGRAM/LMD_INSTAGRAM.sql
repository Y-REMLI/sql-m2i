--4 Pour tous les commentaires, montrer le contenu et le username de l'auteur

SELECT utilisateurs.user_name,commentaire FROM commentaires INNER JOIN utilisateurs ON utilisateurs.user_id=commentaires.user_id; -- limit 5;


--5 Pour chaque commentaire, afficher son contenu et l'url de la photo à laquel le commentaire a été ajouté

SELECT commentaire,url FROM commentaires INNER JOIN photos ON commentaires.photo_id=photos.photo_id LIMIT 20;

--6 Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur


SELECT url,user_name FROM photos INNER JOIN utilisateurs ON utilisateurs.user_id=photos.user_id LIMIT 20;
