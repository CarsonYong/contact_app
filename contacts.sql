CREATE TABLE contacts (
  id        serial NOT NULL PRIMARY KEY,
  firstname varchar(40) NOT NULL,
  lastname  varchar(40) NOT NULL,
  email     varchar(40) NOT NULL
);

INSERT INTO contacts (firstname, lastname, email)
VALUES
('Carson', 'Yong', 'carson@carson.com');

INSERT INTO contacts (firstname, lastname, email)
VALUES
('firstname', 'lastname', 'test@example.com');