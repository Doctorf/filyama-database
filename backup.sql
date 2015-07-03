CREATE TABLE category_films(id_films INTEGER, id_category INTEGER,FOREIGN KEY(id_films) REFERENCES films(id), FOREIGN KEY(id_category) REFERENCES category(id));
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
