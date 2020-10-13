## Docker Setup for WordPress

### Usage

Create an `.env` file and update it accordingly:

    $ cp .env.example .env

Build the containers:

	$ docker-compose up --build

Import the database:

	$ docker exec -it wp_mysql /bin/bash
	root@7ed4c31aa253:/# mysql -u root -p
	Enter password:
	Welcome to the MySQL monitor.  Commands end with ; or \g.
	Your MySQL connection id is 3
	Server version: 5.7.31 MySQL Community Server (GPL)

	Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

	Oracle is a registered trademark of Oracle Corporation and/or its
	affiliates. Other names may be trademarks of their respective
	owners.

	Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

	mysql> use foo;
	Reading table information for completion of table and column names
	You can turn off this feature to get a quicker startup with -A

	Database changed
	mysql> source /home/backup.sql
