ALTER TABLE posts ADD INDEX posts_user_id_index(user_id);
ALTER TABLE comments ADD INDEX comments_user_id_index(user_id);
ALTER TABLE comments ADD INDEX comments_post_id_index(post_id);
