START TRANSACTION;

INSERT INTO couleur (nom) VALUES ('orange');
INSERT INTO couleur (nom) VALUES ('indigo');
INSERT INTO couleur (nom) VALUES ('violet');
INSERT INTO couleur (nom) VALUES ('bleu marine');
INSERT INTO couleur (nom) VALUES ('marron');
UPDATE couleur SET nom = 'grise' WHERE id = 7;
INSERT INTO couleur (nom) VALUES ('rose');
INSERT INTO couleur (nom) VALUES ('ivoire');
INSERT INTO couleur (nom) VALUES ('sable');
INSERT INTO couleur (nom) VALUES ('kaki');

-- COMMIT;
-- ROLLBACK;