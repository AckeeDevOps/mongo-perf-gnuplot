## add users to db
```
use admin
db.createUser( { user: "someuser",
                 pwd: "somepassword",
                  roles: [ { role: "clusterAdmin", db: "admin" },
                           { role: "readAnyDatabase", db: "admin" },
                           "readWrite"] },
                { w: "majority" , wtimeout: 5000 } )
```
