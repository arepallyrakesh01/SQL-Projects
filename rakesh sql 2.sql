Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:

psql (18.6)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# \l
                                                                    List of databases
   Name    |  Owner   | Encoding | Locale Provider |          Collate           |           Ctype            | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+----------------------------+----------------------------+--------+-----------+-----------------------
 Rakesh    | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           |
 postgres  | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           |
 template0 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres          +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_United States.1252 | English_United States.1252 |        |           | =c/postgres          +
           |          |          |                 |                            |                            |        |           | postgres=CTc/postgres
(4 rows)


postgres=# \c postgres
You are now connected to database "postgres" as user "postgres".
postgres=# SELECT 100 * 5 AS calculation_result;
 calculation_result
--------------------
                500
(1 row)


postgres=# 