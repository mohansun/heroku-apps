heroku create
#developer1:~/mohansun/heroku/app] $heroku create
#Creating pacific-stream-5581... done, stack is cedar
#http://pacific-stream-5581.herokuapp.com/ | git@heroku.com:pacific-stream-5581.git

# GET Started with nodejs
#https://devcenter.heroku.com/articles/getting-started-with-nodejs
# create web.js
npm init

# Now it’s time to install some dependencies like express and logfmt. 
#  Use npm install <pkg> --save to install a package and save it as a dependency in the package.json file.

npm install express logfmt --save

echo web: node web.js > Procfile
