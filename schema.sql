-- Creator:       MySQL Workbench 5.2.47/ExportSQLite plugin 2009.12.02
-- Author:        tpolson
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2014-02-21 15:53
-- Created:       2013-06-14 00:06
PRAGMA foreign_keys = OFF;

-- Schema: SabreTracker_Master
BEGIN;
CREATE TABLE "countries"(
  "country_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("country_id">=0),
  "iso" VARCHAR(20),
  "name" VARCHAR(45),
  "iso3" VARCHAR(20),
  "numcode" VARCHAR(20)
);
CREATE TABLE "projects"(
  "project_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("project_id">=0),
  "company_id" INTEGER NOT NULL CHECK("company_id">=0),
  "project_type_id" INTEGER NOT NULL CHECK("project_type_id">=0),
  "format_id" INTEGER CHECK("format_id">=0),
  "project_name" VARCHAR(45),
  "database_name" VARCHAR(45),
  "working_title" VARCHAR(45),
  "description" VARCHAR(45),
  "status" VARCHAR(10),
  "start_date" VARCHAR(20),
  "end_date" VARCHAR(20)
);
CREATE TABLE "users"(
  "user_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("user_id">=0),
  "group_id" INTEGER NOT NULL CHECK("group_id">=0) DEFAULT 0,
  "dept_id" INTEGER NOT NULL CHECK("dept_id">=0) DEFAULT 0,
  "banned_id" INTEGER NOT NULL CHECK("banned_id">=0) DEFAULT 0,
  "country_id" INTEGER NOT NULL CHECK("country_id">=0) DEFAULT 0,
  "question_id" INTEGER NOT NULL CHECK("question_id">=0) DEFAULT 0,
  "user_name" VARCHAR(45),
  "last_name" VARCHAR(45),
  "first_name" VARCHAR(45),
  "company_id" INTEGER NOT NULL CHECK("company_id">=0),
  "password" VARCHAR(20),
  "email" VARCHAR(45),
  "phone" VARCHAR(20),
  "phone_ext" VARCHAR(10),
  "mobile" VARCHAR(20),
  "user_type" VARCHAR(20),
  "hash" VARCHAR(45),
  "activation_code" VARCHAR(45),
  "forgotten_password_code" VARCHAR(45),
  "signature" VARCHAR(45),
  "status" VARCHAR(10)
);
CREATE TABLE "groups"(
  "group_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("group_id">=0),
  "title" VARCHAR(45),
--   superadmin
--   admi
--   client
--   vendor
--   support
--   producer
--   supervisor
--   artist
--   assistant
  "description" TEXT
);
CREATE TABLE "banned"(
  "banned_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("banned_id">=0),
  "reason" VARCHAR(45)
);
CREATE TABLE "company"(
  "company_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("company_id">=0),
  "user_id" INTEGER NOT NULL CHECK("user_id">=0),
  "company" VARCHAR(45),
  "department" VARCHAR(45),
  "contact" VARCHAR(45),
  "contact2" VARCHAR(45),
  "address_id" INTEGER NOT NULL CHECK("address_id">=0)
);
CREATE TABLE "address"(
  "address_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("address_id">=0),
  "address" VARCHAR(45),
  "address2" VARCHAR(45),
  "district" VARCHAR(45),
  "city_id" INTEGER NOT NULL CHECK("city_id">=0),
  "postal_code" VARCHAR(10),
  "phone" VARCHAR(20)
);
CREATE TABLE "city"(
  "city_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("city_id">=0),
  "city" VARCHAR(45),
  "country_id" INTEGER NOT NULL CHECK("country_id">=0)
);
CREATE TABLE "department"(
  "dept_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("dept_id">=0),
  "name" VARCHAR(45),
  "description" TEXT
);
CREATE TABLE "templates"(
  "template_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("template_id">=0),
  "user_id" INTEGER CHECK("user_id">=0),
  "template_name" VARCHAR(20),
  "template_type" VARCHAR(10),
  "template" TEXT
);
CREATE TABLE "status"(
  "status_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("status_id">=0),
  "name" VARCHAR(20),
  "image_id" INTEGER NOT NULL CHECK("image_id">=0),
  "type" VARCHAR(10)
);
CREATE TABLE "status_type"(
  "status_type_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("status_type_id">=0),
  "name" VARCHAR(45),
  "state" INTEGER NOT NULL CHECK("state">=0),
  "image_id" INTEGER NOT NULL CHECK("image_id">=0)
);
CREATE TABLE "user_images"(
  "user_image_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("user_image_id">=0),
  "image_name" VARCHAR(45),
  "image" BLOB,
  "user_id" INTEGER NOT NULL
);
CREATE TABLE "project_type"(
  "project_type_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("project_type_id">=0),
  "project_type_name" VARCHAR(45),
  "decsription" VARCHAR(45)
);
CREATE TABLE "system"(
  "system_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("system_id">=0),
  "software_versionl" VARCHAR(10),
  "system_database_version" VARCHAR(10),
  "project_database_version" VARCHAR(10)
);
CREATE TABLE "user_vault"(
  "user_vault_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("user_vault_id">=0)
);
CREATE TABLE "formats"(
  "format_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("format_id">=0),
  "format_name" VARCHAR(45),
  "description" VARCHAR(45),
  "width" VARCHAR(5),
  "height" VARCHAR(5),
  "framerate" VARCHAR(10),
  "interlaced" BOOLEAN,
  "aspect_ratio" VARCHAR(10),
  "S3D" BOOLEAN
);
CREATE TABLE "column_type"(
  "column_type_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("column_type_id">=0),
  "column_name" VARCHAR(45),
  "column_type" VARCHAR(45)
);
CREATE TABLE "users_roles"(
  "users_roles_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "user_id" INTEGER,
  "role_id" INTEGER
);
CREATE TABLE "roles"(
  "roles_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("roles_id">=0),
  "role_name" VARCHAR(45),
  "created" TIMESTAMP,
  "updated" TIMESTAMP
);
CREATE TABLE "permissions"(
  "permission_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("permission_id">=0),
  "permission_name" VARCHAR(45),
  "role_id" INTEGER,
  "created" TIMESTAMP,
  "updated" TIMESTAMP
);
COMMIT;

-- Schema: projects
ATTACH "projects.sdb" AS "projects";
BEGIN;
CREATE TABLE "projects"."scenes"(
  "scene_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("scene_id">=0),
  "scene_name" VARCHAR(45),
  "status_id" INTEGER CHECK("status_id">=0),
  "scene_description" TEXT
);
CREATE TABLE "projects"."editorial"(
  "edit_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("edit_id">=0),
  "reel" VARCHAR(45),
  "src_Frame_In" VARCHAR(10),
  "src_Frame_Out" VARCHAR(10),
  "src_TC_In" VARCHAR(20),
  "src_TC_Out" VARCHAR(20),
  "duration" VARCHAR(10),
  "frameRate" VARCHAR(8),
  "image_id" INTEGER NOT NULL CHECK("image_id">=0),-- reference image
  "notes_id" INTEGER NOT NULL CHECK("notes_id">=0),
  "status_id" INTEGER NOT NULL CHECK("status_id">=0)
);
CREATE TABLE "projects"."sequences"(
  "seq_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("seq_id">=0),
  "scene_id" INTEGER NOT NULL CHECK("scene_id">=0),
  "edit_id" INTEGER NOT NULL CHECK("edit_id">=0),
  "recFrameIn" VARCHAR(10),
  "recFrameOut" VARCHAR(10),
  "recTCIn" VARCHAR(20),
  "recTCOut" VARCHAR(20),
  "frameRate" VARCHAR(8)
);
CREATE TABLE "projects"."shots"(
  "shot_id" INTEGER PRIMARY KEY NOT NULL CHECK("shot_id">=0),
  "edit_id" INTEGER CHECK("edit_id">=0),
  "scene_id" INTEGER CHECK("scene_id">=0),
  "seq_id" INTEGER CHECK("seq_id">=0),
  "shots_name" VARCHAR(45),
  "shot_description" VARCHAR(45),
  "reel" VARCHAR(45),
  "src_Frame_In" VARCHAR(10),
  "src_Frame_Out" VARCHAR(10),
  "src_TC_Out" VARCHAR(20),
  "src_TC_In" VARCHAR(20),
  "shot_duration" VARCHAR(10),
  "image_id" INTEGER CHECK("image_id">=0)-- reference image
);
CREATE TABLE "projects"."tasks"(
  "task_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("task_id">=0),
  "task_type_id" INTEGER CHECK("task_type_id">=0),
  "shot_id" INTEGER CHECK("shot_id">=0),
  "task_name" VARCHAR(45),
  "task_description" VARCHAR(45)
);
CREATE TABLE "projects"."filepaths"(
  "filepaths_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("filepaths_id">=0),
  "filepath_name" VARCHAR(45),
  "relative_path" VARCHAR(255)
);
CREATE TABLE "projects"."images"(
  "image_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("image_id">=0),
  "imagename" VARCHAR(45),
  "image" BLOB,
  "user_id" INTEGER NOT NULL CHECK("user_id">=0)
);
CREATE TABLE "projects"."media"(
  "media_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("media_id">=0),
  "name" VARCHAR(45),
  "filepath" VARCHAR(45),
  "user_id" INTEGER NOT NULL CHECK("user_id">=0),
  "note_id" INTEGER NOT NULL CHECK("note_id">=0)
);
CREATE TABLE "projects"."notes"(
  "note_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("note_id">=0),
  "user_id" INTEGER CHECK("user_id">=0),
  "edit_id" INTEGER CHECK("edit_id">=0),
  "task_id" INTEGER CHECK("task_id">=0),
  "scene_id" INTEGER CHECK("scene_id">=0),
  "shot_id" INTEGER CHECK("shot_id">=0),
  "seq_id" INTEGER CHECK("seq_id">=0),
  "note_name" VARCHAR(45),
  "note_body" TEXT,
  "status_id" INTEGER NOT NULL CHECK("status_id">=0),
  "date" VARCHAR(20),
  "time" TIMESTAMP
);
CREATE TABLE "projects"."file_templates"(
  "file_template_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("file_template_id">=0),
  "file_template_name" VARCHAR(20),
  "file_template" VARCHAR(45)
);
CREATE TABLE "projects"."status"(
  "status_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("status_id">=0),
  "status_name" VARCHAR(20),
  "icon" BLOB,
  "type" VARCHAR(10)
);
CREATE TABLE "projects"."system"(
  "system_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("system_id">=0),
  "software_versionl" VARCHAR(10),
  "system_database_version" VARCHAR(10),
  "project_database_version" VARCHAR(10)
);
CREATE TABLE "projects"."settings"(
  "settings_id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL CHECK("settings_id">=0),
  "format_id" INTEGER CHECK("format_id">=0)
);
COMMIT;
