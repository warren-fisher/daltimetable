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