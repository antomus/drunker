-- liquibase formatted sql
-- changeset antomus:create-users-table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL DEFAULT '',
    lastName VARCHAR(255) NOT NULL DEFAULT '',
    superadmin BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback users

-- changeset antomus:create-reviews-table
CREATE TABLE IF NOT EXISTS reviews (
     id INT AUTO_INCREMENT PRIMARY KEY,
     rating INTEGER DEFAULT 0,
     description varchar(5000) NOT NULL DEFAULT '',
     amount BIGINT DEFAULT 0,
     userId INTEGER NOT NULL,
     createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback reviews

-- changeset antomus:create-news-table
CREATE TABLE IF NOT EXISTS news (
   id INT AUTO_INCREMENT PRIMARY KEY,
   category VARCHAR(255) NOT NULL DEFAULT 'general',
   title VARCHAR(255),
   description VARCHAR(5000),
   restaurantId INTEGER NOT NULL,
   createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback news

-- changeset antomus:create-comments-table
CREATE TABLE IF NOT EXISTS comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(5000) NOT NULL DEFAULT '',
    restaurantId INTEGER NOT NULL,
    userId INTEGER NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback comments

-- changeset antomus:create-restaurants-table
CREATE TABLE IF NOT EXISTS restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description varchar(5000) NOT NULL DEFAULT '',
    schedule VARCHAR(1000) NOT NULL DEFAULT '',
    averageAmount BIGINT,
    moderated BOOLEAN DEFAULT FALSE,
    adminId INTEGER NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback restaurants

-- changeset antomus:create-views-table
CREATE TABLE IF NOT EXISTS views (
   id INT AUTO_INCREMENT PRIMARY KEY,
   restaurantId INTEGER NOT NULL,
   createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE
-- rollback views


