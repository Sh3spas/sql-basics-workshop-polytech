SELECT 	s.pseudo,
		c.date_debut_autorisee,
		c.date_fin_autorisee
FROM Streamer s
JOIN Creneau c ON s.id_streamer = c.id_streamer
ORDER BY s.pseudo, date_debut_autorisee;


SELECT st.titre,
		s.pseudo,
		c.date_debut_autorisee,
		c.date_fin_autorisee
FROM Stream st
JOIN Streamer s ON s.id_streamer = st.id_streamer
JOIN Creneau c ON s.id_streamer = c.id_streamer
WHERE st.heure_debut > '2025-09-05' AND  st.date_fin_effective < '2025-09-07';


SELECT * from defi,participation_defi

SELECT 
	d.intitule,
	s.pseudo,
	d.montant_palier
FROM defi d
JOIN participation_defi p ON d.id_defi = p.id_defi
JOIN streamer s ON p.id_streamer = s.id_streamer;