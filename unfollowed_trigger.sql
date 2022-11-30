
# DROP TABLE unfollows;
# DROP TRIGGER create_unfollow;


CREATE TABLE unfollows (
    unfollower_id INTEGER NOT NULL,
    unfollowed_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(unfollower_id) REFERENCES users(id),
    FOREIGN KEY(unfollowed_id) REFERENCES users(id),
    PRIMARY KEY(unfollower_id, unfollowed_id)
);

DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET unfollower_id = OLD.follower_id,
        unfollowed_id = OLD.followee_id;
END$$

DELIMITER ;

# Test it:

# DESC unfollows;
# SELECT * FROM unfollows;
# SELECT * FROM follows;
# SELECT * FROM follows WHERE follower_id = 100 AND followee_id = 99;
# DELETE FROM follows WHERE follower_id = 100 AND followee_id = 99;

