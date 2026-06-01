SELECT 
    st.titre, 
    s.pseudo, 
    c.date_debut_autorisee, 
    c.date_fin_autorisee, 
    st.heure_debut, 
    st.heure_fin,
    CASE 
        WHEN st.heure_debut >= c.date_debut_autorisee AND st.heure_fin <= c.date_fin_autorisee 
        THEN 'VALIDE'
        ELSE 'INVALIDE'
    END AS statut_creneau
FROM Stream st
JOIN Streamer s ON st.id_streamer = s.id_streamer
JOIN Creneau c ON st.id_creneau = c.id_creneau;



SELECT 
    st.titre, 
    s.pseudo, 
    st.heure_debut, 
    st.heure_fin
FROM Stream st
JOIN Streamer s ON st.id_streamer = s.id_streamer
JOIN Creneau c ON st.id_creneau = c.id_creneau
WHERE st.heure_debut < c.date_debut_autorisee 
   OR st.heure_fin > c.date_fin_autorisee;


SELECT 
    st.titre, 
    s.pseudo, 
    st.heure_fin, 
    st.date_fin_effective,
    CASE 
        WHEN st.date_fin_effective IS NULL THEN 'EN COURS / INCONNU'
        WHEN st.date_fin_effective > st.heure_fin THEN 'DEPASSEMENT'
        ELSE 'OK'
    END AS statut_fin,
    CASE 
        WHEN st.date_fin_effective > st.heure_fin THEN 
            (EXTRACT(EPOCH FROM (st.date_fin_effective - st.heure_fin)) / 60)
        ELSE 0 
    END AS depassement_minutes
FROM Stream st
JOIN Streamer s ON st.id_streamer = s.id_streamer;



SELECT 
    COUNT(id_stream) AS nombre_retards,
    AVG(EXTRACT(EPOCH FROM (date_fin_effective - heure_fin)) / 60) AS moyenne_retard_minutes
FROM Stream
WHERE date_fin_effective > heure_fin;


SELECT 
    st.titre, 
    s.pseudo,
    
    CASE 
        WHEN st.heure_debut >= c.date_debut_autorisee AND st.heure_fin <= c.date_fin_autorisee 
        THEN 'VALIDE'
        ELSE 'INVALIDE'
    END AS statut_creneau,
    
    CASE 
        WHEN st.date_fin_effective IS NULL THEN 'EN COURS'
        WHEN st.date_fin_effective > st.heure_fin THEN 'DEPASSEMENT'
        ELSE 'OK'
    END AS statut_fin,
    
    CASE 
        WHEN st.date_fin_effective > st.heure_fin THEN 
            (EXTRACT(EPOCH FROM (st.date_fin_effective - st.heure_fin)) / 60)
        ELSE 0 
    END AS depassement_minutes
    
FROM Stream st
JOIN Streamer s ON st.id_streamer = s.id_streamer
JOIN Creneau c ON st.id_creneau = c.id_creneau;