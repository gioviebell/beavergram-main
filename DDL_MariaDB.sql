DROP DATABASE IF EXISTS beavergram;
CREATE DATABASE beavergram;
USE beavergram;

CREATE TABLE Users
(
    userId int AUTO_INCREMENT UNIQUE NOT NULL, 
    userName varchar(50),
    dateCreated date NOT NULL,
    email varchar(75) UNIQUE NOT NULL,
    PRIMARY KEY(userId)
);

CREATE TABLE Followers 
(
    followerId int AUTO_INCREMENT UNIQUE NOT NULL,
    userId int,
    dateFollowerLost date,
    isGainedFollower TINYINT(1),
    followerCount int NOT NULL,
    dateFollowed date, 
    PRIMARY KEY(followerId),
    FOREIGN KEY(userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE Following
(
    followingId int AUTO_INCREMENT UNIQUE NOT NULL,
    userId int,
    followingCount int NOT NULL,
    dateFollowing date NOT NULL,
    PRIMARY KEY (followingId),
    FOREIGN KEY(userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE ProfileEngagements
(
    profileEngagementID int AUTO_INCREMENT NOT NULL,
    totalPost int NOT NULL,
    totalProfileLike int NOT NULL,
    totalView int NOT NULL,
    totalComment int NOT NULL,
    PRIMARY KEY(profileEngagementID)
);

CREATE TABLE PostEngagements
(
    postId int AUTO_INCREMENT NOT NULL,
    userId int,
    totalPostLike int NOT NULL,
    totalPostComment int NOT NULL,
    totalPostView int NOT NULL,
    datePosted date not NULL,
    PRIMARY KEY(postId),
    FOREIGN KEY(userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE UserFollowers
(
    userFollowerId int AUTO_INCREMENT NOT NULL,
    userId int,
    followerId int,
    PRIMARY KEY(userFollowerId),
    FOREIGN KEY(followerId) REFERENCES Followers(followerId) ON DELETE CASCADE,
    FOREIGN KEY(userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE UserFollowing
(
    userFollowingId int AUTO_INCREMENT NOT NULL,
    userId int,
    followingId int,
    PRIMARY KEY(userFollowingId),
    FOREIGN KEY(followingId) REFERENCES Following(followingId) ON DELETE CASCADE,
    FOREIGN KEY (userId) REFERENCES Users(userId) ON DELETE CASCADE
);

CREATE TABLE UserPosts 
(
    userPostId int AUTO_INCREMENT NOT NULL,
    userId int, 
    postId int, 
    PRIMARY KEY(userPostId),
    FOREIGN KEY(userId) REFERENCES Users(userId) ON DELETE CASCADE,
    FOREIGN KEY(postId) REFERENCES PostEngagements(postId) ON DELETE CASCADE
);

DESCRIBE UserFollowing;
DESCRIBE UserFollowers;
DESCRIBE ProfileEngagements;
DESCRIBE Following;
DESCRIBE Followers;
DESCRIBE Users;

INSERT into Users (userName, dateCreated, email)
VALUES
('Benny Beaver', '2020-01-01', 'bennybeaver@osu.com'),
('Moo Deng', '2020-01-01', 'moodeng@osu.com'),
('Pesto Penguin', '2020-01-01', 'pestopenguin@osu.com');

INSERT into Following (userId, followingCount, dateFollowing)
VALUES
(1, 1, '2020-01-01'),
(2, 2, '2020-01-01'),
(3, 0, '2020-01-01');

INSERT into Followers (userId, followerCount, dateFollowed)
VALUES
(1, 1, '2020-01-01'),
(2, 1, '2020-01-02'),
(3, 1, '2020-01-01');

INSERT into ProfileEngagements(totalPost, totalProfileLike, totalView, totalComment)
VALUES
(10, 100, 1000, 5),
(1, 10, 100, 1),
(0, 0, 0, 0);

INSERT into PostEngagements(totalPostLike, totalPostComment, totalPostView, datePosted)
VALUES
(5, 1, 10, '2020-01-02'),
(10, 0, 100, '2020-01-02'),
(25, 10, 20, '2020-01-02');

SELECT * FROM Users;
SELECT * FROM Followers;
SELECT * FROM Following;
SELECT * FROM ProfileEngagements;
SELECT * FROM PostEngagements;
SELECT * FROM UserFollowers;
SELECT * FROM UserFollowing;