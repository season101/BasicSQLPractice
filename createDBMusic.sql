CREATE DATABASE IF NOT EXISTS MUSIC;
USE MUSIC;
CREATE TABLE IF NOT EXISTS artist(
    artist_id SMALLINT(5) NOT NULL DEFAULT 0,
    artist_name CHAR(128) DEFAULT NULL,
    PRIMARY KEY (artist_id)
);