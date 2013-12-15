#Store your app in Git
git init
git add .
git commit -m 'init'
#Deploy your application to Herokuj
heroku create
#Deploy the code
git push heroku master

# run: we have one dyno running the web process type:
heroku ps:scale web=1

#check the state of the app’s dynos
heroku ps

#We can now visit the app in our browser with  
heroku open
#url: http://aqueous-dawn-2340.herokuapp.com/


#view logs
heroku logs

#STOPPING
heroku ps:stop DYNO

#adding postgres database
heroku addons:add heroku-postgresql:dev

# list addons
heroku addons | grep POSTGRES
#heroku-postgresql:dev  HEROKU_POSTGRESQL_BROWN
#heroku-postgresql:dev  HEROKU_POSTGRESQL_GRAY

#list the db urls
heroku config | grep HEROKU_POSTGRESQL
#HEROKU_POSTGRESQL_BROWN_URL: postgres://vqozuexlkaknhj:0GDx7M5-AeDZ2FpDQ7Wg4O448l@ec2-54-225-101-199.compute-1.amazonaws.com:5432/d3eg9ejqhb4nos
#HEROKU_POSTGRESQL_GRAY_URL:  postgres://mhyfdpwdwyykug:qMzqBYBOq_wzEW4JBsuWcrq6uS@ec2-54-225-101-199.compute-1.amazonaws.com:5432/dc405abicel846

#prmote HEROKU_POSTGRESQL_BROWN_URL to DATABASE_URL (used in web.js)
heroku pg:promote HEROKU_POSTGRESQL_BROWN_URL

#DB info
heroku pg:info
#=== HEROKU_POSTGRESQL_BROWN_URL (DATABASE_URL)
#Plan:        Dev
#Status:      available
#Connections: 1
#PG Version:  9.3.2
#Created:     2013-12-15 00:08 UTC
#Data Size:   6.4 MB
#Tables:      0
#Rows:        0/10000 (In compliance)
#Fork/Follow: Unsupported
#Rollback:    Unsupported
#
#=== HEROKU_POSTGRESQL_GRAY_URL
#Plan:        Dev
#Status:      available
#Connections: 1
#PG Version:  9.3.2
#Created:     2013-12-15 00:04 UTC
#Data Size:   6.4 MB
#Tables:      0
#Rows:        0/10000 (In compliance)
#Fork/Follow: Unsupported
#Rollback:    Unsupported



#======================= access the database
heroku pg:psql
#---> Connecting to HEROKU_POSTGRESQL_BROWN_URL (DATABASE_URL)
#psql (8.4.11, server 9.3.2)
#WARNING: psql version 8.4, server version 9.3.
#         Some psql features might not work.
#SSL connection (cipher: DHE-RSA-AES256-SHA, bits: 256)
#Type "help" for help.
#
#d3eg9ejqhb4nos=> create table test1 (name varchar(64));
#CREATE TABLE
#d3eg9ejqhb4nos=> insert into test1 values('Mohan Chinnappan'); 
#INSERT 0 1
#d3eg9ejqhb4nos=> insert into test1 values('Dennis Ritchie');
#INSERT 0 1
#d3eg9ejqhb4nos=> insert into test1 values('Ken Thompson');
#INSERT 0 1
#d3eg9ejqhb4nos=> select * from test1;
#       name       
#------------------
# Mohan Chinnappan
# Dennis Ritchie
# Ken Thompson
#(3 rows)
#
#d3eg9ejqhb4nos=> \q

#-------- note use this table : test1 in web.js

#---------------- logs ============

#2013-12-15T00:38:58.036275+00:00 heroku[api]: Scale to web=1 by mohan.chinnappan.n@gmail.com
#2013-12-15T00:39:04.718449+00:00 app[web.1]: ip=10.137.5.173 time=2013-12-15T00:39:04.706Z method=GET path=/ status=304 content_length= content_type= elapsed=23ms
#2013-12-15T00:39:04.898731+00:00 app[web.1]: [ { name: 'Mohan Chinnappan' },
#2013-12-15T00:39:04.898731+00:00 app[web.1]:   { name: 'Dennis Ritchie' },
#2013-12-15T00:39:04.898731+00:00 app[web.1]:   { name: 'Ken Thompson' } ]
#2013-12-15T00:39:04.934758+00:00 heroku[router]: at=info method=GET path=/favicon.ico host=aqueous-dawn-2340.herokuapp.com fwd="24.147.77.26" dyno=web.1 connect=1ms service=29ms status=404 bytes=35
#2013-12-15T00:39:04.937320+00:00 app[web.1]: ip=10.198.90.4 time=2013-12-15T00:39:04.910Z method=GET path=/favicon.ico status=404 content_length= content_type=text/html elapsed=19ms

