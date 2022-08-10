DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS parties;


CREATE TABLE parties (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  -- TEXT can store much longer strings of varying length
  description TEXT
);

CREATE TABLE candidates (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  party_id INTEGER,
  industry_connected BOOLEAN NOT NULL,
  -- This allows us to flag the party_id field as an official foreign key and tells SQL which table and field it references. In this case, it references the id field in the parties table. This ensures that no id can be inserted into the candidates table if it doesn't also exist in the parties table. MySQL will return an error for any operation that would violate a constraint. ON DELETE SET NULL ensures that if a candidates party is deleted their affliliation is set to null
  CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

