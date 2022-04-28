CREATE TABLE "Category" (
  "id" SERIAL,
  "name" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "Region" (
  "id" SERIAL,
  "name" TEXT,
  PRIMARY KEY ("id")
);

CREATE TABLE "User" (
  "id" SERIAL,
  "username" TEXT,
  "password" TEXT,
  "region_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_User.region_id"
    FOREIGN KEY ("region_id")
      REFERENCES "Region"("id")
);

CREATE TABLE "Post" (
  "id" SERIAL,
  "user_id" SERIAL,
  "catergory_id" SERIAL,
  "title" TEXT,
  "text" TEXT,
  "location" TEXT,
  "region_id" SERIAL,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_Post.user_id"
    FOREIGN KEY ("user_id")
      REFERENCES "User"("id"),
  CONSTRAINT "FK_Post.catergory_id"
    FOREIGN KEY ("catergory_id")
      REFERENCES "Category"("id"),
  CONSTRAINT "FK_Post.region_id"
    FOREIGN KEY ("region_id")
      REFERENCES "Region"("id")
);

