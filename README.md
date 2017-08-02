## Benchmark used
https://github.com/mongodb/mongo-perf.git

## add users to mongodb
```
use admin
db.createUser( { user: "someuser",
                 pwd: "somepassword",
                  roles: [ { role: "clusterAdmin", db: "admin" },
                           { role: "readAnyDatabase", db: "admin" },
                           "readWrite"] },
                { w: "majority" , wtimeout: 5000 } )
```
## run benchmark (in docker container or not)
```
./run.sh mongo-host.com user password rs0 report-launcher.json
./run.sh mongo-host2.com user2 password2 rs0 report-launcher-our.json
```
## parse and plot results
```
cp report* plot/ 
cd plot && ./parse.sh
display *.png
```
