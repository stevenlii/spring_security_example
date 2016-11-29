-- 资源
CREATE TABLE resc(
    id BIGINT,
    NAME VARCHAR(50),
    res_type VARCHAR(50),
    res_string VARCHAR(200),
    priority INTEGER,
    descn VARCHAR(200)
);
ALTER TABLE resc ADD CONSTRAINT pk_resc PRIMARY KEY(id);
ALTER TABLE resc MODIFY id BIGINT AUTO_INCREMENT;


-- 角色
CREATE TABLE role(
    id BIGINT,
    NAME VARCHAR(50),
    descn VARCHAR(200)
);
ALTER TABLE role ADD CONSTRAINT pk_role PRIMARY KEY(id);
ALTER TABLE role MODIFY id BIGINT AUTO_INCREMENT;


-- 用户
CREATE TABLE USER(
    id BIGINT,
    username VARCHAR(50),
    PASSWORD VARCHAR(50),
    STATUS INTEGER,
    descn VARCHAR(200)
);
ALTER TABLE USER ADD CONSTRAINT pk_user PRIMARY KEY(id);
ALTER TABLE USER MODIFY id BIGINT AUTO_INCREMENT;

-- 资源角色连接表
CREATE TABLE resc_role(
    resc_id BIGINT,
    role_id BIGINT
);
ALTER TABLE resc_role ADD CONSTRAINT pk_resc_role PRIMARY KEY(resc_id, role_id);
ALTER TABLE resc_role ADD CONSTRAINT fk_resc_role_resc FOREIGN KEY(resc_id) REFERENCES resc(id);
ALTER TABLE resc_role ADD CONSTRAINT fk_resc_role_role FOREIGN KEY(role_id) REFERENCES role(id);

-- 用户角色连接表
CREATE TABLE user_role(
    user_id BIGINT,
    role_id BIGINT
);
ALTER TABLE user_role ADD CONSTRAINT pk_user_role PRIMARY KEY(user_id, role_id);
ALTER TABLE user_role ADD CONSTRAINT fk_user_role_user FOREIGN KEY(user_id) REFERENCES USER(id);
ALTER TABLE user_role ADD CONSTRAINT fk_user_role_role FOREIGN KEY(role_id) REFERENCES role(id);
        
        
        
INSERT INTO USER(id,username,PASSWORD,STATUS,descn) VALUES(1,'admin','admin',1,'管理员');
INSERT INTO USER(id,username,PASSWORD,STATUS,descn) VALUES(2,'user','user',1,'用户');

INSERT INTO role(id,NAME,descn) VALUES(1,'ROLE_ADMIN','管理员角色');
INSERT INTO role(id,NAME,descn) VALUES(2,'ROLE_USER','用户角色');

INSERT INTO resc(id,NAME,res_type,res_string,priority,descn) VALUES(1,'','URL','/admin.jsp',1,'');
INSERT INTO resc(id,NAME,res_type,res_string,priority,descn) VALUES(2,'','URL','/**',2,'');

INSERT INTO resc_role(resc_id,role_id) VALUES(1,1);
INSERT INTO resc_role(resc_id,role_id) VALUES(2,1);
INSERT INTO resc_role(resc_id,role_id) VALUES(2,2);

INSERT INTO user_role(user_id,role_id) VALUES(1,1);
INSERT INTO user_role(user_id,role_id) VALUES(1,2);
INSERT INTO user_role(user_id,role_id) VALUES(2,2);