rm index.html
git commit -am "update"
git push origin master
elm make src/Main.elm
git add .
git commit -m "deploying"
git push origin master
