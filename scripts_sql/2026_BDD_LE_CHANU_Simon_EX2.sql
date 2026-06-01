-- ============================================
-- 6. Verification des donnees avec SELECT
-- ============================================
SELECT * FROM Streamer;
SELECT * FROM Creneau;
SELECT * FROM Defi;
SELECT * FROM Participation_Defi;
SELECT * FROM Stream;


SELECT pseudo,url_twitch FROM Streamer ORDER BY pseudo;

SELECT * FROM Creneau WHERE Date_debut_autorisee > '2025-09-06 00:00:00' AND Date_fin_autorisee < '2025-09-07 00:00:00';

SELECT * FROM Defi Where montant_palier = 5000 and etat_validation = true;

SELECT * FROM Stream WHERE date_fin_effective IS NULL;