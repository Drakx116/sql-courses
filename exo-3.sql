/*
	1. Récupérer les dates de débuts des réservations de David Farell
	(1 colonne: Dates de début)
	(34 lignes)
*/

SELECT starttime, m.firstname, m.surname
FROM bookings
INNER JOIN members m on m.memid = bookings.memid
WHERE CONCAT(m.firstname, ' ', m.surname) = 'David Farrell';




/*
	2. Déterminer les heures de début des réservations pour des courts
	de tennis 1 et 2, le 21/09/2012.
	(2 colonnes: Heures de début, nom du court)
	(12 lignes)
*/

SELECT starttime FROM bookings
INNER JOIN facilities f on f.facid = bookings.facid
WHERE
    (f.name = 'Tennis Court 1' OR f.name = 'Tennis Court 2')
    AND
    starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59';




/*
	3. Produire une liste de tous les membres qui ont recommandé un autre
	membre.
	(2 colonnes: Prénom, Nom)
	(13 lignes)
*/

SELECT members.firstname, members.surname
FROM members
WHERE members.memid IN (SELECT recommendedby FROM members);




/*
	4. Produire une liste de tous les membres et de leurs parrains
	(4 colonnes: prénom membre, nom membre, prénom parrain, nom parrain)
	(31 lignes)
*/

SELECT members.memid, members.firstname, members.surname
FROM members
WHERE
      recommendedby IS NOT NULL OR recommendedby IS NULL
OR
      members.memid IN (SELECT recommendedby FROM members WHERE recommendedby IS NULL OR recommendedby IS NOT NULL);

/*
	5. Dresser une liste de tous les membres qui ont utilisé le court
	de tennis 1 ou 2
	(2 colonnes: "Nom et Prénom du membre", Nom du court)
	(46 lignes)
*/

/*
	6. Produire une liste des réservations qui ont couté plus de 30$
	le 14/09/2012
	(3 colonnes: "Prénom et Nom du membre", Nom du court, coût de la réservation)
	(18 lignes)
*/

/*
	7. Produire une liste de tous les membres, avec leurs parrains,
	sans utiliser de jointure.
	(2 colonnes: "Prenom et Nom des membres", "Prénom et Nom des parrains")
	(30 lignes)
*/

/*
	8. Idem que 6.,	en utilisant une sous-requête.
	(3 colonnes: "Prénom et Nom du membre", Nom du court, coût)
	(18 lignes)
*/
