Notes
=====

## csv column to rows

```sql
select distinct unnest(string_to_array(primaryprofession, ',')) from names;
```

## csv column to table

```sql
create table professions (pconst text, profession text);
insert into professions select concat('p', row_number() over ()) pconst, profession from (select distinct unnest(string_to_array(primaryprofession, ',')) as profession from names);
```

## many-to-many creation

```sql
create table name_profession (nconst text, pconst text);
with names_professions as (select unnest(string_to_array(primaryprofession, ',')) profession, nconst, primaryname from names), 
names_professions_2 as (select * from names_professions join professions p on p.profession = names_professions.profession)
insert into name_profession (select names_professions_2.nconst, names_professions_2.pconst from names_professions_2);
```

## many-to-many query

```sql
with actors_producers as (select np.nconst, count(*) from professions p join name_profession np on np.pconst = p.pconst where p.profession in ('actor', 'producer') group by np.nconst),
actors_producers_2 as (select n.primaryname, n.primaryprofession from names n join actors_producers ap on ap.nconst = n.nconst where ap.count = 2)
select * from actors_producers_2 limit 10;
```
