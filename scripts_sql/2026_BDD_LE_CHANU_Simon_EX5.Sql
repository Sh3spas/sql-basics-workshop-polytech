SELECT * FROM defi


UPDATE defi 
SET montant_palier = montant_palier * 1.10
WHERE intitule = 'Saut en parachute'


UPDATE defi
SET etat_validation = TRUE
WHERE etat_validation = FALSE 
	AND id_defi IN (
		SELECT id_defi
		FROM participation_defi
		GROUP BY id_defi
		HAVING COUNT(id_streamer) >= 3
	);



SELECT * FROM stream WHERE date_fin_effective IS NULL;

DELETE FROM stream WHERE date_fin_effective IS NULL;


SELECT * FROM creneau WHERE date_fin_autorisee < CURRENT_DATE;

DELETE FROM creneau WHERE date_fin_autorisee < CURRENT_DATE;