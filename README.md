PgStats
=================================

A collection of queries to show more or less performance related statistics.

## How to use it?

Add it to the Gemfile.

Require it:

```
require 'pg_stats`
```

Use it:

```
PgStats::Runner.new(dbname: 'my_postgres_database').exec('commits')
```

Pass to the `#initialize` whatever `PG::Connection` takes. See [the documentation](http://deveiate.org/code/pg/PG/Connection.html#method-c-new) for details.

Or pass connection object directly using keyword args:

```
connection_object = ActiveRecord::Base.connection
PgStats::Runner.new(connection: connection_object).execute('commits')
```

If you are using ActiveRecord connection object you have to call all queries with `execute`, otherwise use `exec`.

Do anything you like with the data.

## What does it do?

See `lib/pg_stats/data.yml` for the queries it supports. There is a short description for each type of query. It saves time.

## It's missing a query I want to use!

Drop a pull request and gain fame and karma.

Otherwise you can provide your own *data* this way:

```
runner = PgStats::Runner.new(dbname: 'mydb')
runner.data = { 'pg_stats' => { 'my_special_query' => { 'sql' => 'SELECT 1;', 'help' => 'test' } } }
runner.exec('my_special_query')
```

## It has no tests!

Yes.
