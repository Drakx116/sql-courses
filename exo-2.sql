-- 1. Comment récupérer toutes les infos de facilities ?

SELECT * FROM facility;

--  2. Récupérer la liste des equipements(facilities) et leur coût pour les membres

SELECT name, member_cost FROM facility;

-- 3. Récupérer la liste des équipements qui appliquent des frais aux membres

SELECT name FROM facility WHERE member_cost > 0;

/* 4. Récupérer la liste des équipements qui font payer
      des frais aux membre inférieurs à 1/50e
      du coût d'entretien mensuel.
      Ne renvoyer que facid, le nom de l'equipement,
      le coût des membres et le coût d'entretien
 */

SELECT id, name, member_cost, monthly_maintenance
FROM facility
WHERE (member_cost < monthly_maintenance / 50);

-- 5. Renvoyer la liste des equipements contenant le mot "tennis" dans leur nom

SELECT name FROM facility
WHERE LOWER(name)
          LIKE '%tennis%';

-- 6. Renvoyer les données des équipements d'id 1 et 5, sans utiliser le mot clé "OR"

SELECT * FROM facility
WHERE id IN (1, 5);

/* 7. Renvoyer la liste des noms des équipements et une colonne "cost"
      qui contient "cheap" quand le cout de maintenance est < 100
      et "expensive" dans les autres cas /
 */

 SELECT name, (
    CASE
        WHEN monthly_maintenance < 100 THEN 'cheap'
        ELSE 'expensive'
     END
 ) as cost
 FROM facility;

/* 8. Renvoyer les "memid", "surname", "firstname" et "joindate" des membres inscrit apres le debut de septembre 2012 */

SELECT id, first_name, last_name, join_date
FROM member
WHERE join_date >= '2012-09-01';

-- 9. Créer une liste ordonnée des 10 premiers prénom des membres (ordre alphabétique)

SELECT DISTINCT(first_name)
FROM member
ORDER BY first_name
LIMIT 10;

-- 10 Créer une liste d'une seule colonne contenant d'abord les noms des equipements, puis les prénoms des membres /

SELECT name
FROM facility
UNION ALL
SELECT first_name
FROM member;

-- 11 Renvoyer uniquement la date d'inscription du dernier membre

SELECT join_date
FROM member
ORDER BY id DESC
LIMIT 1;

-- 12 Pareil que le (11) mais avec le prenom et le nom de ce membre

SELECT first_name, last_name  FROM member
ORDER BY id DESC
LIMIT 1;
