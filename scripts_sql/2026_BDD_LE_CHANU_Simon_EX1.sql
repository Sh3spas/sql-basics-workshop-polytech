
/* insertion*/

-- ============================================
-- Exercice 1 : Population de la base de donnees
-- ============================================

-- 1. Insertion dans la table Streamer (10 streamers)
INSERT INTO Streamer (pseudo, url_twitch) VALUES
('ZeratoR', 'https://twitch.tv/zerator'),
('AntoineDaniel', 'https://twitch.tv/antoinedaniel'),
('MisterMV', 'https://twitch.tv/mistermv'),
('Ultia', 'https://twitch.tv/ultia'),
('AngleDroit', 'https://twitch.tv/angledroit'),
('Ponce', 'https://twitch.tv/ponce'),
('Rivenzi', 'https://twitch.tv/rivenzi'),
('Domingo', 'https://twitch.tv/domingo'),
('BagheraJones', 'https://twitch.tv/bagherajones'),
('Etoiles', 'https://twitch.tv/etoiles');

-- 2. Insertion dans la table Creneau (2 creneaux par streamer)
INSERT INTO Creneau (id_streamer, date_debut_autorisee, date_fin_autorisee) VALUES
(1, '2025-09-05 18:00:00', '2025-09-06 02:00:00'),
(1, '2025-09-06 14:00:00', '2025-09-06 20:00:00'),
(2, '2025-09-05 18:00:00', '2025-09-06 04:00:00'),
(2, '2025-09-06 16:00:00', '2025-09-06 22:00:00'),
(3, '2025-09-05 20:00:00', '2025-09-06 02:00:00'),
(3, '2025-09-06 10:00:00', '2025-09-06 16:00:00'),
(4, '2025-09-05 19:00:00', '2025-09-06 01:00:00'),
(4, '2025-09-06 12:00:00', '2025-09-06 18:00:00'),
(5, '2025-09-05 18:30:00', '2025-09-06 00:30:00'),
(5, '2025-09-06 11:00:00', '2025-09-06 17:00:00'),
(6, '2025-09-05 18:00:00', '2025-09-06 03:00:00'),
(6, '2025-09-06 15:00:00', '2025-09-06 23:00:00'),
(7, '2025-09-05 18:00:00', '2025-09-06 01:00:00'),
(7, '2025-09-06 09:00:00', '2025-09-06 14:00:00'),
(8, '2025-09-05 20:00:00', '2025-09-06 02:00:00'),
(8, '2025-09-06 20:00:00', '2025-09-07 02:00:00'),
(9, '2025-09-05 18:00:00', '2025-09-06 01:00:00'),
(9, '2025-09-06 13:00:00', '2025-09-06 19:00:00'),
(10, '2025-09-05 21:00:00', '2025-09-06 05:00:00'),
(10, '2025-09-06 21:00:00', '2025-09-07 05:00:00');

-- 3. Insertion dans la table Defi (10 defis varies)
INSERT INTO Defi (intitule, montant_palier, etat_validation) VALUES
('Saut en parachute', 50000.00, FALSE),
('Teinture de cheveux en bleu', 5000.00, TRUE),
('Jeu d horreur en VR', 10000.00, FALSE),
('Degustation piments', 2000.00, TRUE),
('Live cuisine qui tourne mal', 15000.00, FALSE),
('Creation de musique en direct', 8000.00, TRUE),
('Tournoi Mario Kart punitif', 25000.00, FALSE),
('Marathon speedrun', 30000.00, FALSE),
('Appel a un proche malaise', 1000.00, TRUE),
('Tatouage ZEvent', 100000.00, FALSE);

-- 4. Insertion dans la table Participation_Defi (15 lignes, defis solos et collectifs)
INSERT INTO Participation_Defi (id_streamer, id_defi) VALUES
(1, 1), (1, 10),     -- ZeratoR (Parachute, Tatouage)
(2, 3), (2, 4),      -- AntoineDaniel (VR, Piments)
(3, 8), (3, 6),      -- MisterMV (Speedrun, Musique)
(4, 5),              -- Ultia (Cuisine)
(5, 5), (5, 9),      -- AngleDroit (Cuisine - en groupe avec Ultia, Appel)
(6, 7), (6, 2),      -- Ponce (Mario Kart, Teinture)
(7, 7), (7, 1),      -- Rivenzi (Mario Kart - en groupe avec Ponce, Parachute - groupe avec ZeratoR)
(8, 7),              -- Domingo (Mario Kart - en groupe avec Ponce/Rivenzi)
(9, 3), (9, 2),      -- BagheraJones (VR - en groupe avec AD, Teinture - groupe avec Ponce)
(10, 8), (10, 10);   -- Etoiles (Speedrun - groupe avec MV, Tatouage - groupe avec ZeratoR)

-- 5. Insertion dans la table Stream (11 streams)
-- NOTE : La redondance id_streamer / id_creneau est respectee par rapport au schema.
-- Les NULL dans date_fin_effective simulent les streams non termines.
INSERT INTO Stream (id_streamer, id_creneau, titre, heure_debut, heure_fin, date_fin_effective) VALUES
-- ZeratoR - Creneau 1
(1, 1, 'Lancement officiel ZEvent', '2025-09-05 18:00:00', '2025-09-06 01:30:00', '2025-09-06 01:45:00'),
-- ZeratoR - Creneau 2 (Non termine)
(1, 2, 'On fait le point sur les dons', '2025-09-06 14:15:00', '2025-09-06 19:45:00', NULL),
-- AntoineDaniel - Creneau 3
(2, 3, 'Geoguessr de l extreme', '2025-09-05 18:30:00', '2025-09-06 03:00:00', '2025-09-06 03:10:00'),
-- MisterMV - Creneau 5
(3, 5, 'Vieux jeux et vieilles aigreurs', '2025-09-05 20:15:00', '2025-09-06 01:45:00', '2025-09-06 01:30:00'),
-- Ultia - Creneau 7
(4, 7, 'Les Sims font un don', '2025-09-05 19:00:00', '2025-09-06 00:30:00', '2025-09-06 01:05:00'),
-- AngleDroit - Creneau 9
(5, 9, 'Tribunal des dons', '2025-09-05 18:30:00', '2025-09-06 00:00:00', '2025-09-06 00:00:00'),
-- Ponce - Creneau 11 (Non termine)
(6, 11, 'Mario Kart avec les copains', '2025-09-05 18:00:00', '2025-09-06 02:00:00', NULL),
-- Rivenzi - Creneau 13
(7, 13, 'Histoire du ZEvent', '2025-09-05 18:00:00', '2025-09-06 00:45:00', '2025-09-06 00:50:00'),
-- Domingo - Creneau 15
(8, 15, 'Popcorn version ZEvent', '2025-09-05 20:00:00', '2025-09-06 01:30:00', '2025-09-06 01:40:00'),
-- BagheraJones - Creneau 17 (Non termine)
(9, 17, 'Je crie sur des jeux', '2025-09-05 18:00:00', '2025-09-06 00:30:00', NULL),
-- Etoiles - Creneau 19 (Non termine)
(10, 19, 'Nuit de la culture', '2025-09-05 21:00:00', '2025-09-06 04:30:00', NULL);
