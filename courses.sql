CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "role_id" int
);

CREATE TABLE "user_courses" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level_id" int,
  "teacher_id" uuid,
  "course_video_id" uuid
);

CREATE TABLE "course_video" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "video_url" varchar
);

CREATE TABLE "course_level" (
  "id" serial PRIMARY KEY,
  "name" varchar,
  "description" text
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "user_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "course_level" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_video_id") REFERENCES "course_video" ("id");

insert into roles (
	name
) values (
	'student'
), (
	'teacher'
), (
	'administrator'
);

insert into teachers (
	id,
	name
) values (
	'6a0d04a9-546d-48cb-bbc8-6a7872155a4f',
	'jose ramirez'
), (
	'897a235a-6dec-467d-b7be-053db9a78588',
	'david romero'
);

insert into course_level (
	name,
	description
) values (
	'principiante',
	'este curso es para personas sin ningun conocimiento del tema o con un conocimiento muy bajo.'
), (
	'medio',
	'este cursos es para personas con un conocimiento ni muy alto ni muy bajo del tema'
), (
	'experto',
	'este cursos es para personas con un conocimiento alto sobre el tema.'
);

insert into users (
	id,
	first_name,
	last_name,
	email,
	"password" ,
	age,
	role_id
) values (
	'86149362-9496-4a0b-b88e-e0cc52e8c358',
	'walter',
	'alvarez',
	'walter@gmail.com',
	'root',
	'29',
	1
), (
	'43d2b78f-6688-486b-a3d9-7ea484e54f7f',
	'juan',
	'cantor',
	'juan@gmail.com',
	'root',
	'20',
	1
);

insert into course_video (
	id,
	title,
	video_url
) values (
	'51525e75-8520-4476-8ed1-eb23a6adf6dc',
	'front-end basico',
	'https://video-frontEnd-basico'
), (
	'cacb318e-65f3-4025-b7d2-168929bed19a',
	'back-end avanzado',
	'https://video-backEnd-avanzado'
);

insert into courses (
	id,
	title,
	description,
	level_id,
	teacher_id,
	course_video_id
) values (
	'ab15b00e-1d67-46e8-aa4f-7ea4f1ba88fc',
	'front-end',
	'En este curso se va a ver todo lo basico para el front-end.',
	1,
	'6a0d04a9-546d-48cb-bbc8-6a7872155a4f',
	'51525e75-8520-4476-8ed1-eb23a6adf6dc'
), (
	'bd2367db-256e-444c-b470-67448b20e833',
	'back-end',
	'En este curso se van a ver cosas avanzadas del back-end',
	3,
	'897a235a-6dec-467d-b7be-053db9a78588',
	'cacb318e-65f3-4025-b7d2-168929bed19a'
);

insert into user_courses (
	id,
	user_id,
	course_id
) values (
	'839a712b-87ed-4770-8003-19ef28c0d3d3',
	'86149362-9496-4a0b-b88e-e0cc52e8c358',
	'ab15b00e-1d67-46e8-aa4f-7ea4f1ba88fc'
), (
	'7fc4b4dd-1ec8-4d62-9e21-e74a0390ecca',
	'43d2b78f-6688-486b-a3d9-7ea484e54f7f',
	'bd2367db-256e-444c-b470-67448b20e833'
);
