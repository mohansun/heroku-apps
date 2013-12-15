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

