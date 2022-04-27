CREATE TABLE "Teams" (
  "id" <type>,
  "name" <type>,
  "city" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Referees" (
  "id" <type>,
  "name" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Season" (
  "id" <type>,
  "start_date" <type>,
  "end_date" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Player" (
  "id" <type>,
  "name" <type>,
  "current_team_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Player.current_team_id"
    FOREIGN KEY ("current_team_id")
      REFERENCES "Teams"("id")
);

CREATE TABLE "Goals" (
  "id" <type>,
  "player_id" <type>,
  "match_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Goals.player_id"
    FOREIGN KEY ("player_id")
      REFERENCES "Player"("id")
);

CREATE TABLE "Matches" (
  "id" <type>,
  "home_team_id" <type>,
  "away_team_id" <type>,
  "season_id" <type>,
  "head_ref_id" <type>,
  "asst_ref_id_1" <type>,
  "asst_ref_id_2" <type>,
  "location" <type>,
  "date" <type>,
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
      REFERENCES "Teams"("id")
);

CREATE TABLE "Results" (
  "id" <type>,
  "team_id" <type>,
  "match_id" <type>,
  "result" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Results.match_id"
    FOREIGN KEY ("match_id")
      REFERENCES "Matches"("id"),
  CONSTRAINT "FK_Results.team_id"
    FOREIGN KEY ("team_id")
      REFERENCES "Teams"("id")
);

CREATE TABLE "Lineups" (
  "id" <type>,
  "player_id" <type>,
  "match_id" <type>,
  "team_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Lineups.player_id"
    FOREIGN KEY ("player_id")
      REFERENCES "Player"("id")
);

