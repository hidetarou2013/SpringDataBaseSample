# SpringSpringDataBaseSample

Spring + Hibernate Sample

このアプリケーションは、DBとしてMySQLかCassandraを想定しています。

MySQLでの動作は確認済みで、正常動作します。

Cassandraの場合の構築は現在奮闘中で、未完成。障害はこのリポジトリのissueに記載しています。
障害対応にアドバイスを募集中です。

**Cassandraでの調査は、feature/cassandra_1　にて行っております。**

+ repository_name:SpringDataBaseSample
+ project_name:SpringDataBaseSample
+ project_type:Spring Web MVC
+ toplevel_package:com.example.springdadabasesample


## 開発環境

IDE:pleiades-e4.5
java-version:1.8
javac-version:1.8
Tomcat:8.0.26
maven-compiler-plugin:2.5.1
org.springframework-version:34.0.3.RELEASE
hibernate.version:4.3.6.Final

MySQL:5.7
Cassandra:2.1.16 or 3.9

## データベースサンプル

database_name:spring_database

DDLやCSVデータは erd フォルダに格納してあります。

DBサーバの構築はDockerで準備します。

### MySQL の場合の構築例

```
$ docker create --name mysqld_spring_database_storage hidetarou2013/mysql-storage
$ docker run --volumes-from mysqld_spring_database_storage --name mysqld_spring_database -p 13306:3306 -e MYSQL_ROOT_PASSWORD=xxxx -e MYSQL_USER=kenshuu -e MYSQL_PASSWORD=kenshuu -e MYSQL_DATABASE=spring_database -d hidetarou2013/mysql-server:BASE
$ docker cp spring_database_dump20161209.sql mysqld_spring_database:/tmp/spring_database_dump20161209.sql
$ docker-enter mysqld_spring_database

# mysql -uroot -p spring_database < /tmp/spring_database_dump20161209.sql

```

### Cassandra の場合の構築例

3.x 系と2.x系で調査しています。


```
$ docker run --name cassandra_3_9 -d -p 7000:7000 -p 7199:7199 -p 9042:9042 -p 9160:9160 cassandra:3.9
$ docker run --name cassandra_2_1_16 -d -p 7000:7000 -p 7199:7199 -p 9042:9042 -p 9160:9160 cassandra:2.1.16
```

+ KEYSPACE：spring_database
+ COLUMN FAMILIY:departments,employees

### cqlshにて、KEYSPACE、テーブル（COLUMN FAMILIY）作成＆データ登録

cat spring_database.cql

```
CREATE KEYSPACE spring_database WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 };
USE spring_database;

CREATE TABLE departments
(
    department_id varint PRIMARY KEY,
    department_name text
);


CREATE TABLE employees
(
    employee_id varint PRIMARY KEY,
    employee_name text,
    employee_phone text,
    employee_email text,
    department_id varint
);


CREATE INDEX department_name ON departments ( department_name );

CREATE INDEX employee_name ON employees ( employee_name );
CREATE INDEX employee_phone ON employees ( employee_phone );
CREATE INDEX employee_email ON employees ( employee_email );
CREATE INDEX department_id ON employees ( department_id );

INSERT INTO departments (department_id, department_name) VALUES (10, 'accounting');
INSERT INTO departments (department_id, department_name) VALUES (20, 'personal');
INSERT INTO departments (department_id, department_name) VALUES (30, 'general');
INSERT INTO departments (department_id, department_name) VALUES (40, 'development');
INSERT INTO departments (department_id, department_name) VALUES (50, 'secretary');

SELECT * FROM departments;

INSERT INTO employees (employee_id, employee_name,employee_phone,employee_email,department_id) VALUES (1, 'Taro Yamada','090-0000-9999','t-yamada@ken.jp',10);
INSERT INTO employees (employee_id, employee_name,employee_phone,employee_email,department_id) VALUES (2, 'Kenichi Suzuki','090-9999-0000','k-suzuki@ken.jp',20);
INSERT INTO employees (employee_id, employee_name,employee_phone,employee_email,department_id) VALUES (3, 'Ichiro Ueda','090-1234-5678','i-ueda@ken.jp',30);
INSERT INTO employees (employee_id, employee_name,employee_phone,employee_email,department_id) VALUES (4, 'Hideaki Ito','090-9988-7766','h-ito@ken.jp',40);
INSERT INTO employees (employee_id, employee_name,employee_phone,employee_email,department_id) VALUES (5, 'Syouji Inoue','090-8765-4321','s-inoue@ken.jp',50);

SELECT * FROM employees;

```

### csqsh にてログイン後DDLのロード

```
$ docker cp /vagrant/spring_database.cql cassandra_3_9:/tmp/spring_database.cql
$ docker-enter cassandra_3_9

# ls -l /tmp
# cqlsh
cqlsh> SOURCE '/tmp/spring_database.cql'
```

### flush にて書き込み

```
$ nodetool -h 127.0.0.1 flush
```


## Git

### Remote Repository

```
$ git clone git@github.com:hidetarou2013/SpringDataBaseSample.git
```

### Local Repository

for example)
user_account:kenXX

```
$ git fetch origin
$ git checkout develop
$ git checkout -b feature/kenXX
```

develop

```
$ git add -A
$ git commit -m "refs #1 develop xxx xxx."
$ git push origin feature/kenXX
```

announce other Member

## Application URL

+ http://localhost:8080/springdatabasesample/empList
+ http://localhost:8080/springdatabasesample/deptList
