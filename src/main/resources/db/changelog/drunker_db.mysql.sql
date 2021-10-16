-- liquibase formatted sql
-- changeset antomus:create-users-table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(255) NOT NULL DEFAULT '',
    lastName VARCHAR(255) NOT NULL DEFAULT '',
    superadmin BOOLEAN DEFAULT FALSE,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE users

-- changeset antomus:create-reviews-table
CREATE TABLE IF NOT EXISTS reviews (
     id BIGINT AUTO_INCREMENT PRIMARY KEY,
     rating INTEGER DEFAULT 0,
     description varchar(5000) NOT NULL DEFAULT '',
     amount BIGINT DEFAULT 0,
     userId BIGINT NOT NULL,
     createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE reviews

-- changeset antomus:create-news-table
CREATE TABLE IF NOT EXISTS news (
   id BIGINT AUTO_INCREMENT PRIMARY KEY,
   category VARCHAR(255) NOT NULL DEFAULT 'general',
   title VARCHAR(255),
   description VARCHAR(5000),
   restaurantId BIGINT NOT NULL,
   createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE news

-- changeset antomus:create-comments-table
CREATE TABLE IF NOT EXISTS comments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(5000) NOT NULL DEFAULT '',
    restaurantId BIGINT NOT NULL,
    userId BIGINT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE comments

-- changeset antomus:create-restaurants-table
CREATE TABLE IF NOT EXISTS restaurants (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description varchar(5000) NOT NULL DEFAULT '',
    schedule VARCHAR(1000) NOT NULL DEFAULT '',
    averageAmount BIGINT,
    moderated BOOLEAN DEFAULT FALSE,
    adminId BIGINT NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE restaurants

-- changeset antomus:create-views-table
CREATE TABLE IF NOT EXISTS views (
   id BIGINT AUTO_INCREMENT PRIMARY KEY,
   restaurantId INTEGER NOT NULL,
   createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
)  ENGINE=INNODB;
-- rollback DROP TABLE

-- changeset antomus:add-email-to-users-table
ALTER TABLE users ADD email VARCHAR(255) NOT NULL AFTER `id`;
-- rollback ALTER  TABLE  users  DROP  COLUMN  email;

-- changeset antomus:add-password-to-users-table
ALTER TABLE users ADD password VARCHAR(255) NOT NULL AFTER `id`;
-- rollback ALTER  TABLE  users  DROP  COLUMN  password;

-- changeset antomus:remove-superadmin-from-users-table
ALTER  TABLE  users  DROP  COLUMN  superadmin;
-- rollback ALTER  TABLE  users  ADD  COLUMN  superadmin BOOLEAN NOT NULL;

-- changeset antomus:add-role-to-users-table
ALTER TABLE users ADD role VARCHAR(255) NOT NULL DEFAULT '';
-- rollback ALTER  TABLE  users  DROP  COLUMN  role;


