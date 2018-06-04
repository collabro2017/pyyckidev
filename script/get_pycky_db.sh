heroku pg:backups capture -a pycky

curl -o latest.dump `heroku pg:backups public-url -a pycky`

pg_restore --verbose --clean --no-acl --no-owner -h localhost -d pycky_development latest.dump

rm ./latest.dump