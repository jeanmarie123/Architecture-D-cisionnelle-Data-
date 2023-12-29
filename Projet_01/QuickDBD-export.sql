-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "circonstance" (
    "Num_Acc" varchar(20)   NOT NULL,
    "id_vehicule" varchar(10)   NOT NULL,
    "id_usager" varchar(15)   NOT NULL,
    "num_veh" varchar(5)   NOT NULL,
    "place" int   NOT NULL,
    "grav" text   NOT NULL,
    "trajet" text   NOT NULL,
    "secu1" text   NOT NULL,
    "etatp" text   NOT NULL
);

CREATE TABLE "catego_usagers" (
    "id_usager" varchar(15)   NOT NULL,
    "sexe" varchar(5)   NOT NULL,
    "an_nais" int   NOT NULL,
    "catu" text   NOT NULL,
    CONSTRAINT "pk_catego_usages" PRIMARY KEY (
        "id_usager"
     )
);

CREATE TABLE "lieux" (
    "Num_Acc" varchar(20)   NOT NULL,
    "catr" text   NOT NULL,
    "voie" text   NOT NULL,
    "v2" text   NOT NULL,
    "circ" text   NOT NULL,
    "nbv" text   NOT NULL,
    "lartpc" text   NOT NULL,
    "surf" text   NOT NULL,
    "situ" text   NOT NULL,
    "vma" int   NOT NULL,
    CONSTRAINT "pk_lieux" PRIMARY KEY (
        "Num_Acc"
     )
);

CREATE TABLE "vehicules" (
    "Num_Acc" varchar(20)   NOT NULL,
    "id_vehicule" varchar(10)   NOT NULL,
    "num_veh" varchar(5)   NOT NULL,
    "catv" text   NOT NULL,
    "motor" text   NOT NULL,
    CONSTRAINT "pk_vehicules" PRIMARY KEY (
        "id_vehicule"
     )
);

CREATE TABLE "caracteristiques" (
    "Accident_Id" varchar(20)   NOT NULL,
    "lum" text   NOT NULL,
    "dep" int   NOT NULL,
    "com" int   NOT NULL,
    "agg" text   NOT NULL,
    "int" int   NOT NULL,
    "atm" text   NOT NULL,
    "col" text   NOT NULL,
    "adr" tex   NOT NULL,
    CONSTRAINT "pk_caracteristiques" PRIMARY KEY (
        "Accident_Id"
     )
);

CREATE TABLE "calendrier" (
    "calen_id" int   NOT NULL,
    "jour" int   NOT NULL,
    "mois" int   NOT NULL,
    "an" int   NOT NULL,
    "hrmn" time   NOT NULL,
    CONSTRAINT "pk_calendrier" PRIMARY KEY (
        "calen_id"
     )
);

ALTER TABLE "catego_usages" ADD CONSTRAINT "fk_catego_usages_id_usager" FOREIGN KEY("id_usager")
REFERENCES "circonstance" ("id_usager");

ALTER TABLE "lieux" ADD CONSTRAINT "fk_lieux_Num_Acc" FOREIGN KEY("Num_Acc")
REFERENCES "circonstance" ("Num_Acc");

ALTER TABLE "vehicules" ADD CONSTRAINT "fk_vehicules_Num_Acc" FOREIGN KEY("Num_Acc")
REFERENCES "circonstance" ("id_vehicule");

ALTER TABLE "caracteristiques" ADD CONSTRAINT "fk_caracteristiques_Accident_Id" FOREIGN KEY("Accident_Id")
REFERENCES "circonstance" ("Num_Acc");

ALTER TABLE "calendrier" ADD CONSTRAINT "fk_calendrier_calen_id" FOREIGN KEY("calen_id")
REFERENCES "caracteristiques" ("Accident_Id");

