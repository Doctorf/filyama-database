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
CREATE TABLE [films] (
  [id] INTEGER PRIMARY KEY AUTOINCREMENT, 
  [existCover] BOOLEAN DEFAULT false, 
  [name_orig] TEXT, 
  [name_rus] TEXT, 
  [id_directed] INTEGER REFERENCES [directed]([id]), 
  [date_world] TIMESTAMP, 
  [date_rus] TIMESTAMP, 
  [path] VARCHAR(512));
