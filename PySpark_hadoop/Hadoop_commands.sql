-----------------------------------------------------
hadoop:
-----------------------------------------------------
hadoop version


hdfs dfs -mkdir new_dir_11
hdfs dfs -ls /user/santanukolkata_yahoo

hdfs dfs -rmdir new_dir_20
hdfs dfs -ls /user/santanukolkata_yahoo
-----------------------------------------------------
mysql:
-----------------------------------------------------

mysql -u cloudera123 -p

Command :mysql -u labuser -p
Username : labuser
Password : simplilearn

CREATE DATABASE santanudb;
use santanudb;

create table emp576ok(Id INT NOT NULL, Name VARCHAR(100) NOT NULL, Salary INT NOT NULL, Department VARCHAR(100) NOT NULL, Designation VARCHAR(100) NOT NULL, PRIMARY KEY(Id));

insert into emp576ok values(201,"john",5000,"It","Developer");

insert into emp576ok values(202,"jack",6000,"sales","Manager");

insert into emp576ok values(203,"peter",7000,"support","Director");

insert into emp576ok values(205,"peterr",7000,"support","Director");

-----------------------------------------------------
scoop:
-----------------------------------------------------
sqoop import --connect jdbc:mysql://ip-10-0-1-10.ec2.internal/santanudb --username labuser --password simplilearn --table emp576ok -m 2 --target-dir '/user/santanukolkata_yahoo/sqoop_sql8_okemp'

sqoop import --connect jdbc:mysql://ip-10-0-1-10.ec2.internal/santanudb --username labuser --password simplilearn --table emp576ok -m 1 --where "Salary > 5000" --target-dir '/user/santanukolkata_yahoo/sqoop_sql8_okemp'