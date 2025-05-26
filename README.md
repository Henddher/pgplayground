Postgres Playground
===================

Ref: https://hub.docker.com/_/postgres

## Launch

```shell
docker compose up
```

## Adminer Login

From docker-compose.yaml

server: db
username: postgres
password: example

# psql

Assuming postgres container is running

```shell
docker exec -it pgplayground-db-1 psql -U postgres
```

## Data Seeding

For each in https://datasets.imdbws.com/

```shell
wget -O - https://datasets.imdbws.com/name.basics.tsv.gz | gunzip > name.basics.tsv
# or
./wgetall
```

From psql, load TSV

```sql
create table names (nconst text, primaryName text, birthYear text, deathYear text, primaryProfession text, knownForTitles text);

copy names from '/tsvdata/name.basics.tsv' (delimiter E'\t', header 1);
```
