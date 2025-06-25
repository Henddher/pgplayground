-- Slides examples
-- Run using
-- docker exec pgplayground-db-1 psql -U postgres -c "$(cat owners_and_pets.sql)"

create table people (
    name text,
    zipcode text,
    dob date
);

create table pets (
    name text,
    owner text,
    kind text,
    dob date
);

insert into people values
    ('Alice', '60030', '2-1-1980'),
    ('Bob', '60040', '2-10-1983'),
    ('Carl', '80040', '12-20-1978');

insert into pets values
    ('Fido', 'Bob', 'dog', '1-1-2020'),
    ('Dash', 'Bob', 'cat', '6-12-2024'),
    ('Max', 'Carl', 'gecko', '8-1-2020'),
    ('Magnus', NULL, 'canary', '9-15-2020');
