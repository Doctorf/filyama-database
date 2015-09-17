CREATE TABLE [category] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT, 
  [name] TEXT, 
  [id_image] INTEGER REFERENCES [category_images]([id]), 
  [id_parent] INTEGER);
CREATE TABLE category_images(id INTEGER PRIMARY KEY AUTOINCREMENT, value BLOB);
CREATE TABLE [directed] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [full_name] VARCHAR(255));
CREATE TABLE [file_extensions] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT, 
  [Name] varcHAR(255), 
  [filter] varchar(255), 
  [foto] BOOLEAN DEFAULT false);
CREATE TABLE [binary_data_films] (
  [id_films] INTEGER NOT NULL REFERENCES [films]([id]), 
  [id_binary_data] INTEGER NOT NULL REFERENCES [binary_data]([id]));
CREATE TABLE [binary_data] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [url] VARCHAR(255), 
  [is_thumbnails] BOOLEAN DEFAULT false, 
  [is_frame] BOOLEAN DEFAULT false, 
  [is_cover] BOOLEAN DEFAULT false);
CREATE TABLE [films] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT, 
  [name_orig] TEXT, 
  [name_rus] TEXT, 
  [id_cover] INTEGER REFERENCES [binary_data]([id]), 
  [id_directed] INTEGER REFERENCES [directed]([id]), 
  [date_world] TIMESTAMP, 
  [date_rus] TIMESTAMP, 
  [path] VARCHAR(512));
CREATE TABLE [category_films] (
  [id_films] INTEGER REFERENCES [films]([id]), 
  [id_category] INTEGER REFERENCES [category]([id]), 
  CONSTRAINT [] PRIMARY KEY ([id_films], [id_category]));
CREATE TABLE [configs] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name] VARCHAR(255), 
  [value] VARCHAR(255));
CREATE TABLE [serials] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name] VARCHAR(255));
CREATE TABLE [seasons] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [number] INTEGER, 
  [name] VARCHAR(255));
CREATE TABLE [season_serial] (
  [id_season] INTEGER REFERENCES [seasons]([id]), 
  [id_serial] CHAR REFERENCES [serials]([id]));
CREATE TABLE [episodes] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [number] INTEGER, 
  [name] VARCHAR(255));
CREATE TABLE [episode_season] (
  [id_episode] INTEGER NOT NULL REFERENCES [episodes]([id]) ON DELETE CASCADE, 
  [id_season] INTERGER NOT NULL REFERENCES [seasons]([id]) ON DELETE CASCADE);
CREATE TABLE [cast] (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [id_people] INTEGER, 
  [id_film] CHAR, 
  [character] VARCHAR(255));
CREATE TABLE "persons" (
  [id] INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, 
  [name] VARCHAR(255), 
  [birthday] TIMESTAMP, 
  [ImdbId] VARCHAR(255));
