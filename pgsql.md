# Basics of PostgreSQL

[Main readme](README.md)

I read all of this [tutorial](https://www.postgresql.org/docs/current/tutorial.html).

## Notes

- `dropdb` seems so dangerous, surely it should check before dropping
- Cool being able to run `SELECT 2 + 2;` or `SELECT current_date + 24;`
- Execute a script with `\i basics.sql`. Set stepwise setting with `psql -s`
- There is a difference between `COPY table_name FROM 'file.txt'` and `\copy table_name from 'file.txt'`
- Don't think I appreciate the UPPER/lower case SQL convention, kdb+ didn't use it
- Requiring `;` is a bit niggly
- `\d` shows the schema
- A *view* is a name to encapsulate a query
- *TRANSACTIONS* sound fantastic, they should be invisible to other concurrently running transactions until completion
- Feels familiar to kdb+, but much more powerful with even just the transactions feature
- Aggregators
  - WHERE controls which rows go in
  - HAVING filters the rows after
  - FILTER is similar to WHERE

## Questions

- When would you use a PostgreSQL shell command over the psql command?
- How do I write a constraint to stop an insert that would result in more than one weather report per location per day?
