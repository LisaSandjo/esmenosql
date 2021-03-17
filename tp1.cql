EXERCICE 1

QUESTION 1: 

// Etape 1 create keyspace
CREATE KEYSPACE elections WITH replication = {'class' : 'SimpleStrategy', 'replication_factor' : 1};

//Creation des tables 

CREATE TABLE ADMINISTRE (
	NOM_A text PRIMARY KEY,
	PRENOM_A text,
	ADRESSE text,
	NIN varint 

);

CREATE TABLE CANDIDAT(
	NOM_P text,
	PRENOM_P text,
	PARTI_POLITIQUE text,
  NBR_VOTE int,
  PRIMARY KEY (PARTI_POLITIQUE, NBR_VOTE, NOM_P)
  
);


CREATE TABLE VOTE(
	NOM_A text,
	NOM_P text,
	PRIMARY KEY(NOM_A, NOM_P)
);



// Creer des candidats 

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote ) VALUES ('toto1' , 'tôt', 'A' , 42 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote ) VALUES ('toto2', 'tôt2', 'B' , 31 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote ) VALUES ('toto3' , 'tôt3', 'C' , 24 );

INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote ) VALUES ('toto4' , 'tôt4', 'A' , 65 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_politique , nbr_vote ) VALUES ('titi1' , 'tôt', 'A' , 32 );
INSERT INTO Candidat (Nom_P , Prenom_P , Parti_Politique , nbr_vote ) VALUES ('titi2', 'tôt2', 'B' , 21 );





// Creer des administres

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Martin', 'Matin', '90 rue des etoiles 34000', 4);
INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Michelle', 'Jacques', '17 rue de la fontaine 23450', 6);
INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Guigui', 'Lucienne', '56 rue du faubourg 78900', 2);

INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Boun', 'Dany', '87 rue de la joie 87654', 9);
INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Joud', 'Jas', '6 rue de la chaud 12678', 1);
INSERT INTO ADMINISTRE (NOM_A, PRENOM_A, ADRESSE, NIN)VALUES ('Nouille', 'Chine', '9 rue du passage 75900', 3);

// CREER DES VOTES

INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Martin', 'toto1');
INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Guigui', 'toto2');
INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Boun', 'toto3');

INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Michelle', 'toto4');
INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Joud', 'titi1');
INSERT INTO VOTE (NOM_A, NOM_P)VALUES ('Nouille', 'titi2');


 QUESTION 1 :

// Affiche le tableau du nombre de votes par parti politique classé
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le plus de vote (sachant qu'ici c'est A)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='A' ALLOW FILTERING;



QUESTION 2 
SELECT NOM_P, PARTI_POLITIQUE, NBR_VOTE FROM CANDIDAT ORDER BY NBR_VOTE DESC;

QUESTION 3: 

// On sait que le parti politique qui a le plus de voix est 

SELECT NOM_P, SUM(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='A';
SELECT MAX(NOM_P) FROM VOTE GROUP BY NOM_P;



Exercice 2

Question 1:

CREATE TABLE gagnant_candidat (
    Nom_P text ,
    Prenom_P text,
    Parti_politique text,
    nbr_vote int,
    commune text,
    PRIMARY KEY (parti_politique,nbr_vote);
  
  
// Affiche le tableau du nombre de votes par parti politique
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le plus de vote (ici A)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='A' ALLOW FILTERING;

Question 2: 
// Affiche le tableau du nombre de votes par parti politique
SELECT  PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT GROUP BY PARTI_POLITIQUE;

// Affiche le nom du parti politique qui a eu le plus de vote (ici C)
SELECT PARTI_POLITIQUE, SUM(NBR_VOTE) FROM CANDIDAT WHERE PARTI_POLITIQUE='C' ALLOW FILTERING;
