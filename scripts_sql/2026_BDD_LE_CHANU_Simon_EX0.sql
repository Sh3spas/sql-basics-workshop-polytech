CREATE TABLE Streamer (
    id_streamer SERIAL PRIMARY KEY,
    pseudo VARCHAR(255) UNIQUE NOT NULL,
    url_twitch VARCHAR(255)
);

CREATE TABLE Creneau (
    id_creneau SERIAL PRIMARY KEY,
    id_streamer INT NOT NULL,
    date_debut_autorisee TIMESTAMP NOT NULL,
    date_fin_autorisee TIMESTAMP NOT NULL,
    FOREIGN KEY (id_streamer) REFERENCES Streamer(id_streamer) ON DELETE CASCADE
);

CREATE TABLE Stream (
    id_stream SERIAL PRIMARY KEY,
    id_streamer INT NOT NULL,
    id_creneau INT NOT NULL,
    titre VARCHAR(255) NOT NULL,
    heure_debut TIMESTAMP NOT NULL,
    heure_fin TIMESTAMP,
    date_fin_effective TIMESTAMP,
    FOREIGN KEY (id_streamer) REFERENCES Streamer(id_streamer) ON DELETE CASCADE,
    FOREIGN KEY (id_creneau) REFERENCES Creneau(id_creneau) ON DELETE CASCADE
);

CREATE TABLE Defi (
    id_defi SERIAL PRIMARY KEY,
    intitule VARCHAR(255) NOT NULL,
    montant_palier DECIMAL(12,2) NOT NULL,
    etat_validation BOOLEAN DEFAULT FALSE
);

CREATE TABLE Participation_Defi (
    id_streamer INT NOT NULL,
    id_defi INT NOT NULL,
    PRIMARY KEY (id_streamer, id_defi),
    FOREIGN KEY (id_streamer) REFERENCES Streamer(id_streamer) ON DELETE CASCADE,
    FOREIGN KEY (id_defi) REFERENCES Defi(id_defi) ON DELETE CASCADE
);

