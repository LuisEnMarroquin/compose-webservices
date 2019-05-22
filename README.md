# MySQL
```bash
# Get inside container
docker exec -it wordpress_db_1 /bin/bash
# Login into MySQL as root
mysql -p # Will show you an interactive prompt to enter your password
mysql -pp92ls8qkau28 # Add your password in the same line // No space between -p and the password text 
# Login into MySQL as user
mysql -u exampleuser -h localhost -p
mysql -u exampleuser -h localhost -pp92ls8qkau28
```