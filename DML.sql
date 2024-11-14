-- Queries created to handle data manipulation via CRUD -- 
-- Data to be entered by backend program indicated by *


-- Queries for Users entity
-- READ query 
SELECT userId, userName, dateCreated, email
FROM Users;
-- CREATE query 
INSERT INTO Users (userId, userName, dateCreated, email)
VALUES (*userId, *userName, *dateCreated, *email);
-- DELETE query 
DELETE FROM Users 
WHERE userId = *user_Id_selected;
-- UPDATE query
SELECT userId, userName, dateCreated, email
FROM Users
WHERE userId = *user_Id_selected

UPDATE Users
SET userName = *userName_input, dateCreated = *date_input, email = *email_input;


-- Queries for Followers entity
-- READ query 
SELECT followerId, Followers.userId, isGainedFollower, followerCount, dateFollowed
FROM Followers;
-- CREATE query 
INSERT INTO Followers (followerId, Followers.userId, isGainedFollower, followerCount, dateFollowed)
VALUES (*followerId, *Followers.userId, *isGainedFollower, *followerCount, *dateFollowed);
-- DELETE query 
DELETE FROM Followers 
WHERE userId = *followerId_selected;
-- UPDATE query
SELECT followerId, Followers.userId, isGainedFollower, followerCount, dateFollowed
FROM Followers
WHERE followerId = *followerId_selected

UPDATE Followers
SET userId = *userID_input, isGainedFollower = *isGainedFollower, followerCount = *followerCount, dateFollowed = *dateFollowed;


-- Query for Following entity
--READ query 
SELECT followingId, Following.userId, totalFollowingCount, dateFollowing
FROM Following;
-- CREATE query 
INSERT INTO Following (followingId, Following.userId, totalFollowingCount, dateFollowing)
VALUES (*followingId, *Following.userId, *totalFollowingCount, *dateFollowing);
-- DELETE query 
DELETE FROM Following 
WHERE followingId = *followingId_selected;
-- UPDATE query
SELECT followingId, Following.userId, totalFollowingCount, dateFollowing
FROM Following
WHERE followingId = *followingId_selected

UPDATE Following
SET followingId = *followingId_input, Following.userId = *Following.userId_input, totalFollowingCount = *totalFollowingCount, dateFollowing = *dateFollowing;