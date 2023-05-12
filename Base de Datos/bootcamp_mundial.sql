{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 CREATE TABLE "equipo" (\
  "id" integer PRIMARY KEY,\
  "nombre_equipo" varchar\
);\
\
CREATE TABLE "grupo" (\
  "id" integer PRIMARY KEY,\
  "id_equipo" integer,\
  "descripcion" varchar,\
  "id_fase" integer,\
  "id_partido" integer\
);\
\
CREATE TABLE "fases" (\
  "id" integer PRIMARY KEY,\
  "descripcion" varchar,\
  "id_equipo" integer,\
  "id_partido" integer\
);\
\
CREATE TABLE "partido" (\
  "id" integer PRIMARY KEY,\
  "descripcion" varchar,\
  "id_equipo_local" integer,\
  "id_equipo_visitante" integer\
);\
\
CREATE TABLE "resultados" (\
  "id" integer PRIMARY KEY,\
  "id_partido" integer,\
  "goles_local" integer,\
  "goles_visitante" integer\
);\
\
COMMENT ON COLUMN "grupo"."descripcion" IS 'Para saber el nombre del grupo';\
\
COMMENT ON COLUMN "fases"."descripcion" IS 'Para saber que fase es';\
\
COMMENT ON COLUMN "partido"."descripcion" IS 'Para saber que partido es';\
\
ALTER TABLE "grupo" ADD FOREIGN KEY ("id_equipo") REFERENCES "equipo" ("id");\
\
ALTER TABLE "grupo" ADD FOREIGN KEY ("id_fase") REFERENCES "fases" ("id");\
\
CREATE TABLE "grupo_partido" (\
  "grupo_id_partido" integer,\
  "partido_id" integer,\
  PRIMARY KEY ("grupo_id_partido", "partido_id")\
);\
\
ALTER TABLE "grupo_partido" ADD FOREIGN KEY ("grupo_id_partido") REFERENCES "grupo" ("id");\
\
ALTER TABLE "grupo_partido" ADD FOREIGN KEY ("partido_id") REFERENCES "partido" ("id");\
\
\
ALTER TABLE "fases" ADD FOREIGN KEY ("id_partido") REFERENCES "partido" ("id");\
\
ALTER TABLE "partido" ADD FOREIGN KEY ("id_equipo_local") REFERENCES "equipo" ("id");\
\
ALTER TABLE "partido" ADD FOREIGN KEY ("id_equipo_visitante") REFERENCES "equipo" ("id");\
\
ALTER TABLE "resultados" ADD FOREIGN KEY ("id_partido") REFERENCES "partido" ("id");\
\
CREATE TABLE "equipo_fases" (\
  "equipo_id" integer,\
  "fases_id_equipo" integer,\
  PRIMARY KEY ("equipo_id", "fases_id_equipo")\
);\
\
ALTER TABLE "equipo_fases" ADD FOREIGN KEY ("equipo_id") REFERENCES "equipo" ("id");\
\
ALTER TABLE "equipo_fases" ADD FOREIGN KEY ("fases_id_equipo") REFERENCES "fases" ("id");\
\
}