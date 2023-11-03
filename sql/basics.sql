select current_date + 10;
select 2 + 2;


create table cities (
    name            varchar(80) primary key,
    location        point
);

insert into cities values ('dublin', '(6.3, 53.4)');
insert into cities values ('cork', '(8.5, 51.9)');



create table weather (
    city            varchar(80) references cities(name),
    temp_lo         int,           -- low temperature
    temp_hi         int,           -- high temperature
    prcp            real,          -- precipitation
    date            date
);


create table temp (
    example         int,
    another         date
);
drop table temp;


/*
insert into weather values ('dublin', 2, 8, 1.5, '2023-11-02');
*/

-- \copy weather from 'sql/weather.txt' (delimiter(','));

/* looks exactly like kdb */
select * from weather where city='dublin' and date='2023-11-03'
select * from weather order by city
select distinct city from weather

select city, temp_lo, temp_hi, prcp, date, location from weather join cities on city = name;

/* can qualify the column names too using weather.city or cities.name */

select * from weather left outer join cities on weather.city = cities.name;

/*
right outer - gets matches based on right table, effectively orders the join by the right
full outer - seems to match left outer?
*/

/* rename on the fly */
select * from weather w join cities c on w.city = c.name;

/*
self join - renames necessary for this

this query makes no sense to me, but it does a self join
*/

select w1.city, w1.temp_lo as low, w1.temp_hi as high,
       w2.city, w2.temp_lo as low, w2.temp_hi as high
    from weather w1 join weather w2
        on w1.temp_lo < w2.temp_lo and w1.temp_hi > w2.temp_hi;

/* ordering of query clauses seems to matter too, e.g. having goes after group by */

select city, count(*), max(temp_hi)
    from weather w
    where city like '%l%'
    group by city
    having max(temp_hi) > 16;

update weather
    set temp_hi = temp_hi + 1
    where city='Cork' and date='2023-11-03';

-- TRANSACTIONS

/*
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
-- etc etc
COMMIT;
*/

/*
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Bob';
-- oops ... forget that and use Wally's account
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Wally';
COMMIT;
*/