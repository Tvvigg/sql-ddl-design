CREATE TABLE "Category" (
  "id" <type>,
  "name" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "Region" (
  "id" <type>,
  "name" <type>,
  PRIMARY KEY ("id")
);

CREATE TABLE "User" (
  "id" <type>,
  "username" <type>,
  "password" <type>,
  "region_id" <type>,
  PRIMARY KEY ("id"),
  CONSTRAINT "FK_User.region_id"
    FOREIGN KEY ("region_id")
      REFERENCES "Region"("id")
);

CREATE TABLE "Post" (
  "id" <type>,
  "user_id" <type>,
  "catergory_id" <type>,
  "title" <type>,
  "text" <type>,
  "location" <type>,
  "region_id" <type>,
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

