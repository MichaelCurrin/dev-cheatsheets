# Time


## Schema

Timestamp column for Postgres.

```sql
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    timestamp TIMESTAMP WITH TIME ZONE,
);
```


## Current time

The type will be timestamp with time zone.

```sql
SELECT NOW();
```
```
2021-04-13 11:38:04.06661+00
```


## Use in string

```sql
SELECT 'The time is ' || NOW();
```

```
The time is 2021-04-13 11:40:00.064024+00
```


## Cast to string

Note you cannot convert to integer or float like this, at least in PG.

```sql
SELECT CAST(NOW() AS TEXT);
```

```
2021-04-13 11:40:48.899882+00
```


## Convert unix timestamp to timestamp

From seconds.

```sql
SELECT TO_TIMESTAMP(1618313491.437 );
```

```
2021-04-13 11:31:31.437+00
```

Using milliseconds input by dividing by 1000 to get to seconds, then converting to timestamp.

Note use of decimal to force the result to include milliseconds.

```sql
SELECT TO_TIMESTAMP(1618313491437 / 1000.0);
```

```
2021-04-13 11:31:31.437+00
```


## Interval

Examples.

```sql
SELECT INTERVAL '1 MINUTE';

SELECT INTERVAL '30 MINUTES';
SELECT 30 * INTERVAL '1 MINUTE';

SELECT NOW() - INTERVAL '1 MINUTE';
SELECT NOW() - INTERVAL '5 MINUTES';
SELECT NOW() - INTERVAL '1 DAY 10 MINUTES';
```

```sql
SELECT foo
FROM bar
WHERE NOW() - updated_at > 60 * INTERVAL '1 MINUTE'
```


## Oldest and latest

```sql
SELECT
  NOW() - MIN(created_at) AS oldest_session,
  NOW() - MAX(created_at) AS latest_session
FROM sessions
;
```

e.g.

| `oldest_session` | `latest_session` |
|--- | ---|
|166 days 15:59:09.156975 | 11 days 19:31:12.73919 |
