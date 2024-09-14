BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "sellers" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"student_id"	text,
	"year"	integer,
	"institute"	text,
	"major"	text,
	"picture_student_id"	text,
	"member_id"	integer,
	CONSTRAINT "fk_members_seller" FOREIGN KEY("member_id") REFERENCES "members"("member_id"),
	CONSTRAINT "uni_sellers_member_id" UNIQUE("member_id"),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "room_chats" (
	"room_id"	integer,
	"member_id"	integer,
	"seller_id"	integer,
	CONSTRAINT "fk_room_chats_seller" FOREIGN KEY("seller_id") REFERENCES "sellers"("id"),
	CONSTRAINT "fk_members_room_chats" FOREIGN KEY("member_id") REFERENCES "members"("member_id"),
	PRIMARY KEY("room_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "members" (
	"member_id"	integer,
	"username"	text,
	"password"	text,
	"email"	text,
	"first_name"	text,
	"last_name"	text,
	"phone_number"	text,
	"address"	text,
	"profile_pic"	text,
	PRIMARY KEY("member_id" AUTOINCREMENT),
	CONSTRAINT "fk_room_chats_member" FOREIGN KEY("member_id") REFERENCES "room_chats"("room_id")
);
CREATE TABLE IF NOT EXISTS "messages" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"sender_id"	integer,
	"content"	text,
	"room_chat_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "fk_room_chats_messages" FOREIGN KEY("room_chat_id") REFERENCES "room_chats"("room_id"),
	CONSTRAINT "fk_messages_sender" FOREIGN KEY("sender_id") REFERENCES "members"("member_id")
);
INSERT INTO "sellers" VALUES (1,'2024-09-14 13:49:43.694555+07:00','2024-09-14 13:49:43.694555+07:00',NULL,'B6527000',22,'Engineering','Computer','5661felrs',1);
INSERT INTO "room_chats" VALUES (1,2,1);
INSERT INTO "members" VALUES (1,'Jibjib','12345','sa@gmail.com','Software','Analysis','021313343','Mittrphap Road Korat','https://www.khaosod.co.th/wpapp/uploads/2024/09/Nong-Moo-Deng4548-5.jpg');
INSERT INTO "members" VALUES (2,'B6526000','$2a$14$f/HbKz5UNLC2uD7InC2l8.okhAYk3e1RT4vW9dmV9bYWxCGCJL2fu','gam101046gam@gmail.com','Natthawut','Samruamjit','0910164350','4/4 นครพนม 48120','');
INSERT INTO "members" VALUES (3,'B6526000','$2a$14$H/dK1Me4s5H0y2Dx0qFhiO09KUPGQZlUvZ3dx4yAHapzz6Ojh3PVe','gam101046gam@gmail.com','Natthawut','Samruamjit','0910164350','4/4 นครพนม 48120','');
CREATE INDEX IF NOT EXISTS "idx_sellers_deleted_at" ON "sellers" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_messages_deleted_at" ON "messages" (
	"deleted_at"
);
COMMIT;
