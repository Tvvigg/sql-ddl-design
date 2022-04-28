CREATE TABLE "Teams" (
  "id" SERIAL,
  "name" TEXT,
  "city" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "Referees" (
  "id" SERIAL,
  "name" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "Season" (
  "id" SERIAL,
  "start_date" TIMESTAMP,
  "end_date" TIMESTAMP,
  PRIMARY KEY ("id")
);

CREATE TABLE "Player" (
  "id" SERIAL,
  "name" TEXT,
  "current_team_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Player.current_team_id"
    FOREIGN KEY ("current_team_id")
      REFERENCES "Teams"("id")
);

CREATE TABLE "Goals" (
  "id" SERIAL,
  "player_id" SERIAL,
  "match_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Goals.player_id"
    FOREIGN KEY ("player_id")
      REFERENCES "Player"("id")
);

CREATE TABLE "Matches" (
  "id" SERIAL,
  "home_team_id" SERIAL,
  "away_team_id" SERIAL,
  "season_id" SERIAL,
  "head_ref_id" SERIAL,
  "asst_ref_id_1" SERIAL,
  "asst_ref_id_2" SERIAL,
  "location" TEXT,
  "date" TEXT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Matches.season_id"
    FOREIGN KEY ("season_id")
      REFERENCES "Season"("id"),
  CONSTRAINT "FK_Matches.id"
    FOREIGN KEY ("id")
      REFERENCES "Goals"("match_id"),
  CONSTRAINT "FK_Matches.asst_ref_id_1"
    FOREIGN KEY ("asst_ref_id_1")
      REFERENCES "Referees"("id"),
  CONSTRAINT "FK_Matches.asst_ref_id_2"
    FOREIGN KEY ("asst_ref_id_2")
      REFERENCES "Referees"("id"),
  CONSTRAINT "FK_Matches.head_ref_id"
    FOREIGN KEY ("head_ref_id")
      REFERENCES "Referees"("id"),
  CONSTRAINT "FK_Matches.away_team_id"
    FOREIGN KEY ("away_team_id")
      REFERENCES "Teams"("id"),
  CONSTRAINT "FK_Matches.home_team_id"
    FOREIGN KEY ("home_team_id")
      REFERENCES "Teams"SERIAL
);

CREATE TABLE "Results" (
  "id" SERIAL,
  "team_id" SERIAL,
  "match_id" SERIAL,
  "result" TEXT,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Results.match_id"
    FOREIGN KEY ("match_id")
      REFERENCES "Matches"("id"),
  CONSTRAINT "FK_Results.team_id"
    FOREIGN KEY ("team_id")
      REFERENCES "Teams"SERIAL
);

CREATE TABLE "Lineups" (
  "id" SERIAL,
  "player_id" SERIAL,
  "match_id" SERIAL,
  "team_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Lineups.player_id"
    FOREIGN KEY ("player_id")
      REFERENCES "Player"("id"SERIAL