--Creation d'une requette pour avoir les informations des usagers
CREATE TABLE IF NOT EXISTS analyse_usagers AS
SELECT
	c.id_usager,
	c.catu,
	c.an_nais,
	cir.grav,
	cir.trajet,
	cir.etatp,
	(2022 - c.an_nais) AS age
FROM catego_usagers c
	LEFT JOIN circonstances cir ON c.id_usager = cir.id_usager
	--WHERE cir.grav <> '-1' AND (cir.trajet <> '-1' AND cir.trajet <> '0') AND cir.etatp <> '-1'

--Creation d'une requette pour avoir les informations sur la table circonstance
CREATE TABLE IF NOT EXISTS analyse_circ AS
SELECT 
	cir.num_acc,
	cir.id_usager,
	cir.grav,
	cir.trajet,
	l.catr,
	l.circ
FROM circonstances cir
	LEFT JOIN lieux l ON cir.num_acc = l.num_acc

--création requette pour avoir les informations de la table caractéristiques
CREATE TABLE IF NOT EXISTS analyse_cara AS 
SELECT
	l.num_acc,
	l.surf,
	l.situ,
	l.vma,
	car.dep,
	car.com,
	car.agg,
	car.calen_id,
	car.atm
FROM lieux l
	LEFT JOIN caracteristiques car ON l.num_acc = car.accident_id

SELECT * FROM analyse_cara


SELECT COUNT(*) FROM circonstances
SELECT * FROM circonstances
SELECT * FROM caracteristiques
SELECT COUNT(*) FROM caracteristiques

SELECT count(*) FROM vehicules
SELECT count(*) FROM lieux
SELECT * FROM lieux

SELECT * FROM catego_usagers

SELECT * FROM calendrier 

--vérifions s'il y'a des valeurs aberrantes
SELECT 
	catu, sexe, 
COUNT(*) 
FROM catego_usagers
	WHERE sexe <> '-1'
GROUP BY 
	catu, sexe


SELECT 
	grav,
	trajet,
	etatp,
COUNT(*)
FROM circonstances
	WHERE grav <> '-1' AND (trajet <> '-1' AND trajet <> '0') AND etatp <> '-1'
GROUP BY
	grav,
	trajet,
	etatp

SELECT grav, trajet, COUNT(*) FROM circonstances GROUP BY grav, trajet 

SELECT accident_id FROM caracteristiques

select
	situ, 
count(*) 
from lieux 
	WHERE situ <> '-1'
group by 
	situ









