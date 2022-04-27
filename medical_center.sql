CREATE TABLE "Doctor" (
  "id" <type>,
  "name" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Patient" (
  "id" <type>,
  "name" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Visit" (
  "id" <type>,
  "doctor_id" <type>,
  "patient_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Visit.doctor_id"
    FOREIGN KEY ("doctor_id")
      REFERENCES "Doctor"("id"),
  CONSTRAINT "FK_Visit.patient_id"
    FOREIGN KEY ("patient_id")
      REFERENCES "Patient"("id")
);

CREATE TABLE "Diseases" (
  "id" <type>,
  "name" <type>,
  "description" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Diagnoses" (
  "id" <type>,
  "visit_id" <type>,
  "disease_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Diagnoses.disease_id"
    FOREIGN KEY ("disease_id")
      REFERENCES "Diseases"("name"),
  CONSTRAINT "FK_Diagnoses.visit_id"
    FOREIGN KEY ("visit_id")
      REFERENCES "Visit"("patient_id")
);

