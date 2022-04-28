CREATE TABLE "Doctor" (
  "id" SERIAL,
  "name" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "Patient" (
  "id" SERIAL,
  "name" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "Visit" (
  "id" SERIAL,
  "doctor_id" SERIAL,
  "patient_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Visit.doctor_id"
    FOREIGN KEY ("doctor_id")
      REFERENCES "Doctor"("id"),
  CONSTRAINT "FK_Visit.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "Patient"("id")
);

CREATE TABLE "Diseases" (
  "id" SERIAL,
  "name" TEXT,
  "description" TEXT,
  PRIMARY KEY TEXT
);

CREATE TABLE "Diagnoses" (
  "id" SERIAL,
  "visit_id" TEXT,
  "disease_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Diagnoses.disease_id"
    FOREIGN KEY ("disease_id")
      REFERENCES "Diseases"("name"),
  CONSTRAINT "FK_Diagnoses.visit_id"
    FOREIGN KEY ("visit_id")
      REFERENCES "Visit"("patient_id")
);

