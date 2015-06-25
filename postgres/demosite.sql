create table demosite
(
  id serial primary key,
  name text
);

insert into demosite (name) values
  ('Cirrus'),
  ('Cirrostratus'),
  ('Cirrocumulus'),
  ('Altostratus'),
  ('Altocumulus'),
  ('Nimbostratus'),
  ('Cumulus'),
  ('Stratus'),
  ('Cumulonimbus'),
  ('Stratocumulus');
