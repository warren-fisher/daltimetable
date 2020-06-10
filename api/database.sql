DROP SCHEMA daltimetable;
CREATE SCHEMA IF NOT EXISTS daltimetable;
USE daltimetable;

CREATE TABLE department (
    D_CODE VARCHAR(4) UNIQUE,
    D_NAME VARCHAR(64),
    PRIMARY KEY (D_CODE)
);

CREATE TABLE classInfo (
    C_CRN SMALLINT(5) UNIQUE,
    C_NAME VARCHAR(64) NOT NULL,
    D_CODE VARCHAR(4) NOT NULL,
    C_CODE SMALLINT(5) NOT NULL,
    C_DAYS VARCHAR(5) NOT NULL,
    C_TIMESTART TIME NOT NULL,
    C_TIMEEND TIME NOT NULL,
    C_CREDIT_HRS SMALLINT(2),
    C_SIZE SMALLINT(3),
    C_NUM_REGISTERED SMALLINT(3),
    C_PROF VARCHAR(64),
    PRIMARY KEY (C_CRN),
    FOREIGN KEY (D_CODE) REFERENCES department (D_CODE)
);

CREATE TABLE labInfo (
    L_CRN SMALLINT(5),
    L_DAYS VARCHAR(5),
    L_TIMESTART TIME,
    L_TIMEEND TIME,
    L_SIZE SMALLINT(3),
    L_NUM_REGISTERED SMALLINT(3),
    L_IS_TUTORIAL TINYINT(1),
    C_CRN SMALLINT(5),
    PRIMARY KEY (L_CRN, C_CRN),
    FOREIGN KEY (C_CRN) REFERENCES classInfo (C_CRN)
);

-- CREATE TABLE term (
--         C_CRN SMALLINT(5) UNIQUE,
--         C_YEAR SMALLINT(4),
--         C_TERM VARCHAR(6),
--         PRIMARY KEY (C_CRN),
--         FOREIGN KEY (C_CRN) REFERENCES classInfo (C_CRN)
-- )
###############################################################
###################### Actuarial Science ######################
###############################################################
INSERT INTO department VALUES ('ACSC','Actuarial Science');

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20031, 3703, 'Actuarial Models I', 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20032, 3720, 'Life Contingencies I', 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24252, 4703, 'Actuarial Models II', 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);

#####################################################
###################### Anatomy ######################
#####################################################
INSERT INTO department VALUES ('ANAT','Anatomy');

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20046, 3010, 'Introductory Human Anatomy', 'ANAT', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20047, 3421, 'Comparative Vert. Histology', 'ANAT', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20048, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20047);
        
INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20049, 4010, 'Advanced Human Anatomy', 'ANAT', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20050, 'TR', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20049);
        
INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23432, 5100Y, 'Human Neuroanatomy', 'ANAT', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);

####################################################
###################### Arabic ######################
####################################################
INSERT INTO department VALUES ('ARBC','Arabic');

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20115, 1022, 'Introduction to Arabic II', 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20116, 2022, 'Intermediate Arabic II', 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20117, 2100, 'A Cultural Intro to Arab World', 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
