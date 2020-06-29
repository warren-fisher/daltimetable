DROP SCHEMA daltimetable;
CREATE SCHEMA IF NOT EXISTS daltimetable;
USE daltimetable;

CREATE TABLE department (
    D_CODE VARCHAR(4) UNIQUE,
    D_NAME VARCHAR(64),
    PRIMARY KEY (D_CODE)
);

CREATE TABLE terms (
    T_CODE SMALLINT(2),
    YR SMALLINT(4),
    TERM VARCHAR(6),
    PRIMARY KEY (T_CODE)
);

CREATE TABLE classInfo (
    C_CRN SMALLINT(5),
    T_CODE SMALLINT(2),
    C_NAME VARCHAR(64) NOT NULL,
    D_CODE VARCHAR(4) NOT NULL,
    C_CODE VARCHAR(6) NOT NULL,
    C_DAYS VARCHAR(5) NOT NULL,
    C_TIMESTART TIME NOT NULL,
    C_TIMEEND TIME NOT NULL,
    C_CREDIT_HRS SMALLINT(2),
    C_SIZE SMALLINT(3),
    C_NUM_REGISTERED SMALLINT(3),
    C_PROF VARCHAR(64),
    PRIMARY KEY (C_CRN, T_CODE),
    FOREIGN KEY (D_CODE) REFERENCES department (D_CODE),
    FOREIGN KEY (T_CODE) REFERENCES terms (T_CODE)
);

CREATE TABLE labInfo (
    L_CRN SMALLINT(5),
    L_DAYS VARCHAR(5),
    L_TIMESTART TIME,
    L_TIMEEND TIME,
    L_SIZE SMALLINT(3),
    L_NUM_REGISTERED SMALLINT(3),
    L_IS_TUTORIAL TINYINT(1),
    T_CODE SMALLINT(2),
    PRIMARY KEY (L_CRN, T_CODE),
    FOREIGN KEY (T_CODE) REFERENCES terms (T_CODE)
);

CREATE TABLE classLabs (
    T_CODE SMALLINT(2),
    C_CRN SMALLINT(5),
    L_CRN SMALLINT(5),
    PRIMARY KEY (T_CODE, C_CRN, L_CRN),
    FOREIGN KEY (C_CRN, T_CODE) REFERENCES classInfo (C_CRN, T_CODE),
    FOREIGN KEY (L_CRN, T_CODE) REFERENCES labInfo (L_CRN, T_CODE),
    FOREIGN KEY (T_CODE) REFERENCES terms (T_CODE)
);

INSERT INTO terms (T_CODE, YR, TERM) VALUES (4, 2020, 'Summer');

INSERT INTO terms (T_CODE, YR, TERM) VALUES (5, 2020, 'Fall');

INSERT INTO terms (T_CODE, YR, TERM) VALUES (6, 2021, 'Winter');

###############################################################
###################### Actuarial Science ######################
###############################################################
INSERT INTO department VALUES ('ACSC','Actuarial Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20037, 6, '3703', 'Actuarial Models I', 'ACSC', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20038, 6, '3720', 'Life Contingencies I', 'ACSC', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

#####################################################
###################### Anatomy ######################
#####################################################
INSERT INTO department VALUES ('ANAT','Anatomy');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10042, 5, '1010', 'Basic Human Anatomy', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10045, 5, '1020', 'Basic Human Anatomy', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10046, 5, '2160', 'Intro to Human Histology', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10047, 5, 'F', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10046, 10047);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13093, 5, '5135', 'Topics in Mammalian Embryology', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13094, 5, '5217', 'Functional Human Anat', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13095, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13094, 13095);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20052, 6, '3010', 'Introductory Human Anatomy', 'ANAT', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20053, 6, '3421', 'Comparative Vert. Histology', 'ANAT', 'WF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20054, 6, 'F', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20053, 20054);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20055, 6, '4010', 'Advanced Human Anatomy', 'ANAT', 'TR',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20056, 6, 'TR', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20055, 20056);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22803, 6, '5135', 'Topics in Mammalian Embryology', 'ANAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

####################################################
###################### Arabic ######################
####################################################
INSERT INTO department VALUES ('ARBC','Arabic');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20119, 6, '1022', 'Introduction to Arabic II', 'ARBC', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20120, 6, '2022', 'Intermediate Arabic II', 'ARBC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20121, 6, '2100', 'A Cultural Intro to Arab World', 'ARBC', 'MW',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

##########################################################
###################### Architecture ######################
##########################################################
INSERT INTO department VALUES ('ARCH','Architecture');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20123, 6, '1002', 'Intro to Architecture 2', 'ARCH', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20124, 6, '1202', 'Sci of the Built Environment 2', 'ARCH', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20125, 6, '2502', 'Design Communication 2', 'ARCH', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20126, 6, '3002', 'Design', 'ARCH', 'MR',
        TIME(STR_TO_DATE('<br />1405-1525<br />1405-1725<br />1405-1725', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20128, 6, '3208', 'Building Technology', 'ARCH', 'W',
        TIME(STR_TO_DATE('<br />0935-1225<br />1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24171, 6, '3302', 'Professional Practice', 'ARCH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20129, 6, '3502', 'Representation', 'ARCH', 'T',
        TIME(STR_TO_DATE('<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20130, 6, '4005', 'Design', 'ARCH', 'TF',
        TIME(STR_TO_DATE('<br />1405-1525<br />1405-1725<br />1405-1725', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20131, 6, '4113', 'Architect Theory & Interpretat', 'ARCH', 'M',
        TIME(STR_TO_DATE('<br />1135-1255<br />0835-1125<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24172, 6, '4304', 'Professional Practice', 'ARCH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20133, 6, '4502', 'Representation', 'ARCH', 'W',
        TIME(STR_TO_DATE('<br />0835-1125<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22804, 6, '5210', 'Life Cycle Analysis', 'ARCH', 'TW',
        TIME(STR_TO_DATE('<br />0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24173, 6, '5311', 'Professional Practice.', 'ARCH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22807, 6, '6123', 'Humanities Seminar', 'ARCH', 'R',
        TIME(STR_TO_DATE('<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22808, 6, '6504', 'Montage in Architecture', 'ARCH', 'M',
        TIME(STR_TO_DATE('<br />1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

####################################################################
###################### Arts & Social Sciences ######################
####################################################################
INSERT INTO department VALUES ('ASSC','Arts & Social Sciences');

#########################################################################
###################### Biochem & Molecular Biology ######################
#########################################################################
INSERT INTO department VALUES ('BIOC','Biochem & Molecular Biology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10180, 5, '3700', 'Biomolecular Chemistry', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10181, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10182, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10180, 10181);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10180, 10182);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10183, 5, '4001', 'Spec Top in Biochem: Indepndnt', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10184, 5, '4302', 'Biochemistry of Lipids', 'BIOC', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10185, 5, '4404', 'Gene Expression', 'BIOC', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10187, 5, '4604', 'Research Project I', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10188, 5, '4605', 'Research Project II', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10191, 5, '4813', 'Biochemistry of Clinical Disor', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13113, 5, '5001', 'Spec Top in Biochem: Indepndnt', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13118, 5, '5503', 'Pathobiology of Cancer', 'BIOC', 'TR',
        TIME(STR_TO_DATE('1405-1555', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13122, 5, '5914', 'Sci Com Bioc & Molec Biol I', 'BIOC', 'T',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20159, 6, '1420', 'Introductory Biochemistry', 'BIOC', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20160, 6, '2300', 'Introduction to Biochemistry', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20161, 6, '2610', 'Intro Biochemistry Lab', 'BIOC', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20162, 6, '2610', 'Intro Biochemistry Lab', 'BIOC', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20163, 6, '2610', 'Intro Biochemistry Lab', 'BIOC', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20164, 6, '3300', 'Intermediary Metabolism', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20165, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20166, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20164, 20165);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20164, 20166);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20168, 6, '4001', 'Spec Top in Biochem: Indepndnt', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20170, 6, '4305', 'Mechansms of Sig. Transduction', 'BIOC', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20171, 6, '4403', 'Genes and Genomes', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20172, 6, '4604', 'Research Project I', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20173, 6, '4605', 'Research Project II', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20174, 6, '4701', 'Enzymes', 'BIOC', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20175, 6, '4835', 'Human Genetics', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20176, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20175, 20176);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22811, 6, '5001', 'Spec Top in Biochem: Indepndnt', 'BIOC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22812, 6, '5308', 'Human Complex Diseases', 'BIOC', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22813, 6, '5403', 'Genes and Genomes', 'BIOC', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22814, 6, '5701', 'Enzymes', 'BIOC', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22815, 6, '5915', 'Sci Com  Bioc & Molec Biol II', 'BIOC', 'T',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

####################################################################
###################### Biological Engineering ######################
####################################################################
INSERT INTO department VALUES ('BIOE','Biological Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13125, 5, '6700', 'Directed Studies I', 'BIOE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13126, 5, '7700', 'Directed Studies II', 'BIOE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24296, 6, '6000', 'Small Watershed Hydrology', 'BIOE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#####################################################
###################### Biology ######################
#####################################################
INSERT INTO department VALUES ('BIOL','Biology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10234, 5, '2003', 'Animal Diversity', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10235, 5, 'T', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10236, 5, 'T', TIME(STR_TO_DATE('1505-1755', '%k%i')),
        TIME(STR_TO_DATE('1505', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10237, 5, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10238, 5, 'W', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10239, 5, 'R', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10240, 5, 'F', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10235);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10236);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10237);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10238);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10239);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10234, 10240);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10241, 5, '2020', 'Cell Biology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10242, 5, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10244, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10245, 5, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10246, 5, 'W', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10247, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10248, 5, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10249, 5, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10250, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10251, 5, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10252, 5, 'W', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10253, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10254, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10242);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10244);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10245);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10246);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10247);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10248);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10249);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10250);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10251);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10252);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10253);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10241, 10254);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10255, 5, '2030', 'Genetics and Molecular Biology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10256, 5, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10257, 5, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10258, 5, 'W', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10259, 5, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10260, 5, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10261, 5, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10262, 5, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10263, 5, 'W', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10264, 5, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10265, 5, 'R', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10266, 5, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10267, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10268, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10269, 5, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10270, 5, 'F', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10271, 5, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10272, 5, 'R', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10273, 5, 'T', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10274, 5, 'R', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10275, 5, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10276, 5, 'W', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10277, 5, 'T', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10278, 5, 'T', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10279, 5, 'T', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10280, 5, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10281, 5, 'R', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10282, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10256);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10257);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10258);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10259);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10260);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10261);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10262);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10263);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10264);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10265);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10266);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10267);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10268);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10269);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10270);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10271);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10272);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10273);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10274);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10275);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10276);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10277);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10278);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10279);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10280);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10281);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10255, 10282);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10283, 5, '2040', 'Evolution.', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10284, 5, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10285, 5, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10286, 5, 'W', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10287, 5, 'W', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10288, 5, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10289, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10284);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10285);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10286);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10287);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10288);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10283, 10289);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10290, 5, '2060', 'Introductory Ecology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10291, 5, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10292, 5, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10293, 5, 'W', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10294, 5, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10295, 5, 'R', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14241, 5, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10296, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10291);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10292);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10293);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10294);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10295);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 14241);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10290, 10296);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10297, 5, '3046', 'Molecular Evolution', 'BIOL', 'WF',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10298, 5, '3050', 'Developmental Biology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10299, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10300, 5, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10301, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10298, 10299);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10298, 10300);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10298, 10301);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10307, 5, '3061', 'Communities & Ecosystems', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1105-1225', '%k%i')), TIME(STR_TO_DATE('1105', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10308, 5, '3078', 'Animal Physiology Part I', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10309, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10310, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10308, 10309);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10308, 10310);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10311, 5, '3102', 'Microbial Eukaryotes', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1035-1125<br />1035-1225', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10312, 5, 'F', TIME(STR_TO_DATE('1035-1225', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10313, 5, 'F', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10311, 10312);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10311, 10313);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10314, 5, '3221', 'Diversity of Algae', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10315, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10314, 10315);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10316, 5, '3226', 'Economic Botany, Plnts & Civl.', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10317, 5, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10316, 10317);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10318, 5, '3322', 'Parasitology', 'BIOL', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10319, 5, 'R', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10320, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10321, 5, 'T', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10322, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10318, 10319);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10318, 10320);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10318, 10321);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10318, 10322);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10323, 5, '3326', 'Vertebrate Desgn: Evol & Func', 'BIOL', 'TRF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10324, 5, '3430', 'Intro to Human Histology', 'BIOL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10325, 5, 'F', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10324, 10325);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10326, 5, '3761', 'Marine Ecology', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10330, 5, '4001', 'Environmental Impact Assess.', 'BIOL', 'T',
        TIME(STR_TO_DATE('1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10331, 5, 'R', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10330, 10331);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10332, 5, '4020', 'Advanced Cell Biology', 'BIOL', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20215, 6, '2004', 'Diversity of Plants & Microorg', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20216, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20217, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20218, 6, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20219, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20220, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20221, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20222, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20223, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20224, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20216);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20217);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20218);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20219);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20220);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20221);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20222);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20223);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20215, 20224);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20225, 6, '2020', 'Cell Biology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20226, 6, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20227, 6, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20228, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20229, 6, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20230, 6, 'W', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20231, 6, 'R', TIME(STR_TO_DATE('1605-1855', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20232, 6, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20233, 6, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20234, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20235, 6, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20237, 6, 'R', TIME(STR_TO_DATE('1605-1855', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20238, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20226);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20227);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20228);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20229);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20230);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20231);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20232);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20233);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20234);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20235);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20237);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20225, 20238);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20239, 6, '2030', 'Genetics and Molecular Biology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20240, 6, 'M', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20241, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20242, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20243, 6, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20244, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20245, 6, 'M', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20246, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20247, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20248, 6, 'W', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20249, 6, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20250, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20251, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20252, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20253, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20254, 6, 'T', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20255, 6, 'W', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20256, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20257, 6, 'W', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20258, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20259, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20260, 6, 'T', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20261, 6, 'W', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20262, 6, 'M', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20263, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20264, 6, 'R', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20265, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20240);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20241);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20242);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20243);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20244);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20245);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20246);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20247);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20248);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20249);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20250);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20251);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20252);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20253);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20254);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20255);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20256);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20257);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20258);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20259);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20260);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20261);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20262);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20263);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20264);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20239, 20265);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20266, 6, '2040', 'Evolution.', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20267, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20268, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20269, 6, 'W', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20270, 6, 'W', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20271, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20272, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20267);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20268);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20269);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20270);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20271);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20266, 20272);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20273, 6, '2060', 'Introductory Ecology', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20274, 6, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20275, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20276, 6, 'W', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20277, 6, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20278, 6, 'R', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20279, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20280, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20274);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20275);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20276);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20277);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20278);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20279);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20273, 20280);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20281, 6, '3037', 'Life Rewritten: Gene Editing', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20282, 6, '3042', 'Molecular Ecology', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20283, 6, '3044', 'Ecological Genetics', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20284, 6, '3062', 'Behavioural Ecology', 'BIOL', 'TRF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20285, 6, 'TR', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20286, 6, 'TR', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20287, 6, 'WF', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20288, 6, 'MW', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20284, 20285);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20284, 20286);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20284, 20287);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20284, 20288);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20289, 6, '3063', 'Resource Ecology', 'BIOL', 'TF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20290, 6, 'F', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20289, 20290);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20291, 6, '3065', 'Conservation Biology', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20292, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20291, 20292);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20293, 6, '3079', 'Animal Physiology Part II', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20294, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20293, 20294);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20296, 6, '3080', 'Ecology & Evolution Fishes', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20297, 6, '3101', 'Microbial Ecology', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20298, 6, '3225', 'Plants in the Human Landscape.', 'BIOL', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20299, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20298, 20299);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20300, 6, '3301', 'Invertebrate Biology', 'BIOL', 'MTR',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20301, 6, 'W', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20302, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20300, 20301);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20300, 20302);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20304, 6, '3421', 'Comp Vertebrate Histology', 'BIOL', 'WF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20305, 6, 'F', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20304, 20305);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20306, 6, '3580', 'Philosophy of Biology', 'BIOL', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20307, 6, '3601', 'Nature Conservation', 'BIOL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20308, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20309, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20310, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20311, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20312, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20307, 20308);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20307, 20309);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20307, 20310);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20307, 20311);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20307, 20312);

        
####################################################################
###################### Biomedical Engineering ######################
####################################################################
INSERT INTO department VALUES ('BMNG','Biomedical Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13172, 5, '5020', 'Cell and Molecular Biology', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13967, 5, '5060', 'Clinical Technologies', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13173, 5, '5110', 'Biocompat & Biomateri Desgn', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13174, 5, '5210', 'Biomed Inst, Data Acq. & Anal', 'BMNG', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13175, 5, 'M', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13174, 13175);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13176, 5, '5310', 'Biomedical Business I', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13177, 5, '5410', 'Dir Read in Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13178, 5, '5420', 'Directed Read Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13179, 5, '5430', 'Directed Read Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13180, 5, '5500', 'BME MSC Seminar', 'BMNG', 'R',
        TIME(STR_TO_DATE('1205-1355', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13182, 5, '6500', 'BME PhD Seminar', 'BMNG', 'R',
        TIME(STR_TO_DATE('1205-1355', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20329, 6, '3000', 'Technology in Medicine', 'BMNG', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23664, 6, '5060', 'Clinical Technologies', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22864, 6, '5120', 'Biomech Phys & Surg Impnt Dsgn', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22865, 6, '5150', 'Intro to Tissue Engineering', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22866, 6, '5230', 'Biomedical Signals', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22867, 6, '5260', 'Principles of Medical Imaging', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23952, 6, '5270', 'Adv. Cardio Phys.', 'BMNG', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22868, 6, '5410', 'Dir Read in Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22869, 6, '5420', 'Directed Read Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22870, 6, '5430', 'Directed Read Biomedical Eng', 'BMNG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22871, 6, '5500', 'BME MSC Seminar', 'BMNG', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22873, 6, '6500', 'BME PhD Seminar', 'BMNG', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

######################################################
###################### Business ######################
######################################################
INSERT INTO department VALUES ('BUSS','Business');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14569, 5, '6101', 'Research Design and Methods', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14570, 5, '6102', 'Behavioral Statistics', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14571, 5, '6201', 'Theory of Finance', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14572, 5, '6202', 'Seminar in Corporate Finance', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14573, 5, '6301', 'Seminar in Managing People', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14574, 5, '6401', 'Seminar in Marketing I', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14575, 5, '6501', 'MIS Theory and Research', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14567, 5, '7100', 'Master\'s Thesis', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24290, 6, '6103', 'Research Reading & Conference', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24291, 6, '6292', 'Financial Econometrics', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24292, 6, '6293', 'Seminar in Investment', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24293, 6, '6302', 'Seminar in Micro OB', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24294, 6, '6402', 'Seminar in Marketing II', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24295, 6, '6502', 'Seminar in MIS Research', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24288, 6, '7100', 'Master\'s Thesis', 'BUSS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

############################################################
###################### Business Admin ######################
############################################################
INSERT INTO department VALUES ('BUSI','Business Admin');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13968, 5, '5003', 'Pers,Professio Effectiveness I', 'BUSI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14419, 5, '5004', 'Pers,Profess Effectiveness II', 'BUSI', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13190, 5, '5120', 'Public Policy', 'BUSI', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13192, 5, '5201', 'Financial Management', 'BUSI', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13193, 5, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13192, 13193);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13194, 5, '5401', 'Marketing Management', 'BUSI', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13196, 5, '5512', 'Leveraging Technology', 'BUSI', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13197, 5, '5551', 'Operations Management', 'BUSI', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13198, 5, 'T', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13197, 13198);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13199, 5, '5801', 'International Business', 'BUSI', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14509, 5, '5902', 'Starting Lean', 'BUSI', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13200, 5, '6000', 'Strategy & Competitiveness', 'BUSI', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13201, 5, '6006', 'Managing the Family Entrprs', 'BUSI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14232, 5, '6044', 'Patterns for Sust Ind Devl', 'BUSI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13202, 5, '6101', 'External Auditing', 'BUSI', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13203, 5, '6102', 'Taxation', 'BUSI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13204, 5, '6108', 'Adv. Financial Accounting I', 'BUSI', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13206, 5, '6220', 'Risk and Derivatives', 'BUSI', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13207, 5, '6230', 'Investment & Money Management', 'BUSI', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13208, 5, '6240', 'Financial Statement Analysis', 'BUSI', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13210, 5, '6300', 'Risk Mgmt. Financial Instit.', 'BUSI', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23924, 6, '5004', 'Pers,Profess Effectiveness II', 'BUSI', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22884, 6, '6005', 'Strategy Implementation', 'BUSI', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22885, 6, '6006', 'Managing the Family Entrprs', 'BUSI', 'R',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22886, 6, '6007', 'Innovation Management', 'BUSI', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22887, 6, '6009', 'Business & Government', 'BUSI', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22888, 6, '6050', 'Corporate Governance', 'BUSI', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22889, 6, '6106', 'Cost Management', 'BUSI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22890, 6, '6109', 'Adv. Financial Accounting II', 'BUSI', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22891, 6, '6110', 'Adv. Financial Accounting III', 'BUSI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22892, 6, '6207', 'Advanced Corp Finance', 'BUSI', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22896, 6, '6255', 'Global Markets & Institutions', 'BUSI', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22898, 6, '6408', 'Transport Modes', 'BUSI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22901, 6, '6414', 'Global Marketing', 'BUSI', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22902, 6, '6450', 'Marketing Strategy Seminar', 'BUSI', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22903, 6, '6516', 'Data Management', 'BUSI', 'R',
        TIME(STR_TO_DATE('0835-0955<br />1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22904, 6, '6555', 'Supply Chain Management', 'BUSI', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22905, 6, '6942', 'Applied Topics in Business II', 'BUSI', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22906, 6, '6951', 'Research Reading & Conf.', 'BUSI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23923, 6, '6951', 'Research Reading & Conf.', 'BUSI', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

##############################################################
###################### Canadian Studies ######################
##############################################################
INSERT INTO department VALUES ('CANA','Canadian Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10361, 5, '2050', 'Hist. Iss. in Indigenous Stud.', 'CANA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14543, 5, '2272', 'Atlntc Can since Confederation', 'CANA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20334, 6, '1103', 'Halifax and the World Part II.', 'CANA', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20335, 6, '2002', 'Idea of Canada: Cultural & Lit', 'CANA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20337, 6, '2005', 'Intro to African Can. Studies', 'CANA', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20338, 6, '2052', 'Contemp Iss in Indig Studies', 'CANA', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24268, 6, '2235', 'History of Canadian Culture', 'CANA', 'MW',
        TIME(STR_TO_DATE('1535-1655', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20339, 6, '3050', 'Indigenous Practices', 'CANA', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20340, 6, '3052', 'Indigenous Soc Hlth & Env Iss.', 'CANA', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20341, 6, '3270', 'Contemporary Canadian Lit.', 'CANA', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

############################################################################
###################### Centre for Learning & Teaching ######################
############################################################################
INSERT INTO department VALUES ('CNLT','Centre for Learning & Teaching');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22975, 6, '5000', 'Teach. & Learn. in Higher Ed.', 'CNLT', 'R',
        TIME(STR_TO_DATE('1605-1855', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

##################################################################
###################### Chemical Engineering ######################
##################################################################
INSERT INTO department VALUES ('CHEE','Chemical Engineering');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10374, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13244, 5, '7000', 'Spec Top Chem Engr II', 'CHEE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13245, 5, '8500', 'MEng Project', 'CHEE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20344, 6, '2201', 'Fund. of Chemical Engineering', 'CHEE', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24176, 6, 'R', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20344, 24176);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20345, 6, '2203', 'Organic Chem for Chem Engineer', 'CHEE', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20346, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20347, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20345, 20346);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20345, 20347);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20348, 6, '3501', 'Unit Operations Lab II', 'CHEE', 'M',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20349, 6, 'F', TIME(STR_TO_DATE('0835-1225', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20350, 6, 'R', TIME(STR_TO_DATE('0835-1225', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20348, 20349);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20348, 20350);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20351, 6, '3522', 'Mechanical Unit Operation', 'CHEE', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20352, 6, 'R', TIME(STR_TO_DATE('1235-1525', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20351, 20352);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20353, 6, '3525', 'Separation Processes', 'CHEE', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20354, 6, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20353, 20354);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20355, 6, '3530', 'Chem Engr Thermodynamics', 'CHEE', 'WF',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20356, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20355, 20356);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20357, 6, '3540', 'Law & Ethics for Chem Eng.', 'CHEE', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20358, 6, 'R', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20357, 20358);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20359, 6, '3560', 'Green Engineering', 'CHEE', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20360, 6, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20359, 20360);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20363, 6, '4791', 'Research Project I', 'CHEE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20364, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20363, 20364);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20365, 6, '4842', 'Process & Product Design II', 'CHEE', 'T',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20366, 6, 'M', TIME(STR_TO_DATE('1435-1825', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20365, 20366);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20367, 6, '4844', 'Process Simulation & Plnt Dsgn', 'CHEE', 'R',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20368, 6, 'F', TIME(STR_TO_DATE('0835-1225', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20367, 20368);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20369, 6, '4873', 'Industrial Safety & Loss Mgmt.', 'CHEE', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24177, 6, 'R', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20369, 24177);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20370, 6, '4885', 'Polymer Engineering', 'CHEE', 'MW',
        TIME(STR_TO_DATE('1335-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20371, 6, '4892', 'Research Project II', 'CHEE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20372, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20371, 20372);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22925, 6, '8500', 'MEng Project', 'CHEE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

#######################################################
###################### Chemistry ######################
#######################################################
INSERT INTO department VALUES ('CHEM','Chemistry');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10426, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10440, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10441, 5, '2201', 'Introductory Analytical Chem', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10442, 5, 'M', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10443, 5, 'W', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10444, 5, 'R', TIME(STR_TO_DATE('1005-1355', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10445, 5, 'F', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10446, 5, 'T', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10447, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10442);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10443);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10444);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10445);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10446);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10441, 10447);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10448, 5, '2301', 'Intro to Physical Chemistry I', 'CHEM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10450, 5, 'R', TIME(STR_TO_DATE('1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10451, 5, 'F', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10452, 5, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10453, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10448, 10450);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10448, 10451);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10448, 10452);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10448, 10453);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10454, 5, '2401', 'Organic Chemistry I', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10455, 5, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10456, 5, 'T', TIME(STR_TO_DATE('1405-1655', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10457, 5, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10458, 5, 'R', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10459, 5, 'R', TIME(STR_TO_DATE('1405-1655', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10460, 5, 'F', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10461, 5, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14503, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10463, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10455);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10456);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10457);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10458);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10459);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10460);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10461);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 14503);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10454, 10463);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10464, 5, '3103', 'Intermediate Inorganic Chem.', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10465, 5, 'W', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10467, 5, 'F', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10464, 10465);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10464, 10467);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10469, 5, '3301', 'Quantum Mech Chemical Bond', 'CHEM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10470, 5, '3305', 'Materials Science', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10471, 5, 'T', TIME(STR_TO_DATE('1305-1655', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10470, 10471);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10472, 5, '3404', 'Phys Org Chem & Spec', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10473, 5, 'M', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10475, 5, 'R', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10472, 10473);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10472, 10475);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10476, 5, '3801', 'Experiential Learning Chem', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10477, 5, '4102', 'Adv. Transition Metal Chem.', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10478, 5, '4206', 'Analytical Mass Spectrometry', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10479, 5, '4311', 'Electrochemistry', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10480, 5, '4401', 'Synthesis in Organic Chem', 'CHEM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10482, 5, '4801', 'Research Project Chemistry I', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10483, 5, '4802', 'Research Project Chemistry II', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10484, 5, '4902', 'Hon and Maj Research Proj I', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13248, 5, '5102', 'Organotransition Metal Chem', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10485, 5, '5206', 'Bioanalytical Mass Spec.', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20398, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20410, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20411, 6, '2101', 'Introductory Inorganic Chem', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20412, 6, 'R', TIME(STR_TO_DATE('1305-1655', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20413, 6, 'F', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20414, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20411, 20412);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20411, 20413);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20411, 20414);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20415, 6, '2304', 'Intro. Physical Chem II', 'CHEM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20416, 6, 'M', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20417, 6, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20418, 6, 'T', TIME(STR_TO_DATE('1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20419, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20415, 20416);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20415, 20417);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20415, 20418);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20415, 20419);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20420, 6, '2402', 'Organic Chemistry II', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20422, 6, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20423, 6, 'F', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20424, 6, 'W', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20425, 6, 'T', TIME(STR_TO_DATE('1405-1655', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20426, 6, 'M', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24229, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20427, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20422);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20423);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20424);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20425);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20426);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 24229);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20420, 20427);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20428, 6, '3203', 'Advanced Analytical lab', 'CHEM', 'TR',
        TIME(STR_TO_DATE('1335-1725', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20429, 6, '3203', 'Advanced Analytical lab', 'CHEM', 'TR',
        TIME(STR_TO_DATE('0905-1255', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20430, 6, '3203', 'Advanced Analytical lab', 'CHEM', 'MW',
        TIME(STR_TO_DATE('1335-1725', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20431, 6, '3401', 'Intermediate Organic Chem', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20432, 6, 'F', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20434, 6, 'R', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20431, 20432);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20431, 20434);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20435, 6, '3601', 'Chemistry of Living Systems', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20436, 6, '3801', 'Experiential Learning Chem', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24178, 6, '4105', 'Inorg Materials Synthesis', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20437, 6, '4205', 'Chemometrics', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0835-0925<br />0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20438, 6, '4301', 'Theory of Chemical Bonding', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20439, 6, '4402', 'Organ.Struct Determination', 'CHEM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20440, 6, '4801', 'Research Project Chemistry I', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20441, 6, '4802', 'Research Project Chemistry II', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20442, 6, '4903', 'Hon and Maj Research Proj II', 'CHEM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20443, 6, '5105', 'Inorganic Mmaterials Synthesis', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22928, 6, '5205', 'Chemometrics', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('0835-0925<br />0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22929, 6, '5301', 'Theory Chemical Bonding', 'CHEM', 'MWF',
        TIME(STR_TO_DATE('1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

#####################################################
###################### Chinese ######################
#####################################################
INSERT INTO department VALUES ('CHIN','Chinese');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10492, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20448, 6, '1032', 'Intro to Chin (Mandarin) Pt 2', 'CHIN', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20449, 6, '1032', 'Intro to Chin (Mandarin) Pt 2', 'CHIN', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20450, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20448, 20450);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20449, 20450);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20451, 6, '2032', 'Intermed Chin (Mandarin) Pt. 2', 'CHIN', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20452, 6, '3032', 'Adv Chinese (Mandarin), Pt 2', 'CHIN', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

###############################################################
###################### Civil Engineering ######################
###############################################################
INSERT INTO department VALUES ('CIVL','Civil Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10567, 5, '4816', 'Civil Engi Research Project', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13257, 5, '6000', 'Directed Studies-Masters', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13258, 5, '6108', 'Graduate Seminar - Masters', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13259, 5, '6119', 'Highway Materials', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13261, 5, '6156', 'Fibre Reinforced Composites..', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13262, 5, '6414', 'Environ Systems Engineering', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13263, 5, '7000', 'Directed Studies-PhD', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13264, 5, '7105', 'Graduate Seminar-PhD', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13265, 5, '8500', 'M.Eng. Project', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20470, 6, '3200', 'Transportation Engineering', 'CIVL', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20471, 6, 'M', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20470, 20471);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20472, 6, '3310', 'Engineering Hydrology', 'CIVL', 'MTR',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20473, 6, 'F', TIME(STR_TO_DATE('0835-1125<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20472, 20473);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20474, 6, '3515', 'Structural Systems II', 'CIVL', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20475, 6, 'F', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20474, 20475);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20476, 6, '3725', 'Const. Materials & Methods', 'CIVL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20477, 6, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20478, 6, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20476, 20477);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20476, 20478);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20479, 6, '3840', 'Professional Pract Civil Eng', 'CIVL', 'R',
        TIME(STR_TO_DATE('1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 2);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20480, 6, '4250', 'Highway Engineering', 'CIVL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20481, 6, 'R', TIME(STR_TO_DATE('1535-1725<br />1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20480, 20481);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20482, 6, '4350', 'Hydraulic Engineering', 'CIVL', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20483, 6, 'W', TIME(STR_TO_DATE('1605-1755', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20482, 20483);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20484, 6, '4359', 'Form & Process in Alluvial Chn', 'CIVL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20485, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20484, 20485);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20486, 6, '4410', 'Engineering Hydrogeology', 'CIVL', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20487, 6, 'T', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20486, 20487);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20488, 6, '4460', 'Solid Waste & Landfill Eng.', 'CIVL', 'WF',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20489, 6, 'M', TIME(STR_TO_DATE('1535-1725<br />1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20488, 20489);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20490, 6, '4560', 'Spec. Topics in Struct. Syst.', 'CIVL', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20491, 6, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20490, 20491);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20492, 6, '4703', 'Senior Project II', 'CIVL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20493, 6, '4711', 'Construction Planning', 'CIVL', 'M',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 2);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20494, 6, 'M', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20493, 20494);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20495, 6, '4816', 'Civil Engi Research Project', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22937, 6, '6000', 'Directed Studies-Masters', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24298, 6, '6102', 'Tubular Steel Structures', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22938, 6, '6108', 'Graduate Seminar - Masters', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22939, 6, '6115', 'Design Water Treatment Plants', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22940, 6, '6118', 'Advanced Wastewater Treatment', 'CIVL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

######################################################
###################### Classics ######################
######################################################
INSERT INTO department VALUES ('CLAS','Classics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10571, 5, '0401', 'Honours Examination I', 'CLAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10578, 5, '2001', 'Science in the Pre Mod World', 'CLAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14286, 5, '2515', 'Myth into Film I:', 'CLAS', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10588, 5, '3600', 'Sanskrit Texts I: Narrative &', 'CLAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20500, 6, '0402', 'Honours Examination II', 'CLAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20501, 6, '2026', 'Paganism', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20502, 6, '2231', 'The Rise of Rome', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20503, 6, '2402', 'Introductory Latin Part II', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20504, 6, '2506', 'Introductory Ancient Greek II', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24368, 6, '3021', 'Ancient Art and Architecture', 'CLAS', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20507, 6, '3320', 'Oracles, Omens & Astrology', 'CLAS', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20508, 6, '3361', 'Early Greek Philosophy', 'CLAS', 'WF',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20510, 6, '3525', 'Ancient Greek Epic', 'CLAS', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24036, 6, '3702', 'Intermediate Greek II', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24037, 6, '3804', 'Intermediate Latin II', 'CLAS', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20513, 6, '4010', 'Islamic Phil: al-Ghazali', 'CLAS', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20514, 6, '4060', 'The Consolation of Philosophy', 'CLAS', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24005, 6, '4351', 'Ancient Religion I', 'CLAS', 'WF',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20515, 6, '4501', 'Seminar on Neoplatonism I', 'CLAS', 'W',
        TIME(STR_TO_DATE('1905-2155', '%k%i')), TIME(STR_TO_DATE('1905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20516, 6, '4600', 'Sanskrit Texts II: Myth,Poetry', 'CLAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24060, 6, '4761', 'Greek Texts: Philosophy I', 'CLAS', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24151, 6, '4812', 'Latin Texts: War and Peace', 'CLAS', 'M',
        TIME(STR_TO_DATE('0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22951, 6, '5036', 'Adv. Latin Seminar: War/Peace', 'CLAS', 'M',
        TIME(STR_TO_DATE('0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

######################################################
###################### Commerce ######################
######################################################
INSERT INTO department VALUES ('COMM','Commerce');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20522, 6, '1102', 'Introductory Accounting II', 'COMM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20523, 6, '1102', 'Introductory Accounting II', 'COMM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20524, 6, '1102', 'Introductory Accounting II', 'COMM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20525, 6, '1102', 'Introductory Accounting II', 'COMM', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20526, 6, '1102', 'Introductory Accounting II', 'COMM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20527, 6, '1102', 'Introductory Accounting II', 'COMM', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20528, 6, '1102', 'Introductory Accounting II', 'COMM', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20529, 6, 'M', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20530, 6, 'T', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20522, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20522, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20523, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20523, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20524, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20524, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20525, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20525, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20526, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20526, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20527, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20527, 20530);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20528, 20529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20528, 20530);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20550, 6, '2203', 'Finance II', 'COMM', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20551, 6, '2303', 'Intro to Organiz. Behaviour', 'COMM', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22977, 6, '2502', 'Predictive Analytics', 'COMM', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20553, 6, '2603', 'Legal Aspects of Business', 'COMM', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20556, 6, '3105', 'Intermed Financial Acctng I', 'COMM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20557, 6, '3105', 'Intermed Financial Acctng I', 'COMM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20560, 6, '3203', 'Financial Institutions', 'COMM', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20561, 6, '3203', 'Financial Institutions', 'COMM', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20562, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20560, 20562);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20561, 20562);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20565, 6, '3308', 'Managing Family Enterprise', 'COMM', 'R',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20567, 6, '3310', 'Reflections on Leadership', 'COMM', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20570, 6, '3405', 'Global Marketing', 'COMM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20572, 6, '3407', 'Logistics Management', 'COMM', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20573, 6, '3408', 'Transport Modes & Policy', 'COMM', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20593, 6, '3710', 'Business in Emerging Markets', 'COMM', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20594, 6, '4101', 'Advanced Accounting I', 'COMM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20595, 6, '4101', 'Advanced Accounting I', 'COMM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20596, 6, '4102', 'Advanced Accounting II', 'COMM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20597, 6, '4102', 'Advanced Accounting II', 'COMM', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20598, 6, '4126', 'Taxation II', 'COMM', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20599, 6, '4126', 'Taxation II', 'COMM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20600, 6, '4201', 'International Financial Mgmt', 'COMM', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20601, 6, '4201', 'International Financial Mgmt', 'COMM', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

###########################################################################
###################### Communication Sci & Disorders ######################
###########################################################################
INSERT INTO department VALUES ('CMSD','Communication Sci & Disorders');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13971, 5, '5071X', 'Clinical Methods-Audiology', 'CMSD', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13294, 5, '7002', 'Project', 'CMSD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14720, 5, '7061', 'Practicum Internship', 'CMSD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22960, 6, '5020', 'Phonetics', 'CMSD', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23667, 6, '5070Y', 'Clinical Methods - SLP', 'CMSD', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23668, 6, '5071Y', 'Clinical Methods-Audiology', 'CMSD', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22961, 6, '5120', 'Hearing Measurement', 'CMSD', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22962, 6, '5260', 'Hearing Disorders', 'CMSD', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22963, 6, '5280', 'Audition II', 'CMSD', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22964, 6, '6070', 'Topics in Audiology Procedures', 'CMSD', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22965, 6, '6320', 'Pediatric Audiology', 'CMSD', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22966, 6, '6350', 'Assess. Lang. Disorders - Adlt', 'CMSD', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22967, 6, '6390', 'Voice/Resonance Disorders', 'CMSD', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22968, 6, '6450', 'Speech Disorders-Adults', 'CMSD', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22969, 6, '6470', 'Lang Disorder Schl Age Child', 'CMSD', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22970, 6, '6560', 'Amplification II', 'CMSD', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22971, 6, '6980', 'Research Design', 'CMSD', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22972, 6, '7001', 'Project', 'CMSD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

###################################################################
###################### Complementary Studies ######################
###################################################################
INSERT INTO department VALUES ('CPST','Complementary Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20620, 6, '1203', 'Technical Communications II', 'CPST', 'R',
        TIME(STR_TO_DATE('1805-1925', '%k%i')), TIME(STR_TO_DATE('1805', '%k%i')), 1.5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20621, 6, 'W', TIME(STR_TO_DATE('1735-1855<br />1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20620, 20621);

        
##############################################################
###################### Computer Science ######################
##############################################################
INSERT INTO department VALUES ('CSCI','Computer Science');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10778, 5, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10779, 5, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10780, 5, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10781, 5, 'M', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10782, 5, 'F', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10783, 5, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10833, 5, '3172', 'Web-Centric Computing', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10834, 5, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10835, 5, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10833, 10834);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10833, 10835);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13297, 5, '5193', 'Technology Innovation', 'CSCI', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14749, 5, '5902', 'Special Topics in Appl Com Sci', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13315, 5, '6901', 'Directed Studies', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13316, 5, '6902', 'Doctoral Directed Studies', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13318, 5, '7001', 'Research Proj in Comp Science', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13319, 5, '7900', 'Directed Research Project', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10858, 5, '8873', 'Honours Seminar', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10859, 5, '8874', 'Research Project 1', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10860, 5, '8875', 'Research Project 2', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10861, 5, '8890', 'Co-op Seminar', 'CSCI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20637, 6, '1105', 'Intro to Computer Programming', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20638, 6, 'W', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20639, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20637, 20638);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20637, 20639);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20640, 6, '1108', 'Experimental Robotics', 'CSCI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20641, 6, 'MW', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20642, 6, 'WF', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20643, 6, 'MW', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20644, 6, 'TR', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20645, 6, 'TR', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20640, 20641);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20640, 20642);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20640, 20643);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20640, 20644);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20640, 20645);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20646, 6, '1109', 'Practical Data Science', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20647, 6, 'M', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20648, 6, 'M', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20646, 20647);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20646, 20648);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20649, 6, '1110', 'Intro to Computer Science', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20650, 6, '1110', 'Intro to Computer Science', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20651, 6, '1110', 'Intro to Computer Science', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20652, 6, 'F', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20653, 6, 'T', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20654, 6, 'M', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20655, 6, 'W', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20656, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20657, 6, 'F', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24166, 6, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24167, 6, 'F', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20652);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20653);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20654);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20655);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20656);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 20657);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 24166);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20649, 24167);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20652);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20653);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20654);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20655);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20656);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 20657);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 24166);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20650, 24167);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20652);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20653);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20654);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20655);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20656);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 20657);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 24166);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20651, 24167);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20658, 6, '1120', 'Intro to Computer Systems', 'CSCI', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20659, 6, '1170', 'Intro to Web Design & Devel.', 'CSCI', 'WF',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20660, 6, '1170', 'Intro to Web Design & Devel.', 'CSCI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20661, 6, 'W', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20662, 6, 'F', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20659, 20661);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20659, 20662);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20660, 20661);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20660, 20662);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24304, 6, '1300', 'Calculus in Computer Science', 'CSCI', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24305, 6, 'R', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24307, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24308, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24304, 24305);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24304, 24307);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24304, 24308);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23990, 6, '1315', 'Discrete Math for CS', 'CSCI', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23992, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23993, 6, 'R', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23994, 6, 'T', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23990, 23992);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23990, 23993);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23990, 23994);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20663, 6, '1801', 'Case Studies in Comp & Society', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20664, 6, '1801', 'Case Studies in Comp & Society', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20665, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20666, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20667, 6, 'F', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20668, 6, 'M', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20669, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20670, 6, 'M', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20671, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20672, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20673, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20674, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20675, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20676, 6, 'W', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20677, 6, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20678, 6, 'M', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20679, 6, 'T', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20680, 6, 'M', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20681, 6, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20682, 6, 'R', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20683, 6, 'W', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20684, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20665);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20666);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20667);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20668);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20669);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20670);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20671);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20672);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20673);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20674);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20675);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20676);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20677);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20678);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20679);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20680);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20681);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20682);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20683);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20663, 20684);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20665);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20666);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20667);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20668);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20669);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20670);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20671);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20672);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20673);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20674);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20675);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20676);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20677);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20678);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20679);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20680);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20681);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20682);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20683);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20664, 20684);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20685, 6, '2100', 'Comm Skills: Oral/Written', 'CSCI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20687, 6, '2110', 'Data Structures & Algorithms', 'CSCI', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20688, 6, 'W', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20689, 6, 'M', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20690, 6, 'M', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20687, 20688);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20687, 20689);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20687, 20690);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23967, 6, '2112', 'Discrete Structures I', 'CSCI', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20691, 6, '2113', 'Discrete Structures II', 'CSCI', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20693, 6, '2122', 'Systems Programming', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20694, 6, 'W', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20695, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20696, 6, 'T', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20693, 20694);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20693, 20695);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20693, 20696);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20697, 6, '2134', 'Software Development', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20698, 6, '2134', 'Software Development', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20699, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20700, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20701, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20702, 6, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20697, 20699);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20697, 20700);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20697, 20701);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20697, 20702);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20698, 20699);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20698, 20700);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20698, 20701);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20698, 20702);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20703, 6, '2141', 'Intro to Database Systems', 'CSCI', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20704, 6, '2141', 'Intro to Database Systems', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20705, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20706, 6, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20707, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20708, 6, 'R', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20709, 6, 'R', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20703, 20705);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20703, 20706);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20703, 20707);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20703, 20708);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20703, 20709);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20704, 20705);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20704, 20706);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20704, 20707);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20704, 20708);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20704, 20709);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20710, 6, '2170', 'Intro to Server Side Scripting', 'CSCI', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20711, 6, 'M', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20710, 20711);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20712, 6, '2201', 'Introduction to Info Security', 'CSCI', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20713, 6, 'W', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20714, 6, 'W', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20712, 20713);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20712, 20714);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24089, 6, '2202', 'Intro to Programming w/ applic', 'CSCI', 'T',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24091, 6, 'TR', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24089, 24091);

        
##################################################################
###################### Contemporary Studies ######################
##################################################################
INSERT INTO department VALUES ('CTMP','Contemporary Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13974, 5, '0456', 'Honours Thesis Seminar', 'CTMP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10864, 5, '2102', 'Asia and the West', 'CTMP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10865, 5, '2121', 'Humanism and Anti-humanism', 'CTMP', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10866, 5, '2313', 'The Vampire', 'CTMP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10873, 5, '4415', 'Ctmp Aesthetic/Critical Theory', 'CTMP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23671, 6, '0457', 'Honours Thesis Seminar', 'CTMP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23672, 6, '2002', 'Modern Soc & Polit Thought II', 'CTMP', 'M',
        TIME(STR_TO_DATE('1335-1525<br />1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20760, 6, '2115', 'Idea of Race in Phil, Lit, Art', 'CTMP', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20761, 6, '2201', 'Mass & Digital Media Culture', 'CTMP', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20762, 6, '2330', 'Reflections on Death', 'CTMP', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20763, 6, '2335', 'The Artist and Society', 'CTMP', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23673, 6, '3002', 'Science and Culture II', 'CTMP', 'M',
        TIME(STR_TO_DATE('1035-1225<br />1035-1125<br />1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20764, 6, '3103', 'Critiques of Modernity', 'CTMP', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20765, 6, '3115', 'The Real Wld of Enlightenment', 'CTMP', 'T',
        TIME(STR_TO_DATE('0935-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20766, 6, '3201', 'Scie & Relig: Contemp Perspec', 'CTMP', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20767, 6, '3210', 'Intersct. Bodies, Selves & Env', 'CTMP', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20768, 6, '3302', 'Film Theory', 'CTMP', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23674, 6, '4002', 'Deconstruction of Tradition II', 'CTMP', 'T',
        TIME(STR_TO_DATE('1435-1625<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20771, 6, '4200', 'Philosophies of Tech', 'CTMP', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20772, 6, '4410', 'Ctmp Social/Political Thought', 'CTMP', 'M',
        TIME(STR_TO_DATE('1435-1625<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23943, 6, '4411', 'Ctmp Science & Technology', 'CTMP', 'T',
        TIME(STR_TO_DATE('1635-1725<br />1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

##############################################################
###################### Creative Writing ######################
##############################################################
INSERT INTO department VALUES ('CRWR','Creative Writing');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20623, 6, '2002', 'Intro to Creative Writing', 'CRWR', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20624, 6, '2010', 'The Personal Essay', 'CRWR', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20625, 6, '3011', 'Creative Writing: Poetry II', 'CRWR', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20627, 6, '3021', 'Creative Writing: Fiction II', 'CRWR', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20629, 6, '3100', 'Songwriting', 'CRWR', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24365, 6, '3311', 'Editing & Publishing Lit.', 'CRWR', 'M',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23945, 6, '4011', 'Adv Creative Writing: PoetryII', 'CRWR', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

############################################################
###################### Dental Hygiene ######################
############################################################
INSERT INTO department VALUES ('DEHY','Dental Hygiene');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10875, 5, '2550', 'Mindfulness Elective', 'DEHY', 'M',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10876, 5, '4008', 'Independent Study/Elective', 'DEHY', 'M',
        TIME(STR_TO_DATE('0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10877, 5, '4011', 'Intro to Health Research', 'DEHY', 'M',
        TIME(STR_TO_DATE('<br />1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14452, 5, '4013', 'Teaching Method & Practicum', 'DEHY', 'M',
        TIME(STR_TO_DATE('0805-1055<br />1135-1325<br />0905-1125<br />1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14502, 5, '4015', 'Alternative Practice Setting', 'DEHY', 'T',
        TIME(STR_TO_DATE('<br />0905-1155<br />1335-1625<br />0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20774, 6, '4002', 'Applied Oral Health Research', 'DEHY', 'W',
        TIME(STR_TO_DATE('<br />1305-1555<br /><br /><br />0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20775, 6, '4006', 'Health Policy', 'DEHY', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24162, 6, '4014', 'Teaching Method & Practicum', 'DEHY', 'M',
        TIME(STR_TO_DATE('<br />0905-1155<br />1005-1155<br />1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24226, 6, '4016', 'Alternative Practice Setting', 'DEHY', 'M',
        TIME(STR_TO_DATE('<br />1335-1625<br />1135-1255<br />1335-1625<br />0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

#######################################################
###################### Dentistry ######################
#######################################################
INSERT INTO department VALUES ('DENT','Dentistry');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31247, 4, '1502', 'Elective', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31248, 4, '1504', 'Summer Elective', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31249, 4, '1999', 'Summer Research Elective Year1', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31250, 4, '2501', 'Summer Elective', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31251, 4, '2555', 'Summer Bridging Program', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31252, 4, '2999', 'Summer Research Elective Year2', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30432, 4, '3999', 'Summer Research Elective Year3', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30433, 4, '4555', 'Externship Elective', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30803, 4, '5400', 'Hosp Clin Paediatric Dent &Med', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30656, 4, '5401', 'N Oxide&Oral Sedat\'n-Children', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30657, 4, '5514', 'Becoming a Dental Educator', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30658, 4, '5600', 'Hospital Clinical Dent/Medicin', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30659, 4, '5601', 'Intrav,Nitr Oxi Inhal,Oral Sed', 'DENT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

######################################################################
###################### Diag Med Ultrasound Tech ######################
######################################################################
INSERT INTO department VALUES ('DMUT','Diag Med Ultrasound Tech');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30104, 4, '1500', 'Clinical Practicum I', 'DMUT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30105, 4, '2500', 'Clinical Practicum II', 'DMUT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30106, 4, '3500', 'Clinical Practicum III', 'DMUT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10883, 5, '1000', 'Fundamentals of Sonography I', 'DMUT', 'TR',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10884, 5, 'W', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10883, 10884);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10885, 5, '2000', 'Sono of Abdomen&Super Struct I', 'DMUT', 'MW',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10886, 5, 'F', TIME(STR_TO_DATE('0805-1055', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10885, 10886);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10888, 5, '2020', 'Princ&Inst Diag Med Ultrsnd II', 'DMUT', 'MW',
        TIME(STR_TO_DATE('1035-1125<br />1205-1255', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14377, 5, '2050', 'Sono Reproductive System', 'DMUT', 'TR',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10889, 5, '3000', 'Sonography in Obstetrics II', 'DMUT', 'MW',
        TIME(STR_TO_DATE('1235-1355', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10890, 5, 'TR', TIME(STR_TO_DATE('1305-1525', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10889, 10890);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10891, 5, '3010', 'Songrph Abdomn/Super Struc III', 'DMUT', 'MW',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10892, 5, 'W', TIME(STR_TO_DATE('1605-1755', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10891, 10892);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10893, 5, '4000', 'Spec Prac Diag Med Ultras I', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20782, 6, '1010', 'Prin & Inst Diag Med Ultrsnd I', 'DMUT', 'TR',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20783, 6, '1020', 'Fundamentals of Sonography II', 'DMUT', 'TR',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20784, 6, 'T', TIME(STR_TO_DATE('1305-1455', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20783, 20784);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20785, 6, '2030', 'Sono of Abdomen&Sup Struct II', 'DMUT', 'MW',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20786, 6, 'F', TIME(STR_TO_DATE('0805-1055', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20785, 20786);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20787, 6, '2040', 'Sonography in Obstetrics I', 'DMUT', 'TR',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20788, 6, 'F', TIME(STR_TO_DATE('1335-1625', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20787, 20788);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20789, 6, '3200', 'Abdominal Imaging', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20790, 6, '3210', 'Obstetrical Imaging', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20791, 6, '3220', 'Gynecological Imaging', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20792, 6, '3230', 'Superficial Structure Imaging', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20793, 6, '3240', 'Appl Ultrasnd Instrumentation', 'DMUT', 'MTWRF',
        TIME(STR_TO_DATE('0805-1555', '%k%i')), TIME(STR_TO_DATE('0805', '%k%i')), 3);

##################################################################
###################### Early Modern Studies ######################
##################################################################
INSERT INTO department VALUES ('EMSP','Early Modern Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13981, 5, '2001', 'Struct. of the Modern Self I', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11028, 5, '2313', 'The Vampire', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11029, 5, '2360', 'Magic, Science & Occult', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11030, 5, '2390', 'Asia and the West', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13982, 5, '3001', 'Study Nature Early Mod.Europe', 'EMSP', 'M',
        TIME(STR_TO_DATE('1235-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11032, 5, '3280', 'Love, Lust & Desire in Ital Re', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11033, 5, '3330', 'Scie & Relig: Hist Perspecive', 'EMSP', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11035, 5, '3510', 'Independent Readings', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14195, 5, '3515', 'Independent Readings', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13984, 5, '4001', 'Concpt State, Soc & Rev EMP', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11036, 5, '4510', 'Indpndnt Readngs Erly Mdrn Std', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14196, 5, '4515', 'Independent Readings', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23678, 6, '2002', 'Struct. of the Modern Self II', 'EMSP', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20905, 6, '2240', 'Themes in Early Modern Scie.', 'EMSP', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20906, 6, '2320', 'Witchcraft in Erly Mdrn Europe', 'EMSP', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24133, 6, '2410', 'Portrayal/Non-European World', 'EMSP', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20907, 6, '2480', 'The Pirate and Piracy', 'EMSP', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23679, 6, '3002', 'Study Nature Early Mod.Europe', 'EMSP', 'M',
        TIME(STR_TO_DATE('1235-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20908, 6, '3203', 'Critiques of Modernity', 'EMSP', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20909, 6, '3220', 'The real world of Enlightenmen', 'EMSP', 'T',
        TIME(STR_TO_DATE('0935-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20912, 6, '3321', 'History of European Alchemy', 'EMSP', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20913, 6, '3511', 'Independent Readings', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24134, 6, '3640', 'Studies in Early Mod Aesth', 'EMSP', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23680, 6, '4002', 'Concpt State, Soc & Rev EMP', 'EMSP', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20914, 6, '4511', 'Indpndnt Readns Erly Mdrn Std', 'EMSP', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

############################################################
###################### Earth Sciences ######################
############################################################
INSERT INTO department VALUES ('ERTH','Earth Sciences');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11238, 5, '2110', 'Field Methods', 'ERTH', 'T',
        TIME(STR_TO_DATE('1335-1425<br />1235-1325<br />1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11239, 5, 'W', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11238, 11239);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11242, 5, '3010', 'Igneous Petrology', 'ERTH', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11243, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11242, 11243);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11244, 5, '3302', 'Quaternary Sediment.Environ.', 'ERTH', 'MF',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11245, 5, 'W', TIME(STR_TO_DATE('1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11244, 11245);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11257, 5, '4101', 'Research Project', 'ERTH', 'M',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11264, 5, '4510', 'Directed Readings', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21086, 6, '2002', 'Introduction to Petrology', 'ERTH', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21087, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21086, 21087);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21089, 6, '2270', 'Intro to Applied Geophysics.', 'ERTH', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21090, 6, 'W', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21089, 21090);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21091, 6, '2380', 'Geochemistry', 'ERTH', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21092, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21091, 21092);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21093, 6, '2410', 'Environ Iss. in Erth Scie.', 'ERTH', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21094, 6, '3140', 'Structural Geology', 'ERTH', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21095, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21094, 21095);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21096, 6, '3205', 'Paleobiology', 'ERTH', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24085, 6, 'R', TIME(STR_TO_DATE('1505-1755', '%k%i')),
        TIME(STR_TO_DATE('1505', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21096, 24085);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21097, 6, '3420', 'Geochem of Aquatic Environment', 'ERTH', 'MF',
        TIME(STR_TO_DATE('1335-1425<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21098, 6, '3440', 'Geomorphology', 'ERTH', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21099, 6, '3601', 'Global Biogeochemical Cycles', 'ERTH', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21100, 6, 'R', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21099, 21100);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24233, 6, '4003', 'Adv. Field Geology Orientation', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21101, 6, '4102', 'Research Project', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21102, 6, '4110', 'Geological Oceanography', 'ERTH', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21103, 6, '4131', 'Adv. Petroleum Geoscience', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21104, 6, '4151', 'Mineral Deposits', 'ERTH', 'M',
        TIME(STR_TO_DATE('1005-1125<br />1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21105, 6, 'F', TIME(STR_TO_DATE('1435-1655', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21104, 21105);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21106, 6, '4157', 'Petroleum Geoscience Field Met', 'ERTH', 'M',
        TIME(STR_TO_DATE('1735-2055', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21107, 6, '4202', 'Honours Thesis', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21108, 6, '4510', 'Directed Readings', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21109, 6, '4511', 'Directed Readings', 'ERTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21110, 6, '4520', 'GIS Applicatns Enviro & Geo', 'ERTH', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21111, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21112, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21110, 21111);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21110, 21112);

        
#######################################################
###################### Economics ######################
#######################################################
INSERT INTO department VALUES ('ECON','Economics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13370, 5, '9510', 'Qualifying Doctoral Examinatio', 'ECON', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20841, 6, '1101', 'Principles of Microeconomics', 'ECON', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20842, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20841, 20842);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20843, 6, '1102', 'Principles of Macroeconomics', 'ECON', 'MW',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20844, 6, '1102', 'Principles of Macroeconomics', 'ECON', 'MW',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20845, 6, '1102', 'Principles of Macroeconomics', 'ECON', 'TR',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20846, 6, 'T', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20847, 6, 'T', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20848, 6, 'W', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20849, 6, 'W', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20850, 6, 'W', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20851, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20852, 6, 'W', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20853, 6, 'W', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20854, 6, 'W', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20855, 6, 'W', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20856, 6, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20857, 6, 'W', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20858, 6, 'R', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20859, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20860, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20861, 6, 'R', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20862, 6, 'R', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20863, 6, 'R', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20864, 6, 'R', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20865, 6, 'T', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20866, 6, 'W', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20867, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20868, 6, 'F', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20869, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24016, 6, 'R', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24017, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24018, 6, 'F', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24019, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20846);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20847);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20848);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20849);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20850);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20851);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20852);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20853);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20854);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20855);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20856);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20857);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20858);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20859);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20860);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20861);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20862);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20863);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20864);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20865);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20866);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20867);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20868);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 20869);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 24016);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 24017);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 24018);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20843, 24019);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20846);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20847);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20848);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20849);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20850);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20851);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20852);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20853);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20854);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20855);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20856);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20857);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20858);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20859);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20860);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20861);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20862);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20863);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20864);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20865);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20866);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20867);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20868);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 20869);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 24016);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 24017);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 24018);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20844, 24019);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20846);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20847);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20848);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20849);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20850);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20851);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20852);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20853);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20854);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20855);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20856);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20857);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20858);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20859);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20860);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20861);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20862);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20863);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20864);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20865);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20866);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20867);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20868);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 20869);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 24016);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 24017);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 24018);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20845, 24019);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23965, 6, '2064', 'Econ Hist of Erly Mod West', 'ECON', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20870, 6, '2200', 'Intermediate Microeconomics', 'ECON', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20871, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20870, 20871);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20872, 6, '2201', 'Intermediate Macroeconomics', 'ECON', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20873, 6, '2201', 'Intermediate Macroeconomics', 'ECON', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20874, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20875, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20872, 20874);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20872, 20875);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20873, 20874);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20873, 20875);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20876, 6, '2212', 'Law and Economics', 'ECON', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20877, 6, '2216', 'Economics of Global Warming', 'ECON', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20878, 6, '2219', 'Common Markt to European Union', 'ECON', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20879, 6, '2231', 'Perspectives Health Economics.', 'ECON', 'TF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20880, 6, '2239', 'European Economy Since 1900', 'ECON', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20881, 6, '2336', 'Regional Development', 'ECON', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20882, 6, '2400', 'Economic Demography', 'ECON', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20883, 6, '3330', 'International Trade', 'ECON', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20884, 6, '3331', 'International Finance', 'ECON', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20885, 6, '3332', 'Resource Economics', 'ECON', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20887, 6, '3338', 'Intro Econometrics I', 'ECON', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20888, 6, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20887, 20888);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20889, 6, '3339', 'Intro Econometrics II', 'ECON', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20890, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20889, 20890);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20891, 6, '3345', 'Public Finance', 'ECON', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20892, 6, '3349', 'History of Economic Thought', 'ECON', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

############################################################################
###################### Electrical & Computer Engineer ######################
############################################################################
INSERT INTO department VALUES ('ECED','Electrical & Computer Engineer');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10896, 5, '2000', 'Electric Circuits', 'ECED', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10897, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10898, 5, 'F', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10899, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10900, 5, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10901, 5, 'T', TIME(STR_TO_DATE('1835-2125', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10896, 10897);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10896, 10898);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10896, 10899);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10896, 10900);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10896, 10901);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10902, 5, '3003', 'Networks & Systems', 'ECED', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10903, 5, 'F', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10902, 10903);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10904, 5, '3102', 'Electromechanics', 'ECED', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10905, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10904, 10905);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10907, 5, '3201', 'Intro to Electronics', 'ECED', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10908, 5, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10907, 10908);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10909, 5, '3204', 'Microprocessors', 'ECED', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10910, 5, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10909, 10910);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10911, 5, '3300', 'Electromagnetic Fields', 'ECED', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10912, 5, 'F', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10911, 10912);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10913, 5, '3401', 'System Analysis', 'ECED', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10914, 5, 'F', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10913, 10914);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10915, 5, '3500', 'Signal Analysis', 'ECED', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10916, 5, 'W', TIME(STR_TO_DATE('1535-1725<br />1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10915, 10916);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14491, 5, '4071', 'Analog Filter Design', 'ECED', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14492, 5, 'T', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 14491, 14492);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10917, 5, '4130', 'Electric Power Systems II', 'ECED', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10918, 5, 'W', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10917, 10918);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10919, 5, '4260', 'IC Design & Fabrication', 'ECED', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10920, 5, 'M', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10919, 10920);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10921, 5, '4402', 'Real Time Systems', 'ECED', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10922, 5, 'M', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10921, 10922);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10923, 5, '4406', 'Computer Security', 'ECED', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10926, 5, '4601', 'Digital Control Systems', 'ECED', 'TR',
        TIME(STR_TO_DATE('1135-1255<br />1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10927, 5, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10926, 10927);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10928, 5, '4900', 'Senior Year Project I.', 'ECED', 'T',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10929, 5, 'W', TIME(STR_TO_DATE('1235-1425<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10928, 10929);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10930, 5, '4901', 'Senior Year Project II.', 'ECED', 'T',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (10931, 5, 'W', TIME(STR_TO_DATE('1235-1425<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 10930, 10931);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13340, 5, '5210', 'Biomed Inst, Data Acq. & Anal', 'ECED', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13341, 5, 'M', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13340, 13341);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13342, 5, '6190', 'Energy Systems Analysis', 'ECED', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13343, 5, '6590', 'Mobile Communication Systems', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20795, 6, '2001', 'Circuit Analysis', 'ECED', 'W',
        TIME(STR_TO_DATE('1005-1125<br />1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20796, 6, 'M', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20797, 6, 'R', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20795, 20796);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20795, 20797);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20798, 6, '2200', 'Digital Circuits', 'ECED', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20799, 6, 'F', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20800, 6, 'F', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20798, 20799);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20798, 20800);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20801, 6, '3600', 'Modern Control Systems.', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20802, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20801, 20802);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20805, 6, '4350', 'Semiconductor Matl & Devices', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20806, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20805, 20806);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20807, 6, '4404', 'Comp Networks & Communication', 'ECED', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20808, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20807, 20808);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20809, 6, '4421', 'Tech & Apps of Fiber Optics', 'ECED', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20810, 6, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20809, 20810);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24265, 6, '4460', 'Communications Electronics', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24266, 6, 'M', TIME(STR_TO_DATE('1505-1755', '%k%i')),
        TIME(STR_TO_DATE('1505', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24265, 24266);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20813, 6, '4502', 'Digital Signal Processing', 'ECED', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20814, 6, 'W', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20813, 20814);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24212, 6, '4504', 'Digital Transmission Theory', 'ECED', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24213, 6, 'F', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24212, 24213);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20815, 6, '4513', 'Communication Networks', 'ECED', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20816, 6, 'M', TIME(STR_TO_DATE('0835-1125<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20815, 20816);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20817, 6, '4602', 'Control Systems', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20818, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20817, 20818);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20819, 6, '4760', 'Biomedical Engineering', 'ECED', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20820, 6, 'T', TIME(STR_TO_DATE('0835-1125<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20819, 20820);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20821, 6, '4900', 'Senior Year Project I.', 'ECED', 'M',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20822, 6, 'M', TIME(STR_TO_DATE('1335-1425<br />1435-1555<br />1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20821, 20822);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20823, 6, '4901', 'Senior Year Project II.', 'ECED', 'M',
        TIME(STR_TO_DATE('1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20824, 6, 'M', TIME(STR_TO_DATE('1335-1425<br />1435-1555<br />1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20823, 20824);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23025, 6, '5260', 'Principles of Medical Imaging', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23026, 6, '6070', 'Modern Integrated Filters', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23027, 6, '6221', 'Analog MOS Design', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23028, 6, '6360', 'Fiber/Integrated Optics', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23029, 6, '6400', 'Fundamentals of nonlinear opti', 'ECED', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#################################################################
###################### Electronic Commerce ######################
#################################################################
INSERT INTO department VALUES ('ECMM','Electronic Commerce');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13354, 5, '7010', 'Industrial Internship', 'ECMM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13355, 5, '7030', 'Research Paper in ECOM', 'ECMM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23036, 6, '6014', 'Databases & Data Mining/ElecCo', 'ECMM', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23037, 6, '6022', 'Project Management', 'ECMM', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23038, 6, '6040', 'Research Methods', 'ECMM', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23039, 6, 'R', TIME(STR_TO_DATE('1405-1555', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23038, 23039);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23040, 6, '7010', 'Industrial Internship', 'ECMM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23041, 6, '7030', 'Research Paper in ECOM', 'ECMM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

#########################################################
###################### Engineering ######################
#########################################################
INSERT INTO department VALUES ('ENGI','Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20915, 6, '1203', 'Mechanics 1: Statics', 'ENGI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20916, 6, 'F', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20917, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20918, 6, 'T', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20919, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20920, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20921, 6, 'W', TIME(STR_TO_DATE('1905-2155', '%k%i')),
        TIME(STR_TO_DATE('1905', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20922, 6, 'F', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20923, 6, 'R', TIME(STR_TO_DATE('1005-1255', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20925, 6, 'M', TIME(STR_TO_DATE('1835-2025', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20916);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20917);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20918);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20919);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20920);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20921);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20922);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20923);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20915, 20925);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20926, 6, '2103', 'Thermo-Fluid Engi II', 'ENGI', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20927, 6, 'F', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20926, 20927);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20928, 6, '2203', 'Engineering Design II', 'ENGI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20929, 6, '2203', 'Engineering Design II', 'ENGI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20930, 6, '2203', 'Engineering Design II', 'ENGI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20931, 6, '2203', 'Engineering Design II', 'ENGI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20932, 6, '2203', 'Engineering Design II', 'ENGI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20933, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20934, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20935, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20936, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20937, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20928, 20933);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20928, 20934);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20928, 20935);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20928, 20936);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20928, 20937);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20929, 20933);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20929, 20934);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20929, 20935);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20929, 20936);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20929, 20937);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20930, 20933);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20930, 20934);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20930, 20935);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20930, 20936);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20930, 20937);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20931, 20933);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20931, 20934);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20931, 20935);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20931, 20936);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20931, 20937);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20932, 20933);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20932, 20934);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20932, 20935);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20932, 20936);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20932, 20937);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20938, 6, '2204', 'Mechanics of Materials', 'ENGI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20939, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20940, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20941, 6, 'F', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20938, 20939);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20938, 20940);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20938, 20941);

        
#########################################################################
###################### Engineering Internetworking ######################
#########################################################################
INSERT INTO department VALUES ('INWK','Engineering Internetworking');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14465, 5, '6111', 'Intro to Computer Networks', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14592, 5, '6111', 'Intro to Computer Networks', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), -);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14467, 5, '6113', 'Telecomm. & Wide Area Networks', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14468, 5, '6114', 'Internet Commun. Protocols', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14470, 5, '6115', 'Network Architecture', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14471, 5, '6117', 'Emerging Internetwrkng Technol', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14473, 5, '6119', 'Network Security', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14474, 5, '6211', 'Math for Internetworking', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14593, 5, '6211', 'Math for Internetworking', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13523, 5, '6800', 'Internetworking Seminar Topic', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13524, 5, '6800', 'Internetworking Seminar Topic', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24179, 6, '6111', 'Intro to Computer Networks', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24181, 6, '6112', 'Phys and Data Stand and Protoc', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24310, 6, '6112', 'Phys and Data Stand and Protoc', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24184, 6, '6114', 'Internet Commun. Protocols', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24311, 6, '6114', 'Internet Commun. Protocols', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24185, 6, '6115', 'Network Architecture', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24186, 6, '6117', 'Emerging Internetwrkng Technol', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24187, 6, '6119', 'Network Security', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24188, 6, '6211', 'Math for Internetworking', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24190, 6, '6800', 'Internetworking Seminar Topic', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24191, 6, '6800', 'Internetworking Seminar Topic', 'INWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

#####################################################################
###################### Engineering Mathematics ######################
#####################################################################
INSERT INTO department VALUES ('ENGM','Engineering Mathematics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13379, 5, '6000', 'Dir Studies Applied Math', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14576, 5, '6612', 'Methods of Applied Math I', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13380, 5, '6658', 'Num Solut\'ns Diff\'l Equations', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20997, 6, '1041', 'Applied Linear Algebra', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20998, 6, 'T', TIME(STR_TO_DATE('1735-1925', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20997, 20998);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20999, 6, '2022', 'Applied Differential Equations', 'ENGM', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21000, 6, 'F', TIME(STR_TO_DATE('1735-1925', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20999, 21000);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21001, 6, '2283', 'Data Structures & Algorithms', 'ENGM', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21002, 6, 'M', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21003, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21001, 21002);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21001, 21003);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21004, 6, '3052', 'Applied Numerical Methods', 'ENGM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21005, 6, 'W', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21004, 21005);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21006, 6, '3356', 'Num Meth & Partial Dif Equatio', 'ENGM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21007, 6, 'F', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21006, 21007);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21008, 6, '4675', 'Risk Assessment', 'ENGM', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21009, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21008, 21009);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23064, 6, '6000', 'Dir Studies Applied Math', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23065, 6, '6000', 'Dir Studies Applied Math', 'ENGM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23067, 6, '6675', 'Risk Assessment and Management', 'ENGM', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23068, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23067, 23068);

        
#####################################################
###################### English ######################
#####################################################
INSERT INTO department VALUES ('ENGL','English');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13373, 5, '5000', 'Directed Reading', 'ENGL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13374, 5, '5000', 'Directed Reading', 'ENGL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13375, 5, '5001', 'Directed Readings II', 'ENGL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20945, 6, '1005', 'Literature: Global Perspective', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20946, 6, 'R', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20947, 6, 'R', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20948, 6, 'R', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20949, 6, 'R', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20945, 20946);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20945, 20947);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20945, 20948);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20945, 20949);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20950, 6, '1015', 'Literature: How it Works', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20952, 6, 'R', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20953, 6, 'R', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20954, 6, 'R', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20955, 6, 'R', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20950, 20952);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20950, 20953);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20950, 20954);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20950, 20955);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23925, 6, '1025', 'Literature: Why it Matters', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23926, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23927, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23928, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23929, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23925, 23926);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23925, 23927);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23925, 23928);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23925, 23929);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20960, 6, '1040', 'Reading Pop Cult: Writing Req.', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20961, 6, 'F', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20962, 6, 'F', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20963, 6, 'F', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20964, 6, 'F', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20960, 20961);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20960, 20962);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20960, 20963);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20960, 20964);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20965, 6, '1050', 'Pulp Fiction: Writing Req.', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20966, 6, 'F', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20967, 6, 'F', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20968, 6, 'F', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24022, 6, 'F', TIME(STR_TO_DATE('0835-0925', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20965, 20966);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20965, 20967);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20965, 20968);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20965, 24022);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20971, 6, '1100', 'Writing for University', 'ENGL', 'M',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24367, 6, '1100', 'Writing for University', 'ENGL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20972, 6, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20973, 6, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20974, 6, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (20975, 6, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20971, 20972);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20971, 20973);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20971, 20974);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 20971, 20975);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24367, 20972);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24367, 20973);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24367, 20974);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24367, 20975);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20976, 6, '2001', 'British Literature to 1800', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20978, 6, '2010', 'The Personal Essay', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20979, 6, '2040', 'Mystery & Detective Fiction', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20980, 6, '2095', 'Narrative in the Cinema', 'ENGL', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24419, 6, '2217', 'Shakespeare at the Globe', 'ENGL', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20981, 6, '2218', 'Gothic Fiction', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20982, 6, '3002', 'Contemporary Critical Theory', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20983, 6, '3006', 'Old English', 'ENGL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20984, 6, '3011', 'Renaissance Poetry & Culture 2', 'ENGL', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20985, 6, '3015', 'Renaissance Drama', 'ENGL', 'M',
        TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20986, 6, '3250', 'Contemporary Women Poets', 'ENGL', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (20987, 6, '3270', 'Contemporary Canadian Lit.', 'ENGL', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24364, 6, '3311', 'Editing & Publishing Lit.', 'ENGL', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

###################################################################
###################### English Language (CE) ######################
###################################################################
INSERT INTO department VALUES ('ENSL','English Language (CE)');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21026, 6, '0005', 'Acad Writing & Research Skills', 'ENSL', 'TR',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21027, 6, '0005', 'Acad Writing & Research Skills', 'ENSL', 'TR',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21028, 6, '0005', 'Acad Writing & Research Skills', 'ENSL', 'TR',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

#######################################################################
###################### Environmental Engineering ######################
#######################################################################
INSERT INTO department VALUES ('ENVE','Environmental Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13384, 5, '6000', 'Directed Studies in Env. Eng.', 'ENVE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13386, 5, '6800', 'Grad Sem in Env Engineering', 'ENVE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21039, 6, '3500', 'Air Quality', 'ENVE', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21040, 6, 'T', TIME(STR_TO_DATE('0835-1125<br />0835-1125<br />0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21039, 21040);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23987, 6, '4201', 'Biological Treatment Processes', 'ENVE', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23988, 6, 'R', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23987, 23988);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21041, 6, '4402', 'Dsgn Proj for Env. Engineer II', 'ENVE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21042, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21041, 21042);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23071, 6, '6800', 'Grad Sem in Env Engineering', 'ENVE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

###################################################################
###################### Environmental Science ######################
###################################################################
INSERT INTO department VALUES ('ENVS','Environmental Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11201, 5, '2500', 'Field Methods in Environmental', 'ENVS', 'W',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11204, 5, '3226', 'Economic Botany, Plnts & Civl.', 'ENVS', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11205, 5, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11204, 11205);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11211, 5, '3501', 'Envi Problem Solving I', 'ENVS', 'R',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11217, 5, '4003', 'Coral Reefs & Environmental Ch', 'ENVS', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11219, 5, '4901', 'Honours Thesis Part A', 'ENVS', 'M',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11220, 5, '4902', 'Honours Thesis Part B', 'ENVS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21055, 6, '2310', 'Energy and the Environment', 'ENVS', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21056, 6, '2410', 'Env Issues in Earth Sciences', 'ENVS', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21058, 6, '3100', 'Environmental Analytics', 'ENVS', 'T',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21059, 6, 'T', TIME(STR_TO_DATE('1305-1525', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21058, 21059);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21061, 6, '3225', 'Plants in the Human Landscape', 'ENVS', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21062, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21061, 21062);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24261, 6, '3400', 'Environment and Human Health', 'ENVS', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24282, 6, 'M', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24261, 24282);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21063, 6, '3502', 'Env Problem Solving II', 'ENVS', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21064, 6, '3601', 'Global Biogeochemical Cycles', 'ENVS', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21065, 6, 'R', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21064, 21065);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21066, 6, '3702', 'Sustainable Industries', 'ENVS', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21067, 6, '3801', 'Dir. Readings in Env. Science', 'ENVS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21068, 6, '4850', 'Geographic Info Scie Res Proj', 'ENVS', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21069, 6, '4902', 'Honours Thesis Part B', 'ENVS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

###################################################################
###################### Environmental Studies ######################
###################################################################
INSERT INTO department VALUES ('ENVI','Environmental Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13389, 5, '5001', 'Environmental Assessment', 'ENVI', 'M',
        TIME(STR_TO_DATE('1435-1605', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13392, 5, '5035', 'Research Design and Methods', 'ENVI', 'W',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13395, 5, '5044', 'Industrial Sustainability', 'ENVI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13397, 5, '5048', 'Directed Study - Spec Topics', 'ENVI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13398, 5, '5049', 'Directed Study - Spec Topics', 'ENVI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14288, 5, '5059', 'SRES Research Seminar', 'ENVI', 'T',
        TIME(STR_TO_DATE('1205-1405', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13402, 5, '5204', 'Coastal Zone Management', 'ENVI', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13403, 5, '5504', 'Mgmt. of Res. & the Env.', 'ENVI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13404, 5, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13403, 13404);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13407, 5, '5508', 'MREM Project', 'ENVI', 'M',
        TIME(STR_TO_DATE('1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24165, 6, '5021', 'Fisheries Management', 'ENVI', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23075, 6, '5023', 'Qualitative Data Analysis', 'ENVI', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24448, 6, '5039', 'Indigenous Perspectives on REM', 'ENVI', 'W',
        TIME(STR_TO_DATE('1425-1735', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24449, 6, '5041', 'Environmental Education', 'ENVI', 'F',
        TIME(STR_TO_DATE('0825-1135', '%k%i')), TIME(STR_TO_DATE('0825', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23076, 6, '5047', 'Conservation System Design', 'ENVI', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23077, 6, '5048', 'Directed Study - Spec Topics', 'ENVI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23078, 6, '5049', 'Directed Study - Spec Topics', 'ENVI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23079, 6, '5051', 'Special Topics REM', 'ENVI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23080, 6, '5052', 'Sp Topic in Env Studies', 'ENVI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23991, 6, '5059', 'SRES Research Seminar', 'ENVI', 'T',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23081, 6, '5205', 'Resource & Environmental Law', 'ENVI', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23082, 6, '5500', 'Socio-politic dimensions', 'ENVI', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23083, 6, '5505', 'Biophysical Dimensions REM', 'ENVI', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23084, 6, '6100', 'Info in Pol & Decision-Making', 'ENVI', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

##############################################################
###################### European Studies ######################
##############################################################
INSERT INTO department VALUES ('EURO','European Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11272, 5, '3999', 'Independent Study.', 'EURO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24038, 6, '2101', 'Europe:Ideas,Cultr,Soc to 1900', 'EURO', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21117, 6, '3999', 'Independent Study.', 'EURO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24012, 6, '4512', 'The Idea of Europe.', 'EURO', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

##########################################################
###################### Film Studies ######################
##########################################################
INSERT INTO department VALUES ('FILM','Film Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11291, 5, '2346', 'East Euro. Cin: War, Love, Rev', 'FILM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21121, 6, '2337', 'Russian Film II', 'FILM', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21122, 6, '3301', 'Film History 2', 'FILM', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21124, 6, '4101', 'Short Apprenticeship', 'FILM', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

############################################################################
###################### First Year Interest Groups-Sci ######################
############################################################################
INSERT INTO department VALUES ('FIGS','First Year Interest Groups-Sci');

##########################################################
###################### Food Science ######################
##########################################################
INSERT INTO department VALUES ('FOSC','Food Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13419, 5, '6351', 'Directed Studies I', 'FOSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13422, 5, '7351', 'Directed Studies II', 'FOSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21129, 6, '4070', 'Food Processing', 'FOSC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21130, 6, 'W', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21129, 21130);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23098, 6, '6325', 'Fish/Food Processing II', 'FOSC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23099, 6, 'W', TIME(STR_TO_DATE('1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23098, 23099);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23100, 6, '6351', 'Directed Studies I', 'FOSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23101, 6, '7351', 'Directed Studies II', 'FOSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

####################################################
###################### French ######################
####################################################
INSERT INTO department VALUES ('FREN','French');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11325, 5, '4994', 'Independent Research', 'FREN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11326, 5, '4996', 'Independent Research', 'FREN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21131, 6, '0011', 'Language Requirement', 'FREN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21132, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21133, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21134, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21135, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21136, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21137, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21138, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24148, 6, '1008', 'Basic French, Pt. 2', 'FREN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24045, 6, '1048', 'Intermediate French II', 'FREN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24046, 6, '1048', 'Intermediate French II', 'FREN', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24047, 6, '1048', 'Intermediate French II', 'FREN', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24048, 6, '1048', 'Intermediate French II', 'FREN', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24050, 6, '1058', 'Fr for Frmr Immersion Stdt II', 'FREN', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24051, 6, '1058', 'Fr for Frmr Immersion Stdt II', 'FREN', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21141, 6, '2002', 'Spoken French', 'FREN', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21142, 6, '2022', 'Language and Culture', 'FREN', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24052, 6, '2048', 'Advanced French II', 'FREN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24053, 6, '2048', 'Advanced French II', 'FREN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21143, 6, '2201', 'Intro to French Literature', 'FREN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21144, 6, '2202', 'Intro to French Literature', 'FREN', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21146, 6, '3000', 'Advanced Oral French Workshop', 'FREN', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21147, 6, '3017', 'Differential Linguistics', 'FREN', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21148, 6, '3022', 'Semantics/Semantique', 'FREN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24149, 6, '3048', 'Written Expression II', 'FREN', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21149, 6, '3101', 'French Culture & Civilization', 'FREN', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24224, 6, '3600', '18th Century French Lit.', 'FREN', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24070, 6, '3700', '19th French Century Lit', 'FREN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21151, 6, '4017', 'Traduction Generale', 'FREN', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21152, 6, '4600', 'Enlightment:Form & Philosophy', 'FREN', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24071, 6, '4700', 'Romantic Revolution', 'FREN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

#######################################################################
###################### Gender & Women\'s Studies ######################
#######################################################################
INSERT INTO department VALUES ('GWST','Gender & Women\'s Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11396, 5, '2191', 'Gender Across Cultures', 'GWST', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11398, 5, '2412', 'Human Sexuality', 'GWST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11405, 5, '3800', 'Gender & Health', 'GWST', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21219, 6, '1015', 'Gender and Diversity', 'GWST', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21220, 6, '1070', 'Modern Russ Culture & Civil', 'GWST', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21221, 6, '2192', 'Gender, Sexuality and Society', 'GWST', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21222, 6, '2300', 'Sex and Gender in Pre Mdn Euro', 'GWST', 'WF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21223, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24192, 6, 'M', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21222, 21223);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21222, 24192);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24303, 6, '2301', 'Making Gender:Amer Rev - Pres', 'GWST', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21224, 6, '2320', 'Witchcraft in Early Modern Eur', 'GWST', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21225, 6, '2412', 'Human Sexuality', 'GWST', 'R',
        TIME(STR_TO_DATE('1605-1855', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21226, 6, '2900', 'Intro to Art Hist & Visual Cul', 'GWST', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21229, 6, '3017', 'Sex and the Practice of Power', 'GWST', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21230, 6, '3050', 'Contemporary Women Poets', 'GWST', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21231, 6, '3426', 'Sex, Race, and the State', 'GWST', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21232, 6, '4100', 'Directed Readings', 'GWST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24276, 6, '4116', 'Cont Issues in Gen & Develop', 'GWST', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24020, 6, '4315', 'Wmn\'s Suffrage: Fr Rev to WWII', 'GWST', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21233, 6, '4390', 'NGOs & Government Services', 'GWST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21234, 6, '4500', 'Topics in Feminist Philosophy', 'GWST', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23893, 6, '4902', 'Honours Thesis Pt. 2', 'GWST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

#######################################################
###################### Geography ######################
#######################################################
INSERT INTO department VALUES ('GEOG','Geography');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21169, 6, '2006', 'Space, place and GIS', 'GEOG', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21170, 6, 'F', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21171, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21169, 21170);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21169, 21171);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21172, 6, '2202', 'Intro to Develop Stud II', 'GEOG', 'T',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21173, 6, 'W', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21174, 6, 'R', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21175, 6, 'R', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24023, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24024, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21172, 21173);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21172, 21174);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21172, 21175);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21172, 24023);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21172, 24024);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21176, 6, '2206', 'Africa: An Introduction', 'GEOG', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24227, 6, '3102', 'Coastal Change and Adaptation', 'GEOG', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24228, 6, '3106', 'The Canadian North', 'GEOG', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21177, 6, '3440', 'Geomorphology', 'GEOG', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21178, 6, '4520', 'GIS Applications to Environmen', 'GEOG', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21179, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21180, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21178, 21179);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21178, 21180);

        
####################################################
###################### German ######################
####################################################
INSERT INTO department VALUES ('GERM','German');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11372, 5, '1025', 'German Fic. In Novel and Film', 'GERM', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11373, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11374, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11375, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11376, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11372, 11373);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11372, 11374);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11372, 11375);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11372, 11376);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11377, 5, '1026', 'German Fiction, Novel & Film I', 'GERM', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11378, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11379, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11380, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11381, 5, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11377, 11378);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11377, 11379);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11377, 11380);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11377, 11381);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21185, 6, '1004', 'German for Beginners II', 'GERM', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21186, 6, '1004', 'German for Beginners II', 'GERM', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21187, 6, '1004', 'German for Beginners II', 'GERM', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21188, 6, '1004', 'German for Beginners II', 'GERM', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21190, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21191, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21192, 6, 'T', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21193, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21194, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21195, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21196, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21197, 6, 'M', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21198, 6, 'M', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21199, 6, 'M', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21190);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21191);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21192);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21193);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21194);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21195);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21196);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21197);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21198);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21185, 21199);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21190);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21191);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21192);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21193);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21194);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21195);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21196);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21197);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21198);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21186, 21199);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21190);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21191);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21192);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21193);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21194);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21195);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21196);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21197);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21198);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21187, 21199);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21190);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21191);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21192);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21193);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21194);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21195);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21196);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21197);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21198);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21188, 21199);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21200, 6, '1027', 'German Fiction Novel & Film II', 'GERM', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21201, 6, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21202, 6, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21203, 6, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21204, 6, 'R', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21200, 21201);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21200, 21202);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21200, 21203);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21200, 21204);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21205, 6, '2002', 'Intermediate German II', 'GERM', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21206, 6, 'M', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21207, 6, 'M', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21208, 6, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21205, 21206);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21205, 21207);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21205, 21208);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21209, 6, '2022', 'Translation & Composition II', 'GERM', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21211, 6, '2651', 'Modern German Philosophy I', 'GERM', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21213, 6, '3004', 'Advanced German II', 'GERM', 'WF',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21214, 6, '3010', 'Advanced Transl I: Germ-Engl', 'GERM', 'T',
        TIME(STR_TO_DATE('1635-1925', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24169, 6, '3052', 'German Seminar IV', 'GERM', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24432, 6, '3204', 'Goethe and Romanticism II', 'GERM', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21216, 6, '3401', 'Germ\'y&Euro: Cultural Union I', 'GERM', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

###################################################################
###################### Health Administration ######################
###################################################################
INSERT INTO department VALUES ('HESA','Health Administration');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23111, 6, '5315', 'Managing Change/Hlth Sys', 'HESA', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23112, 6, '5320', 'Managerial Epidemiology', 'HESA', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23113, 6, '5335', 'Info Sys/Health Administration', 'HESA', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23114, 6, '5341', 'Healthcare Economics', 'HESA', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23115, 6, '5350', 'Mgmt Cntrl/Fund Sys/Hlth Care', 'HESA', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23116, 6, '6310', 'Health Care Policy', 'HESA', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23117, 6, '6341', 'Management Union Relations', 'HESA', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23118, 6, '6345', 'Healthcare Leadership', 'HESA', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23119, 6, '6361', 'Business Law', 'HESA', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23121, 6, '6365', 'QM in Healthcare', 'HESA', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23122, 6, '6367', 'Hlth Law & Pol. Curr. Issue II', 'HESA', 'F',
        TIME(STR_TO_DATE('1205-1425', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23123, 6, '6380', 'Senior Seminar', 'HESA', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23125, 6, '6394', 'Directed Project', 'HESA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23126, 6, '6395', 'Directed Reading', 'HESA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

################################################################
###################### Health Informatics ######################
################################################################
INSERT INTO department VALUES ('HINF','Health Informatics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13456, 5, '6901', 'Directed Studies', 'HINF', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13457, 5, '7000', 'Internship', 'HINF', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23130, 6, '6102', 'HI Flow and Standards', 'HINF', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24297, 6, '6110', 'HI Systems & Issues', 'HINF', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23131, 6, '6230', 'Knowledge Management for HI', 'HINF', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23132, 6, '6300', 'Project Management', 'HINF', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23133, 6, '6901', 'Directed Studies', 'HINF', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23134, 6, '7000', 'Internship', 'HINF', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

################################################################
###################### Health Professions ######################
################################################################
INSERT INTO department VALUES ('HLTH','Health Professions');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23145, 6, '5101', 'Research Project I', 'HLTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23146, 6, '5102', 'Research Project II.', 'HLTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23147, 6, '5110', 'Mental Hlth/Add Serv/Sys', 'HLTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23150, 6, '6000', 'Health Seminar Series I', 'HLTH', 'W',
        TIME(STR_TO_DATE('1405-1555', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23151, 6, '6100', 'Aspects of Health Research', 'HLTH', 'W',
        TIME(STR_TO_DATE('1405-1555', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23152, 6, '8000', 'Comprehensive Examination', 'HLTH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

##############################################################
###################### Health Promotion ######################
##############################################################
INSERT INTO department VALUES ('HPRO','Health Promotion');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11491, 5, '1195', 'Introduction to Health Prom.', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11493, 5, '3250', 'Human Nutrition', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11495, 5, '3360', 'Mulitcul Hlth Promot Rsrc Poli', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11497, 5, '4102', 'Honours Thesis', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11498, 5, '4412', 'Human Sexuality', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13483, 5, '5601', 'Independent Study', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21305, 6, '2110', 'Health Promotion Theory', 'HPRO', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21306, 6, '2120', 'Health Promotion Policy', 'HPRO', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21307, 6, '2361', 'Program Planning', 'HPRO', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21308, 6, '3250', 'Human Nutrition', 'HPRO', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21309, 6, '3325', 'Mental Health Promotion', 'HPRO', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21310, 6, '3351', 'Injury Prevention & Safety Ed.', 'HPRO', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21311, 6, '4101', 'Applied Research Methods', 'HPRO', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21312, 6, '4412', 'Human Sexuality', 'HPRO', 'R',
        TIME(STR_TO_DATE('1605-1855', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24223, 6, '4422', 'Environmental Health', 'HPRO', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23154, 6, '5503', 'Intermed Stat - Health Scie', 'HPRO', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23155, 6, '5595', 'Prog Plan and Eval Hlth Prom', 'HPRO', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23156, 6, '5601', 'Independent Study', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23157, 6, '5601', 'Independent Study', 'HPRO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#######################################################################
###################### Health Sciences Education ######################
#######################################################################
INSERT INTO department VALUES ('HSCE','Health Sciences Education');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11501, 5, '1000', 'Found of Hlth Care Pract', 'HSCE', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11503, 5, '2020', 'Radiation Physics', 'HSCE', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11504, 5, 'W', TIME(STR_TO_DATE('1505-1625', '%k%i')),
        TIME(STR_TO_DATE('1505', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11503, 11504);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11505, 5, '2050', 'CSA for Medical Imaging', 'HSCE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21314, 6, '1010', 'Clinical Skills for Hlth Scie.', 'HSCE', 'MW',
        TIME(STR_TO_DATE('0935-1055', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21315, 6, 'T', TIME(STR_TO_DATE('<br />1405-1525<br /><br /><br />1405-1525<br /><br /><br />1405-1525', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21316, 6, 'R', TIME(STR_TO_DATE('<br />1405-1525<br /><br /><br />1405-1525<br /><br /><br />1405-1525', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21314, 21315);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21314, 21316);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21319, 6, '2030', 'Radiation Biology & Protection', 'HSCE', 'M',
        TIME(STR_TO_DATE('1405-1525<br />1105-1225', '%k%i')), TIME(STR_TO_DATE('1105', '%k%i')), 3);

##########################################################################
###################### Health and Human Performance ######################
##########################################################################
INSERT INTO department VALUES ('HAHP','Health and Human Performance');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21235, 6, '2000', 'Human Growth & Development', 'HAHP', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21236, 6, '3000', 'Community Development', 'HAHP', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

##########################################################################
###################### Hist of Science & Technology ######################
##########################################################################
INSERT INTO department VALUES ('HSTC','Hist of Science & Technology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14009, 5, '1201', 'Intro to the History of Sci I', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11512, 5, '2001', 'Beginnings of Wisdom', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11513, 5, '2102', 'Origins of Modern Medicine', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11514, 5, '2120', 'Magic, Science & Occult', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14012, 5, '2211', 'Intro to the History of Sci I', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11516, 5, '2500', 'Science Fiction in Film', 'HSTC', 'M',
        TIME(STR_TO_DATE('1735-2055', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11517, 5, '2811', 'Asia and the West', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11518, 5, '3001', 'The Scientific Revolution', 'HSTC', 'M',
        TIME(STR_TO_DATE('1235-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11519, 5, '3200', 'Scie & Relig: Hist Perspective', 'HSTC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11520, 5, '3415', 'Brewing Civilization', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11521, 5, '3501', 'The Nature of Time I', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11522, 5, '4001', 'Scie & Nat. in Mod. Period', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11523, 5, '4510', 'Independent Readings in HSTC', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23705, 6, '1202', 'Intro to the History of Sci II', 'HSTC', 'MW',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23706, 6, 'W', TIME(STR_TO_DATE('1535-1625<br />1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23707, 6, 'F', TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23705, 23706);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23705, 23707);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21338, 6, '2105', 'The Life, Sc & Phil of Einst.', 'HSTC', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23708, 6, '2212', 'Intro to the History of Sci II', 'HSTC', 'MW',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23709, 6, 'W', TIME(STR_TO_DATE('1535-1625<br />1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23710, 6, 'F', TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23708, 23709);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23708, 23710);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21339, 6, '2400', 'Science and the Media', 'HSTC', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21340, 6, '3002', 'Science in the Enlightenment', 'HSTC', 'M',
        TIME(STR_TO_DATE('1235-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23711, 6, '3032', 'Science and Culture II', 'HSTC', 'M',
        TIME(STR_TO_DATE('1035-1225<br />1035-1125<br />1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21341, 6, '3121', 'Hist of European Alchemy', 'HSTC', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21342, 6, '3201', 'Scie & Relig: Contemp Perspect', 'HSTC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21344, 6, '3320', 'Oracles, Omens & Astrology', 'HSTC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24239, 6, '3611', 'Early Modern Scie (1500-1800)', 'HSTC', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21345, 6, '3615', 'Scie. & Nature in Modrn Period', 'HSTC', 'T',
        TIME(STR_TO_DATE('1635-1725<br />1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21346, 6, '4200', 'From Techne to Technology', 'HSTC', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21347, 6, '4511', 'Independent Readings', 'HSTC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#####################################################
###################### History ######################
#####################################################
INSERT INTO department VALUES ('HIST','History');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14376, 5, '2002', 'Later Medieval Europe', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14225, 5, '2075', 'Intro to the Historyof Sci I', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11433, 5, '2280', 'African Nova Scotian History', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11434, 5, '2388', 'Lat Am Dictat Fact to Fictl', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14542, 5, '2401', 'Cave/Castle: Dress to 1450', 'HIST', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11440, 5, '2990', 'Magic, Science & Occult', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11442, 5, '3056', 'The Holocaust', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11443, 5, '3075', 'Science and Religion: Hist. Pe', 'HIST', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11450, 5, '3380', 'Slavery & Freedom in Americas', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11452, 5, '3551', 'Topics in Modern History', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11453, 5, '4000', 'Directed Reading', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11454, 5, '4001', 'Directed Readings', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14370, 5, '4981', 'Honours Essay in History I', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13459, 5, '5000', 'Directed Reading', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13460, 5, '5001', 'Directed Readings II', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13469, 5, '5475', 'African Intell Mod Experience', 'HIST', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21246, 6, '1021', 'Europe: Fren Rev to Present', 'HIST', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21247, 6, '1023', 'Europe: Fre Rev-Pres (Writing)', 'HIST', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21250, 6, 'T', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21251, 6, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21252, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21253, 6, 'R', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21254, 6, 'W', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21255, 6, '1911', 'Life Stories Seminar', 'HIST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21256, 6, '2007', 'Atlantic World 1650-1800', 'HIST', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21257, 6, '2015', 'Europ. Military Hist 1550-1740', 'HIST', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21258, 6, '2021', 'Soviet Russia', 'HIST', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21259, 6, '2042', 'Capital of Europe: Paris 19thC', 'HIST', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21260, 6, '2049', 'The 1st World War Causes & Cam', 'HIST', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21261, 6, '2064', 'Hist Erly Mod. West', 'HIST', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21262, 6, '2065', 'Evolving Spain', 'HIST', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23696, 6, '2076', 'Intro to the History of Sci II', 'HIST', 'MW',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23698, 6, 'F', TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23697, 6, 'W', TIME(STR_TO_DATE('1535-1625<br />1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23696, 23698);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23696, 23697);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21263, 6, '2082', '20th C Europe-Lit/Art/Film', 'HIST', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21264, 6, '2090', 'The Rise of Rome', 'HIST', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24262, 6, '2235', 'History of Canadian Culture', 'HIST', 'MW',
        TIME(STR_TO_DATE('1535-1655', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24267, 6, '2402', 'Castle/Cafe: Dress 1450-1700', 'HIST', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21265, 6, '2426', 'Africa:Disruption & Innovation', 'HIST', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21266, 6, '2614', 'Sex and Gender in Pre Mdn Euro', 'HIST', 'WF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21267, 6, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21268, 6, 'M', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21266, 21267);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21266, 21268);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24312, 6, '2615', 'Making Gender:Amr Rev - Pres', 'HIST', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

################################################################
###################### Indigenous Studies ######################
################################################################
INSERT INTO department VALUES ('INDG','Indigenous Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21374, 6, '2052', 'Contemp. Issue in Indg Studies', 'INDG', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24078, 6, '2902', 'Mi\'kmaw Lang Non-speakers II', 'INDG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21375, 6, '3050', 'Indg Res Meth & Knowldg Pract', 'INDG', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21376, 6, '3052', 'Indg. Social Hlth and Env Iss', 'INDG', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

####################################################################
###################### Industrial Engineering ######################
####################################################################
INSERT INTO department VALUES ('IENG','Industrial Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11525, 5, '2005', 'Engineering Economics', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11526, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11527, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11528, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11525, 11526);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11525, 11527);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11525, 11528);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11529, 5, '3302', 'Processes & Systems', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11530, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11529, 11530);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11531, 5, '3303', 'Ergonomics & Work Design', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11532, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11533, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11534, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11535, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11536, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11531, 11532);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11531, 11533);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11531, 11534);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11531, 11535);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11531, 11536);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11539, 5, '3316', 'Design Info Mngt Systems', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11540, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11539, 11540);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11541, 5, '3344', 'Operations Res.:Linear  Models', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11543, 5, '4458', 'Project and Management Control', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11544, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11543, 11544);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14558, 5, '4529', 'Indust & Org Psychology', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11545, 5, '4544', 'Routing & Scheduling', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11547, 5, '4558', 'Project Management & Control', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11548, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11547, 11548);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11549, 5, '4562', 'Maint Engrng & Managemnt', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13487, 5, '6900', 'Indust Engin\'g Methodologies', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13489, 5, '6923', 'Distribution Management', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13491, 5, '6962', 'Adv. Maint. Eng. & Mngm.', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13493, 5, '6990', 'Dir Studies Industrial Engr I', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13494, 5, '7990', 'Dir Studies Industrial Engr II', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13495, 5, '8000', 'Graduate Seminar', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21350, 6, '4432', 'Simulation of Industrial Sys.', 'IENG', 'M',
        TIME(STR_TO_DATE('1005-1125<br />1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21351, 6, 'M', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21350, 21351);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21352, 6, '4443', 'Quality Control and Reliabilit', 'IENG', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21353, 6, 'F', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21352, 21353);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21354, 6, '4445', 'Facilities Design', 'IENG', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21355, 6, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21354, 21355);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21356, 6, '4454', 'Design of Inventory Systems', 'IENG', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21357, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21356, 21357);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21358, 6, '4480', 'Industrial Engineering Design', 'IENG', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21359, 6, 'W', TIME(STR_TO_DATE('0835-1225', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21358, 21359);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21362, 6, '4564', 'Design of Hlth Care Sys.', 'IENG', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21363, 6, 'F', TIME(STR_TO_DATE('1035-1225', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21362, 21363);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24277, 6, '4565', 'Lean Engineering', 'IENG', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24278, 6, 'R', TIME(STR_TO_DATE('1735-1925', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24277, 24278);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21364, 6, '4567', 'Engineering Risk Management', 'IENG', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21365, 6, 'F', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21364, 21365);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21368, 6, '4579', 'Supply Chain Management', 'IENG', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21369, 6, 'R', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21368, 21369);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23712, 6, '4583', 'Ind Eng Design Project', 'IENG', 'T',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23713, 6, 'W', TIME(STR_TO_DATE('0835-1725', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23712, 23713);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23159, 6, '6908', 'Advanced Facilities Planning', 'IENG', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24279, 6, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23159, 24279);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23161, 6, '6909', 'Supply Chain Management', 'IENG', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24280, 6, 'R', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23161, 24280);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23165, 6, '6917', 'Simulation of Indust Systems', 'IENG', 'M',
        TIME(STR_TO_DATE('1005-1125<br />1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24281, 6, 'M', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23165, 24281);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23168, 6, '6920', 'Adv Top Linear/Integer Program', 'IENG', 'F',
        TIME(STR_TO_DATE('0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24209, 6, '6967', 'Adv. Top Eng Rsk and Saf', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23169, 6, '6990', 'Dir Studies Industrial Engr I', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23170, 6, '7990', 'Dir Studies Industrial Engr II', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23171, 6, '8000', 'Graduate Seminar', 'IENG', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

####################################################################
###################### Information Management ######################
####################################################################
INSERT INTO department VALUES ('INFO','Information Management');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13508, 5, '6700', 'Reading Course', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13509, 5, '6710', 'Reading Course', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14380, 5, '9100', 'Thesis 1', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14381, 5, '9200', 'Thesis 2', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14382, 5, '9300', 'Thesis 3', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23175, 6, '5520', 'Research Methods', 'INFO', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23176, 6, '5570', 'Organizational Mgmt & Strategy', 'INFO', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23177, 6, '6100', 'Info in Publ Pol & Decsn Makng', 'INFO', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23178, 6, '6150', 'History of the Book', 'INFO', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23179, 6, '6250', 'Serv. and Res. for Young Adult', 'INFO', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23180, 6, '6270', 'Introduction to Data Science', 'INFO', 'M',
        TIME(STR_TO_DATE('1435-1555<br />1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24011, 6, '6320', 'Legal Lit & Librarianship', 'INFO', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23181, 6, '6330', 'Cataloguing & Classification', 'INFO', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23184, 6, '6500', 'Community-Led Services', 'INFO', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24039, 6, '6513', 'Business Analytics & Data Vis', 'INFO', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24087, 6, '6540', 'Data Management', 'INFO', 'R',
        TIME(STR_TO_DATE('0835-0955<br />1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23186, 6, '6620', 'Web Design and Architecture', 'INFO', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23187, 6, '6700', 'Reading Course', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23188, 6, '6710', 'Reading Course', 'INFO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23189, 6, '6800', 'Archives', 'INFO', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23190, 6, '6810', 'Managing Info Lit Instruction', 'INFO', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

##########################################################################
###################### Interdisc Studies (Graduate) ######################
##########################################################################
INSERT INTO department VALUES ('INTE','Interdisc Studies (Graduate)');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13520, 5, '7000', 'Interdisc. Directed Studies', 'INTE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13521, 5, '7005', 'Research Directed Studies', 'INTE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23198, 6, '7000', 'Interdisc. Directed Studies', 'INTE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23199, 6, '7005', 'Research Directed Studies', 'INTE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

###########################################################################
###################### International Develop Studies ######################
###########################################################################
INSERT INTO department VALUES ('INTD','International Develop Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11597, 5, '4005', 'Directed Reading', 'INTD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13514, 5, '5000', 'Advanced Topics in INTD', 'INTD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13515, 5, '5001', 'Read Intern Devel Studies', 'INTD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21390, 6, '1103', 'Halifax and the World: Pt II', 'INTD', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21391, 6, '2002', 'Intro to Development II', 'INTD', 'T',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21392, 6, 'W', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21393, 6, 'R', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21394, 6, 'R', TIME(STR_TO_DATE('1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21395, 6, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21396, 6, 'W', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21391, 21392);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21391, 21393);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21391, 21394);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21391, 21395);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21391, 21396);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21397, 6, '2045', 'Indian Society', 'INTD', 'M',
        TIME(STR_TO_DATE('1735-2025<br />1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21398, 6, '2106', 'Africa: An Introduction', 'INTD', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21399, 6, '3003', 'Development & Activism', 'INTD', 'T',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21400, 6, 'T', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21399, 21400);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24006, 6, '3115', 'Global Health in the 21st c.', 'INTD', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21403, 6, '3116', 'Ctmp Issues in Gender & Devt', 'INTD', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24203, 6, '3119', 'Exp Learning: Canada II', 'INTD', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21404, 6, '3150', 'Aspects of Francophone World', 'INTD', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21405, 6, '4001', 'Topics in Development Studies', 'INTD', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24021, 6, '4402', 'Honours Thesis Crse B', 'INTD', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23193, 6, '5000', 'Advanced Topics in INTD', 'INTD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23194, 6, '5001', 'Read Intern Devel Studies', 'INTD', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23195, 6, '5002', 'Research Design', 'INTD', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23196, 6, '5003', 'Special Topics in INTD I', 'INTD', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24301, 6, '5006', 'Dev\'t & Phil of Social Science', 'INTD', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

###########################################################################
###################### Interprofessional Health Educ ######################
###########################################################################
INSERT INTO department VALUES ('IPHE','Interprofessional Health Educ');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21409, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21410, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21411, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21412, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21413, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21414, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21415, 6, '4900', 'Interprof Hlth Edu Portfolio', 'IPHE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

#####################################################
###################### Italian ######################
#####################################################
INSERT INTO department VALUES ('ITAL','Italian');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24054, 6, '1001', 'Italian for Beginners, Part 2', 'ITAL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24055, 6, '1001', 'Italian for Beginners, Part 2', 'ITAL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24132, 6, '1001', 'Italian for Beginners, Part 2', 'ITAL', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21416, 6, '2200', 'Modern Italian Culture', 'ITAL', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21417, 6, '2991', 'Independent Study', 'ITAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

########################################################
###################### Journalism ######################
########################################################
INSERT INTO department VALUES ('JOUR','Journalism');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30168, 4, '6001', 'Digital Journalism 1', 'JOUR', 'WF',
        TIME(STR_TO_DATE('0935-1155', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30169, 4, '6002', 'Audience and Content Strat.', 'JOUR', 'TR',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30170, 4, '6100', 'Writing Craft I', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30171, 4, '6200', 'Writing Craft II', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30172, 4, '6700', 'Public Records Research', 'JOUR', 'TR',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14023, 5, 'T', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14024, 5, 'T', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14025, 5, 'T', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14026, 5, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14027, 5, 'R', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14028, 5, 'R', TIME(STR_TO_DATE('0935-1025', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11617, 5, '3660', 'Photojournalism', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11618, 5, '3660', 'Photojournalism', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11619, 5, '3660', 'Photojournalism', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11620, 5, '3660', 'Photojournalism', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11621, 5, '3660', 'Photojournalism', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13895, 5, '4991', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13889, 5, '5151', 'Journalism Research', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13890, 5, '5153', 'Reporting Fundamentals', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13891, 5, '5156', 'Writ & Report for Audio & Vis', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13892, 5, '5701', 'Journalism & Society', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13900, 5, '5991', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14294, 5, '6151', 'Journalism Research', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23717, 6, '1003', 'Foundations of Journalism II', 'JOUR', 'T',
        TIME(STR_TO_DATE('0935-1125<br />1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23718, 6, '1003', 'Foundations of Journalism II', 'JOUR', 'T',
        TIME(STR_TO_DATE('0935-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23719, 6, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23720, 6, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23721, 6, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23722, 6, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23723, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23724, 6, 'R', TIME(STR_TO_DATE('1035-1125', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23719);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23720);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23721);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23722);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23723);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23717, 23724);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23719);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23720);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23721);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23722);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23723);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23718, 23724);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21421, 6, '2400', 'Science and the Media', 'JOUR', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21422, 6, '2701', 'Intermediate Reporting', 'JOUR', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21423, 6, '3005', 'Advanced Reporting 2', 'JOUR', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21424, 6, '3339', 'Ethics & Law for Journalists', 'JOUR', 'T',
        TIME(STR_TO_DATE('1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21425, 6, '3441', 'Advanced Creative Nonfiction', 'JOUR', 'W',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21426, 6, '3550', 'Copy Editing.', 'JOUR', 'T',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21427, 6, '3660', 'Photojournalism', 'JOUR', 'M',
        TIME(STR_TO_DATE('1835-2025', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21428, 6, '3660', 'Photojournalism', 'JOUR', 'T',
        TIME(STR_TO_DATE('1835-2025', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21429, 6, '3660', 'Photojournalism', 'JOUR', 'R',
        TIME(STR_TO_DATE('1835-2025', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21430, 6, '3660', 'Photojournalism', 'JOUR', 'W',
        TIME(STR_TO_DATE('1835-2025', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21431, 6, '3660', 'Photojournalism', 'JOUR', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21432, 6, '3670', 'Opinion Writing', 'JOUR', 'R',
        TIME(STR_TO_DATE('1835-2025', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23569, 6, '4992', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23573, 6, '4993', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23572, 6, '5992', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23575, 6, '5993', 'Workshop', 'JOUR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24000, 6, '6702', 'Advanced Reporting', 'JOUR', 'MW',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24001, 6, '6703', 'Prof. Journalism Environment', 'JOUR', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24002, 6, '6705', 'Data Journalism Methods', 'JOUR', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

#########################################################
###################### Kinesiology ######################
#########################################################
INSERT INTO department VALUES ('KINE','Kinesiology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31475, 4, '4801', 'Directed Study', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11635, 5, '2310', 'Physiology of Exercise', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11653, 5, '3250', 'Human Nutrition', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11662, 5, '3476', 'Principles of Ergonomics', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11663, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11664, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11665, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11666, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11667, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11662, 11663);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11662, 11664);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11662, 11665);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11662, 11666);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11662, 11667);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11677, 5, '3740', 'Coaching Science Seminar', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11678, 5, '4108', 'Mind/Body Connecti/ Well-Being', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11680, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11681, 5, '4577', 'Cognitive Ergonomics', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11685, 5, 'M', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13534, 5, '5523', 'Biomechan of Human Motion', 'KINE', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13535, 5, 'W', TIME(STR_TO_DATE('1605-1755', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13534, 13535);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13537, 5, '5601', 'Independent Study', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13538, 5, '5601', 'Independent Study', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13539, 5, '5601', 'Independent Study', 'KINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21433, 6, '1102', 'Physical Activity and Health', 'KINE', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21434, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21435, 6, 'M', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21436, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21437, 6, 'M', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21438, 6, 'F', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21439, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21440, 6, 'F', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21441, 6, 'F', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21442, 6, 'F', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21434);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21435);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21436);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21437);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21438);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21439);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21440);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21441);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21433, 21442);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21443, 6, '1106', 'Philosophy and Ethics for KINE', 'KINE', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21444, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21443, 21444);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21445, 6, '1108', 'Psychology and Physical Activi', 'KINE', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21446, 6, 'T', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21447, 6, 'T', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21448, 6, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21449, 6, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21450, 6, 'R', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21451, 6, 'R', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21452, 6, 'R', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21453, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21446);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21447);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21448);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21449);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21450);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21451);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21452);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21445, 21453);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21454, 6, '2430', 'Motor Control & Learning', 'KINE', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21455, 6, 'M', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21456, 6, 'M', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21457, 6, 'M', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21458, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21459, 6, 'W', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21460, 6, 'W', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21461, 6, 'W', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21455);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21456);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21457);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21458);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21459);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21460);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21454, 21461);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21462, 6, '2465', 'Introductory Biomechanics', 'KINE', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21463, 6, 'T', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21464, 6, 'T', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21465, 6, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21466, 6, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21467, 6, 'R', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21468, 6, 'R', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21469, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21470, 6, 'R', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21463);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21464);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21465);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21466);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21467);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21468);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21469);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21462, 21470);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21471, 6, '3200', 'Sociocult Iss. in Phys Activit', 'KINE', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21472, 6, '3250', 'Human Nutrition', 'KINE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21473, 6, '3320', 'Anat Basis of Human Movement', 'KINE', 'MTR',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21474, 6, '3384', 'Phys Activ-Pers with Disabilty', 'KINE', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21475, 6, '3419', 'Appl Physio Principles Perform', 'KINE', 'MTR',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21476, 6, 'F', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21477, 6, 'F', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21478, 6, 'F', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21475, 21476);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21475, 21477);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21475, 21478);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21479, 6, '3430', 'Princples of Skill Acquisition', 'KINE', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21480, 6, '3482', 'Prevention / Care of Injuries', 'KINE', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21481, 6, 'W', TIME(STR_TO_DATE('0835-0955', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21482, 6, 'W', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21483, 6, 'W', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21484, 6, 'W', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21485, 6, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21480, 21481);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21480, 21482);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21480, 21483);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21480, 21484);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21480, 21485);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24083, 6, '4418', 'Adv Exer Test&Pres-Clin Pop 2', 'KINE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21487, 6, '4600', 'Case Studies in Kines Assessmt', 'KINE', 'WF',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21488, 6, '4701', 'Senior Seminar', 'KINE', 'W',
        TIME(STR_TO_DATE('1405-1655', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21489, 6, '4706', 'Sr. Sem. Hips and Shoulders', 'KINE', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21490, 6, '4707', 'Sen Sem: Adv Sport Psych', 'KINE', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21491, 6, '4708', 'Sen Sem: Sport Nutrition', 'KINE', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24196, 6, '4709', 'Sen Sem: Phys Ac & Chron Dis', 'KINE', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

#############################################################################
###################### King\'s Foundation Year Program ######################
#############################################################################
INSERT INTO department VALUES ('KING','King\'s Foundation Year Program');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24111, 6, '1002', 'Foundation Yr Program Arts', 'KING', 'MWRF',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 12);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24112, 6, 'MWRF', TIME(STR_TO_DATE('1135-1225<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24113, 6, 'MWRF', TIME(STR_TO_DATE('1235-1325<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24114, 6, 'MWF', TIME(STR_TO_DATE('1335-1425<br />1335-1425<br />1335-1425<br />1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24111, 24112);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24111, 24113);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24111, 24114);

        
#################################################
###################### Law ######################
#################################################
INSERT INTO department VALUES ('LAWS','Law');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30174, 4, '1001', 'Criminal  Justice', 'LAWS', 'MTWRF',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31224, 4, '2003', 'Clinical Law', 'LAWS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 13);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31225, 4, '2160', 'Ind. Rsch - Sup Court NS', 'LAWS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30836, 4, '5001', 'Directed Readings in Law I', 'LAWS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21508, 6, '2520', 'Introduction to Law II', 'LAWS', 'TR',
        TIME(STR_TO_DATE('1635-1755', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23658, 6, '2800', 'Intro to Environmental Law', 'LAWS', 'T',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

#######################################################################
###################### Law, Justice, and Society ######################
#######################################################################
INSERT INTO department VALUES ('LJSO','Law, Justice, and Society');

#############################################################
###################### Leisure Studies ######################
#############################################################
INSERT INTO department VALUES ('LEIS','Leisure Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11707, 5, '2384', 'Leisure & Ind wth Disabilities', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11711, 5, '4102', 'Honours Thesis', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13545, 5, '5601', 'Independent Studies', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21509, 6, '2127', 'Leisure Theory', 'LEIS', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21510, 6, '2130', 'Found/Concpt Theraputic Rec', 'LEIS', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24417, 6, '2296', 'Leadshp & Small Grp Dynamics', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21511, 6, '2361', 'Program Planning', 'LEIS', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21512, 6, '3360', 'Analys of Leisure Serv Del Set', 'LEIS', 'R',
        TIME(STR_TO_DATE('1605-1855', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21513, 6, '3370', 'Rec Fac Dsgn & Ops Mgmt', 'LEIS', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24197, 6, '3427', 'Therapeutic Rec. Facilitation', 'LEIS', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24418, 6, '3492', 'Counsel Tech in Therap Recr', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21515, 6, '4101', 'Advanced Research Methods', 'LEIS', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24230, 6, '4807', 'Directed Study I', 'LEIS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), .75);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23220, 6, '5503', 'Intermed Stat - Health Scie', 'LEIS', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

##########################################################################
###################### Magnetic Resonance Imag Tech ######################
##########################################################################
INSERT INTO department VALUES ('MRIT','Magnetic Resonance Imag Tech');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21830, 6, '4120', 'MRI Instrumen,Safe,Contrast Me', 'MRIT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

########################################################
###################### Management ######################
########################################################
INSERT INTO department VALUES ('MGMT','Management');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11930, 5, 'R', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11956, 5, '4504', 'Mgmt of Res. and Environment', 'MGMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11957, 5, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11956, 11957);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21696, 6, '1102', 'Introductory Accounting II', 'MGMT', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21697, 6, '1102', 'Introductory Accounting II', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21698, 6, '1102', 'Introductory Accounting II', 'MGMT', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21699, 6, '1102', 'Introductory Accounting II', 'MGMT', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21700, 6, '1102', 'Introductory Accounting II', 'MGMT', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21701, 6, '1102', 'Introductory Accounting II', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21702, 6, '1102', 'Introductory Accounting II', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21703, 6, 'M', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21704, 6, 'T', TIME(STR_TO_DATE('1735-1855', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21696, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21696, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21697, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21697, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21698, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21698, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21699, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21699, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21700, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21700, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21701, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21701, 21704);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21702, 21703);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21702, 21704);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21705, 6, '1302', 'Interdisciplinary Mgmt. II', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21708, 6, '2304', 'Pple, wk, org. Macro aspects', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21709, 6, '2304', 'Pple, wk, org. Macro aspects', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21710, 6, '2304', 'Pple, wk, org. Macro aspects', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21711, 6, '2305', 'Ethics & Social Responsibility', 'MGMT', 'M',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21712, 6, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21713, 6, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21714, 6, 'W', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21711, 21712);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21711, 21713);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21711, 21714);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21716, 6, '2402', 'Mrktng App Not-for-Profit Sect', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21717, 6, '2402', 'Mrktng App Not-for-Profit Sect', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21718, 6, '2402', 'Mrktng App Not-for-Profit Sect', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21719, 6, '2502', 'Predictive Analytics', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21721, 6, '3001', 'Rsrch Mtds/App Data Analytics', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21728, 6, '3320', 'Organizational Theory', 'MGMT', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21729, 6, '3400', 'Intro to Real Estate Managemen', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21749, 6, '3702', 'Sustainable Industries', 'MGMT', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21750, 6, '3710', 'Business in Emerging Markets', 'MGMT', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21751, 6, '3802', 'Public Policy', 'MGMT', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21754, 6, '4002', 'Strategy Implementation', 'MGMT', 'M',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21755, 6, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21754, 21755);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24450, 6, '4041', 'Environmental Education', 'MGMT', 'F',
        TIME(STR_TO_DATE('0825-1135', '%k%i')), TIME(STR_TO_DATE('0825', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23976, 6, '4047', 'Conservation System Design', 'MGMT', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21757, 6, '4205', 'Law and Policy for REM', 'MGMT', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21758, 6, '4333', 'Project Management', 'MGMT', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21759, 6, '4340', 'Corporate Governance', 'MGMT', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

############################################################
###################### Marine Affairs ######################
############################################################
INSERT INTO department VALUES ('MARA','Marine Affairs');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13547, 5, '5002', 'Graduate Project', 'MARA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13548, 5, '5004', 'Marine Mgmt Skills Development', 'MARA', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13549, 5, 'F', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13548, 13549);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13550, 5, '5005', 'Independent Readings', 'MARA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13551, 5, '5009', 'Coastal Zone Management', 'MARA', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13552, 5, '5010', 'Cont Issu Ocean Mgmt Devl Pt 1', 'MARA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14456, 5, '5012', 'Community Based Co-Management', 'MARA', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23222, 6, '5002', 'Graduate Project', 'MARA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23223, 6, '5003', 'Marine Science and Technology', 'MARA', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23224, 6, '5005', 'Independent Readings', 'MARA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23225, 6, '5011', 'Cont Issu Ocean Mgmt Devl Pt 2', 'MARA', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24164, 6, '5021', 'Fisheries Management', 'MARA', 'R',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

############################################################
###################### Marine Biology ######################
############################################################
INSERT INTO department VALUES ('MARI','Marine Biology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11720, 5, '3074', 'Physiology Marine Animals I', 'MARI', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11721, 5, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11722, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11720, 11721);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11720, 11722);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11727, 5, '3761', 'Marine Ecology', 'MARI', 'MW',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11729, 5, '3800', 'Experiential Learning', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14235, 5, '4003', 'Coral Reefs & Environmental Ch', 'MARI', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11730, 5, '4370', 'Deep Sea Biology', 'MARI', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14374, 5, '4600', 'Aquaculture Modelling', 'MARI', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11731, 5, '4665', 'Hacking the Blue Planet', 'MARI', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11732, 5, '4806', 'Independent Research I', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11733, 5, '4807', 'Independent Research II', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21519, 6, '3042', 'Molecular Ecology', 'MARI', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21520, 6, '3063', 'Resource Ecology', 'MARI', 'TF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21521, 6, 'F', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21520, 21521);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21522, 6, '3076', 'Physiology Marine Animals II', 'MARI', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21523, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21524, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21522, 21523);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21522, 21524);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21525, 6, '3080', 'Ecology & Evolution Fishes', 'MARI', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21526, 6, '3090', 'Marine Mammalogy', 'MARI', 'MWF',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21527, 6, '3101', 'Microbial Ecology', 'MARI', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21528, 6, '3301', 'Invertebrate Biology', 'MARI', 'MTR',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21529, 6, 'W', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21530, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21528, 21529);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21528, 21530);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24074, 6, '3602', 'Introduction to Aquaculture', 'MARI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24076, 6, '3603', 'Practical Aquaculture', 'MARI', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21531, 6, '3800', 'Experiential Learning', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21532, 6, '4080', 'Laboratory Studies of Fishes', 'MARI', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24142, 6, '4323', 'Biologging in Ecology', 'MARI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21533, 6, '4350', 'Cutting Edge Marine Science', 'MARI', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21535, 6, '4661', 'Intro Biological Oceanography', 'MARI', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21536, 6, '4662', 'Biology of Phytoplankton', 'MARI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21537, 6, '4806', 'Independent Research I', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21538, 6, '4807', 'Independent Research II', 'MARI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21539, 6, '4901', 'Honours Research & Thesis I', 'MARI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21540, 6, '4902', 'Honours Research & Thesis II', 'MARI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

###################################################################
###################### Materials Engineering ######################
###################################################################
INSERT INTO department VALUES ('MATL','Materials Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31461, 4, '6022', 'Dir Stud in Metallurgical Engi', 'MATL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11840, 5, '3500', 'Materials Engineering', 'MATL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11841, 5, 'F', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11842, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11840, 11841);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11840, 11842);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13569, 5, '7022', 'Directed Studies in Metal Eng.', 'MATL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21647, 6, '3500', 'Materials Engineering', 'MATL', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21648, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21649, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21647, 21648);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21647, 21649);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21650, 6, '4840', 'Corrosion & Degradation Matl.', 'MATL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21651, 6, 'W', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21650, 21651);

        
#########################################################
###################### Mathematics ######################
#########################################################
INSERT INTO department VALUES ('MATH','Mathematics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13567, 5, '9520', 'Comprehensive Examinations', 'MATH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21605, 6, '2002', 'Intermediate Calculus II', 'MATH', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21606, 6, '2040', 'Matrix Theo/Linear Algebra II', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21607, 6, '2051', 'Problems in Geometry', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21608, 6, '2060', 'Intro Probability & Statistics', 'MATH', 'TRF',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21609, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21610, 6, 'R', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21611, 6, 'T', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21612, 6, 'R', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21613, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21608, 21609);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21608, 21610);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21608, 21611);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21608, 21612);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21608, 21613);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21615, 6, '2080', 'Stat Meth Data-Analys Infernce', 'MATH', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21616, 6, '2080', 'Stat Meth Data-Analys Infernce', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21617, 6, 'M', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21615, 21617);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21616, 21617);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21618, 6, '2112', 'Discrete Structures I', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21619, 6, '2113', 'Discrete Structures II', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21620, 6, '2135', 'Linear Algebra', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21621, 6, '2300', 'Mathematical Modelling', 'MATH', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21622, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21623, 6, 'M', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21621, 21622);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21621, 21623);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21624, 6, '2505', 'Introductory Analysis', 'MATH', 'TRF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21625, 6, '3032', 'Topics in Abstract Algebra', 'MATH', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21626, 6, '3080', 'Intro Complex Variables', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21627, 6, '3120', 'Differential Equations II', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21628, 6, '3210', 'Intro.Numerical Analysis', 'MATH', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21630, 6, '3460', 'Intermediate Stat Theory', 'MATH', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21631, 6, '3502', 'Intermediate Analysis II', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21632, 6, '3900', 'Financial Mathematics', 'MATH', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21633, 6, '4020', 'Analytic Function Theory', 'MATH', 'MWF',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21634, 6, '4045', 'Advanced Algebra I', 'MATH', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

####################################################################
###################### Mechanical Engineering ######################
####################################################################
INSERT INTO department VALUES ('MECH','Mechanical Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11846, 5, '3020', 'Machine Design II', 'MECH', 'TRF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11847, 5, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11848, 5, 'R', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11846, 11847);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11846, 11848);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11849, 5, '3305', 'Fluid Mechanics', 'MECH', 'TRF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11850, 5, 'R', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11851, 5, 'T', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11849, 11850);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11849, 11851);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11852, 5, '3660', 'Finite El Meth. Mech Design', 'MECH', 'TRF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11853, 5, 'W', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11854, 5, 'F', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11855, 5, 'M', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11852, 11853);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11852, 11854);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11852, 11855);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11856, 5, '3705', 'Heat Transfer', 'MECH', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11857, 5, 'T', TIME(STR_TO_DATE('1435-1725<br />1435-1725<br />1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11856, 11857);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11859, 5, '3900', 'Systems I', 'MECH', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11860, 5, 'F', TIME(STR_TO_DATE('1435-1725<br />1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11861, 5, 'R', TIME(STR_TO_DATE('1435-1725<br />1435-1725<br />1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11859, 11860);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11859, 11861);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11864, 5, '4015', 'Design Project I.', 'MECH', 'T',
        TIME(STR_TO_DATE('1305-1425<br />1105-1225', '%k%i')), TIME(STR_TO_DATE('1105', '%k%i')), 5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11865, 5, 'F', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11864, 11865);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11866, 5, '4300', 'Stress Analysis', 'MECH', 'MW',
        TIME(STR_TO_DATE('1235-1325<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11867, 5, 'W', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11868, 5, 'M', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11866, 11867);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11866, 11868);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11873, 5, '4600', 'Engineering Measurements', 'MECH', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11874, 5, 'T', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11875, 5, 'R', TIME(STR_TO_DATE('0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11876, 5, 'F', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11873, 11874);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11873, 11875);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11873, 11876);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11879, 5, '4805', 'Thermo-Fluid Engineering III', 'MECH', 'MWR',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11880, 5, 'M', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11881, 5, 'W', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11879, 11880);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11879, 11881);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13573, 5, '6910', 'Graduate Seminar I', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13574, 5, '6990', 'Directed Studies', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13575, 5, '7910', 'Graduate Seminar II', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13576, 5, '7990', 'Dir Studies Mech Engineer II', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13577, 5, '8500', 'MEng Project', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21658, 6, '3010', 'Machine Design I', 'MECH', 'TRF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21659, 6, 'R', TIME(STR_TO_DATE('1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21660, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21658, 21659);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21658, 21660);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21661, 6, '3500', 'Dynamics of Machines', 'MECH', 'TRF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21662, 6, 'M', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21661, 21662);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21663, 6, '3805', 'Thermodynamics', 'MECH', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21664, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21665, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21663, 21664);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21663, 21665);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21666, 6, '4025', 'Design Project II', 'MECH', 'F',
        TIME(STR_TO_DATE('1035-1155<br />1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21667, 6, 'F', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21666, 21667);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21672, 6, '4500', 'Vibrations', 'MECH', 'M',
        TIME(STR_TO_DATE('1135-1225<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21673, 6, 'M', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21674, 6, 'T', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21672, 21673);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21672, 21674);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21687, 6, '4900', 'Systems II', 'MECH', 'MTR',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21688, 6, 'W', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21689, 6, 'R', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21690, 6, 'F', TIME(STR_TO_DATE('0835-1025<br />0835-1025', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21687, 21688);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21687, 21689);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21687, 21690);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23253, 6, '6910', 'Graduate Seminar I', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23254, 6, '6990', 'Directed Studies', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23255, 6, '7910', 'Graduate Seminar II', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23256, 6, '7990', 'Dir Studies Mech Engineer II', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23257, 6, '8500', 'MEng Project', 'MECH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

####################################################################
###################### Medical Lab Technology ######################
####################################################################
INSERT INTO department VALUES ('MDLT','Medical Lab Technology');

#############################################################
###################### Medical Physics ######################
#############################################################
INSERT INTO department VALUES ('MEDP','Medical Physics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23260, 6, '6410', 'Med. Img. Physics (Part II)', 'MEDP', 'TR',
        TIME(STR_TO_DATE('0935-1055', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23261, 6, '6416', 'Seminars in Medical Physics', 'MEDP', 'T',
        TIME(STR_TO_DATE('1205-1255', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23262, 6, '6423', 'Radiation Therapy Physics', 'MEDP', 'W',
        TIME(STR_TO_DATE('1105-1225<br />1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23263, 6, '6431', 'Radiation Safety & Protection', 'MEDP', 'W',
        TIME(STR_TO_DATE('0935-1055<br />1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23264, 6, '6450', 'Computational Meth in Med Phyc', 'MEDP', 'MW',
        TIME(STR_TO_DATE('1405-1525', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

##############################################################
###################### Medical Research ######################
##############################################################
INSERT INTO department VALUES ('MEDR','Medical Research');

#######################################################################
###################### Microbiology & Immunology ######################
#######################################################################
INSERT INTO department VALUES ('MICI','Microbiology & Immunology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11983, 5, '1200', 'Intro General & Oral Micro.', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11984, 5, '2100', 'Intro Microbiol & Immunology', 'MICI', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11986, 5, '3114', 'Virology', 'MICI', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11987, 5, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11988, 5, 'T', TIME(STR_TO_DATE('1835-1925', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11986, 11987);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11986, 11988);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11989, 5, '3115', 'Immunology', 'MICI', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11990, 5, 'R', TIME(STR_TO_DATE('1835-1925', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (11991, 5, 'T', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11989, 11990);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 11989, 11991);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11992, 5, '3119', 'Physiology of Prokaryotic Cell', 'MICI', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11993, 5, '4119', 'Host Pathogen Interactions', 'MICI', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11994, 5, '4701', 'Adv Topics Micro & Immunology', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11995, 5, '4702', 'Adv Topics Micro & Immunology', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11996, 5, '4703', 'Directed Research Project 1', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11997, 5, '4704', 'Directed Research Project 2', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11998, 5, '4901', 'Honours Research and Thesis I', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (11999, 5, '4902', 'Honours Research and Thesis II', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13598, 5, '5003', 'Special Topics in Microbio & I', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13599, 5, '5016', 'Topics in Adv Immunol (MSc)', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13600, 5, '5019', 'Adv Topics/Mol Pathogen (MSc)', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13601, 5, '5036', 'Topics in Adv Immunol (PhD)', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13602, 5, '5039', 'Adv Topics/Molec Pathogenesis', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12000, 5, '5040', 'Pathobiology of Cancer', 'MICI', 'TR',
        TIME(STR_TO_DATE('1405-1555', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13605, 5, '5400', 'Host-Pathogen & Human Disease', 'MICI', 'T',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21788, 6, '1100', 'Health Science Microbiology', 'MICI', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21790, 6, '2115', 'Human Organs and Tissues', 'MICI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24161, 6, '2400', 'Lab Methods Microbio & Imm', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21791, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21792, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24161, 21791);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24161, 21792);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21793, 6, '3620', 'Exp Lrn in Microbiol and Immun', 'MICI', 'T',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23985, 6, '4033', 'Adv. Microbial Genetics', 'MICI', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21794, 6, '4100', 'Processes and Mediators Inflm', 'MICI', 'M',
        TIME(STR_TO_DATE('0935-1025<br />1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21795, 6, '4114', 'Adv Top Molec/Medic Virology', 'MICI', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21796, 6, '4115', 'Medical Immunology', 'MICI', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21797, 6, '4218', 'Clinical Microbiology', 'MICI', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21798, 6, '4701', 'Adv Topics Micro & Immunology', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21799, 6, '4702', 'Adv Topics Micro & Immunology', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21800, 6, '4703', 'Directed Research Project 1', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21801, 6, '4704', 'Directed Research Project 2', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21802, 6, '4901', 'Honours Research and Thesis I', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21803, 6, '4902', 'Honours Research and Thesis II', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23285, 6, '5003', 'Special Topics in Microbio & I', 'MICI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23286, 6, '5029', 'Adv Topics/Mol Pathogen (MSc)', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23287, 6, '5033', 'Adv. Microbial Genetics', 'MICI', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23288, 6, '5046', 'Topics in Adv Immunol (PhD)', 'MICI', 'M',
        TIME(STR_TO_DATE('1235-1325<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

##########################################################################
###################### Mineral Resource Engineering ######################
##########################################################################
INSERT INTO department VALUES ('MINE','Mineral Resource Engineering');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14455, 5, '4816', 'Mining Engineering Project', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13608, 5, '6001', 'Advanced Rock Mechanics', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14550, 5, '6002', 'Mine Excavation', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13609, 5, '6007', 'Directed Studies-Masters', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13610, 5, '6900', 'Graduate Seminar-Masters', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13611, 5, '7007', 'Directed Studies-PhD', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13612, 5, '7900', 'Graduate Seminar-PhD', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13613, 5, '8500', 'MEng Project', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21807, 6, '2200', 'Geology for Engineers', 'MINE', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21808, 6, 'T', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21809, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21807, 21808);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21807, 21809);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21810, 6, '3600', 'Equipment Sel and Matl. Handl.', 'MINE', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21811, 6, 'W', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21810, 21811);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21812, 6, '3611', 'Rock Mechanics', 'MINE', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21813, 6, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21812, 21813);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21814, 6, '3612', 'Rock Penetrat\'n & Fragmentat\'n', 'MINE', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21815, 6, '4100', 'Mining Geotechnique', 'MINE', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21816, 6, 'T', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21815, 21816);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21817, 6, '4706', 'Mining Geology II', 'MINE', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21818, 6, 'M', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21817, 21818);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21819, 6, '4710', 'Mine Excavation Systems', 'MINE', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21820, 6, 'M', TIME(STR_TO_DATE('1335-1525', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21819, 21820);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21821, 6, '4711', 'Mine Ventilat\'n & Environ Crtl', 'MINE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21822, 6, 'M', TIME(STR_TO_DATE('1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21821, 21822);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21823, 6, '4816', 'Mining Engineering Project', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21824, 6, '4820', 'Surface Mine Slope Stability', 'MINE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21825, 6, 'F', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21824, 21825);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21826, 6, '4850', 'Senior Design Project II', 'MINE', 'F',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (21827, 6, 'R', TIME(STR_TO_DATE('1335-1725<br />1335-1725', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 21826, 21827);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23296, 6, '6007', 'Directed Studies-Masters', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23297, 6, '6900', 'Graduate Seminar-Masters', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23298, 6, '7007', 'Directed Studies-PhD', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23299, 6, '7900', 'Graduate Seminar-PhD', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23300, 6, '8500', 'MEng Project', 'MINE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

###################################################
###################### Music ######################
###################################################
INSERT INTO department VALUES ('MUSC','Music');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31402, 4, '4250', 'Thtr & Music Entrepreneurship', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12176, 5, '3811', 'Applied Study Performance 3a', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21845, 6, '1081', 'Voice Clinic for the Theatre', 'MUSC', 'R',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21846, 6, '1222', 'Music Theory 1b', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23777, 6, '1273', 'Aural Skills 1b', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23778, 6, '1275', 'Keyboard Skills 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23779, 6, '1275', 'Keyboard Skills 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23780, 6, '1275', 'Keyboard Skills 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21847, 6, '1802', 'Applied Study 1b', 'MUSC', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21848, 6, '1802', 'Applied Study 1b', 'MUSC', 'M',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21849, 6, '1802', 'Applied Study 1b', 'MUSC', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21850, 6, '1802', 'Applied Study 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21851, 6, '1802', 'Applied Study 1b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21852, 6, '1802', 'Applied Study 1b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21853, 6, '1802', 'Applied Study 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21854, 6, '1802', 'Applied Study 1b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21855, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21856, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21857, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21858, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21859, 6, '1802', 'Applied Study 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21860, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21861, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21862, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21863, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21864, 6, '1802', 'Applied Study 1b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21865, 6, '1802', 'Applied Study 1b', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21866, 6, '1802', 'Applied Study 1b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21867, 6, '2019', 'Rock\'n Roll Era & Beyond', 'MUSC', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21868, 6, '2025', 'Guitar: Hist. & Techniques 2', 'MUSC', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21869, 6, '2025', 'Guitar: Hist. & Techniques 2', 'MUSC', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21870, 6, '2029', 'Art & Science of Drumming 2', 'MUSC', 'M',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21872, 6, '2222', 'Music Theory 2b', 'MUSC', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23781, 6, '2273', 'Aural Skills 2b', 'MUSC', 'MW',
        TIME(STR_TO_DATE('0905-0955', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21873, 6, '2355', 'Hist West Musc 1750-Present', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21904, 6, '2802', 'Applied Study 2b', 'MUSC', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21905, 6, '2802', 'Applied Study 2b', 'MUSC', 'M',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21906, 6, '2802', 'Applied Study 2b', 'MUSC', 'R',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21907, 6, '2802', 'Applied Study 2b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21908, 6, '2802', 'Applied Study 2b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21909, 6, '2802', 'Applied Study 2b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21910, 6, '2802', 'Applied Study 2b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21911, 6, '2802', 'Applied Study 2b', 'MUSC', 'F',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21912, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21913, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21914, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21915, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21916, 6, '2802', 'Applied Study 2b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21917, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21918, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21919, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21920, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1705-1825', '%k%i')), TIME(STR_TO_DATE('1705', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21921, 6, '2802', 'Applied Study 2b', 'MUSC', 'T',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21922, 6, '2802', 'Applied Study 2b', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21923, 6, '2802', 'Applied Study 2b', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21924, 6, '3160', 'Conducting', 'MUSC', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (21926, 6, '3199', 'Half-Recital.', 'MUSC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23784, 6, '3212', 'Composition 1b', 'MUSC', 'F',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24416, 6, '3263', 'Theory of Popular Musics', 'MUSC', 'TF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24369, 6, '3314', 'History of Opera.', 'MUSC', 'T',
        TIME(STR_TO_DATE('1605-1755<br />1435-1825', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

##########################################################
###################### Neuroscience ######################
##########################################################
INSERT INTO department VALUES ('NESC','Neuroscience');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12314, 5, '4000', 'Senior Seminar', 'NESC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12316, 5, '4140', 'Topics in Animal Learning', 'NESC', 'T',
        TIME(STR_TO_DATE('1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12317, 5, '4185', 'Synaptic Function, Plasticity', 'NESC', 'R',
        TIME(STR_TO_DATE('1435-1655', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14482, 5, '4225', 'Science of Mindfulness', 'NESC', 'R',
        TIME(STR_TO_DATE('1005-1155', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12318, 5, '4501', 'Honours Thesis I', 'NESC', 'F',
        TIME(STR_TO_DATE('0835-1025', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12319, 5, '4670', 'Neuro (epi) genetics & Genomic', 'NESC', 'W',
        TIME(STR_TO_DATE('1335-1525', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22080, 6, '2140', 'Learning', 'NESC', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22081, 6, '2160', 'Animal Behaviour', 'NESC', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22082, 6, '2470', 'Systems Neuroscience', 'NESC', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22083, 6, '3001', 'Dir Project Neuro', 'NESC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22084, 6, '3012', 'Exp Learn in Scie Comm II', 'NESC', 'F',
        TIME(STR_TO_DATE('1335-1525', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22085, 6, '3051', 'Sensory Neuroscience I: Vision', 'NESC', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22086, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22085, 22086);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22087, 6, '3101', 'Ind. Res. in Neuroscience II', 'NESC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22088, 6, '3131', 'Res Methods in Attention.', 'NESC', 'MW',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22089, 6, 'M', TIME(STR_TO_DATE('0935-1055', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22088, 22089);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22090, 6, '3133', 'Res Methods in Memory.', 'NESC', 'MW',
        TIME(STR_TO_DATE('1205-1255', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22091, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22090, 22091);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22092, 6, '3137', 'Rsch Meth Cognitive Neurosci', 'NESC', 'MW',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22093, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22092, 22093);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22095, 6, '3170', 'Hormones & Behaviour', 'NESC', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22096, 6, '3227', 'Prin Human Neuropsychology', 'NESC', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22097, 6, '3371', 'Neuroscience Laboratory II', 'NESC', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22098, 6, '3371', 'Neuroscience Laboratory II', 'NESC', 'T',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22099, 6, '3770', 'Behavioural Neuroscience', 'NESC', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22101, 6, '4000', 'Senior Seminar', 'NESC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22102, 6, '4070', 'Chemical Neurobiology', 'NESC', 'R',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22103, 6, '4160', 'Topics in Behaviour. Biology', 'NESC', 'T',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22104, 6, '4177', 'Theoretical Neuroscience', 'NESC', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22105, 6, '4502', 'Honours Thesis II', 'NESC', 'W',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

#########################################################################
###################### Nuclear Medicine Technology ######################
#########################################################################
INSERT INTO department VALUES ('NUMT','Nuclear Medicine Technology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12320, 5, '1000', 'Fundamentals/Nuclear Medicine', 'NUMT', 'TR',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12321, 5, 'T', TIME(STR_TO_DATE('1735-1925', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12322, 5, 'R', TIME(STR_TO_DATE('1735-1925', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12320, 12321);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12320, 12322);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12323, 5, '1010', 'Nuclear Med Instrumentation I', 'NUMT', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12324, 5, 'M', TIME(STR_TO_DATE('1605-1755', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12325, 5, 'W', TIME(STR_TO_DATE('1605-1755', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12323, 12324);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12323, 12325);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12326, 5, '2010', 'Nuclear Med Clinical Proc II', 'NUMT', 'MW',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12327, 5, 'T', TIME(STR_TO_DATE('0805-1325', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12328, 5, 'R', TIME(STR_TO_DATE('1405-1455', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12326, 12327);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12326, 12328);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12329, 5, '3200', 'Radiopharmacy', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12330, 5, 'T', TIME(STR_TO_DATE('1035-1155', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12329, 12330);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12331, 5, '3210', 'Non-Imaging Procedures', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12332, 5, 'W', TIME(STR_TO_DATE('0905-1025', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12331, 12332);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12333, 5, '3220', 'General Imaging I', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12334, 5, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12333, 12334);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12335, 5, '3230', 'Cardiac Imaging', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12336, 5, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12335, 12336);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12337, 5, '3240', 'Pediatric Imaging', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12338, 5, 'W', TIME(STR_TO_DATE('0905-1025', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12337, 12338);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12339, 5, '4000', 'Spec Practice Nuclear Medicine', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14092, 5, '4001', 'SP NUMT Tech I', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12340, 5, '4100', 'Spec Practice Nuclear Med II', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22106, 6, '1020', 'Nuclear Med Clinical Procedure', 'NUMT', 'T',
        TIME(STR_TO_DATE('1235-1355<br />1405-1525', '%k%i')), TIME(STR_TO_DATE('1405', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22107, 6, 'R', TIME(STR_TO_DATE('0805-1355', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22106, 22107);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22108, 6, '2000', 'Radiopharmacy', 'NUMT', 'MW',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22109, 6, 'M', TIME(STR_TO_DATE('1535-1755', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22110, 6, 'W', TIME(STR_TO_DATE('1535-1755', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22108, 22109);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22108, 22110);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22111, 6, '2020', 'Nuclear Med Clin Procedure III', 'NUMT', 'MW',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22112, 6, 'T', TIME(STR_TO_DATE('0805-1325', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22113, 6, 'R', TIME(STR_TO_DATE('0905-1025', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22111, 22112);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22111, 22113);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22114, 6, '3020', 'Positron Emmission Tech.', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22115, 6, 'T', TIME(STR_TO_DATE('1035-1155', '%k%i')),
        TIME(STR_TO_DATE('1035', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22114, 22115);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22116, 6, '3200', 'Radiopharmacy', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22117, 6, 'T', TIME(STR_TO_DATE('1235-1355', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22116, 22117);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22118, 6, '3210', 'Non-Imaging Procedures', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22119, 6, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22118, 22119);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22120, 6, '3222', 'General Imaging II', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22121, 6, 'T', TIME(STR_TO_DATE('0905-1025', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22120, 22121);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22122, 6, '3230', 'Cardiac Imaging', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22123, 6, 'T', TIME(STR_TO_DATE('1405-1525', '%k%i')),
        TIME(STR_TO_DATE('1405', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22122, 22123);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22124, 6, '3240', 'Pediatric Imaging', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22125, 6, 'W', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22124, 22125);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22126, 6, '4000', 'Spec Practice Nuclear Medicine', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23788, 6, '4002', 'SP NUMT Tech II', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22128, 6, '4100', 'Spec Practice Nuclear Med II', 'NUMT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

#####################################################
###################### Nursing ######################
#####################################################
INSERT INTO department VALUES ('NURS','Nursing');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12357, 5, 'T', TIME(STR_TO_DATE('<br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555<br /><br /><br />0905-1555', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12368, 5, 'W', TIME(STR_TO_DATE('<br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625<br /><br /><br />0835-1625', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12388, 5, 'R', TIME(STR_TO_DATE('<br />0835-1555<br /><br /><br />0835-1555<br /><br /><br />0835-1555<br /><br /><br />0835-1555<br /><br /><br />0835-1555<br /><br /><br />0835-1555<br /><br /><br />0835-1555', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22131, 6, '2725', 'Clinical Integration II', 'NURS', 'R',
        TIME(STR_TO_DATE('<br />0705-0855', '%k%i')), TIME(STR_TO_DATE('0705', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22133, 6, 'R', TIME(STR_TO_DATE('<br />0835-1555', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22131, 22133);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22134, 6, '2740', 'Nursing & Family Health', 'NURS', 'T',
        TIME(STR_TO_DATE('<br />0835-1125<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22136, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22137, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22138, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22139, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22140, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22141, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22142, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22143, 6, 'F', TIME(STR_TO_DATE('<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22136);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22137);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22138);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22139);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22140);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22141);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22142);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22134, 22143);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22146, 6, '2750', 'Health & Healing II', 'NURS', 'M',
        TIME(STR_TO_DATE('<br />1135-1325<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22148, 6, 'T', TIME(STR_TO_DATE('<br />1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22149, 6, 'T', TIME(STR_TO_DATE('<br />1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22150, 6, 'T', TIME(STR_TO_DATE('<br />1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22151, 6, 'T', TIME(STR_TO_DATE('<br />1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22146, 22148);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22146, 22149);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22146, 22150);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22146, 22151);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22155, 6, '3710', 'Nursing & Episodic Illness', 'NURS', 'TRF',
        TIME(STR_TO_DATE('<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22156, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22157, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22158, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22159, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22160, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22161, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22162, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22163, 6, 'R', TIME(STR_TO_DATE('<br />1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22156);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22157);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22158);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22159);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22160);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22161);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22162);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22155, 22163);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22164, 6, '3715', 'Clinical Integration III', 'NURS', 'W',
        TIME(STR_TO_DATE('<br />0735-0825', '%k%i')), TIME(STR_TO_DATE('0735', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22165, 6, 'W', TIME(STR_TO_DATE('<br />0835-1625', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22164, 22165);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23662, 6, '4331', 'Self-Directed Learning', 'NURS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22168, 6, '4472', 'Acute & Critical Care', 'NURS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22169, 6, '4710', 'Relational Practice & Adv Clin', 'NURS', 'W',
        TIME(STR_TO_DATE('<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22173, 6, '4720', 'Professional Formation', 'NURS', 'R',
        TIME(STR_TO_DATE('<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23317, 6, '5110', 'Grounded Theory', 'NURS', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23318, 6, '5110', 'Grounded Theory', 'NURS', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24444, 6, '5130', 'Critical Social Theory', 'NURS', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23320, 6, '5140', 'Comm. Res. Meth. Hlth Disparit', 'NURS', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23322, 6, '5485', 'Prin/Theo NP Practice', 'NURS', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23324, 6, '5550', 'Marginalized Populationa', 'NURS', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23326, 6, '5560', 'Hlth System Planning', 'NURS', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23328, 6, '5610', 'Adv Practice Role Develop.', 'NURS', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23330, 6, '5620', 'Adv Practice Role Practicum', 'NURS', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 6);

##################################################################
###################### Occupational Therapy ######################
##################################################################
INSERT INTO department VALUES ('OCCU','Occupational Therapy');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13656, 5, '5003', 'Dimensions of Prof Practice', 'OCCU', 'M',
        TIME(STR_TO_DATE('1105-1225<br />0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14595, 5, '5004', 'Occu Assess and Occu Analysis', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14596, 5, '5006', 'Wellness and Incl  Dsgn & Tech', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13657, 5, '5011', 'Mental Health', 'OCCU', 'M',
        TIME(STR_TO_DATE('0905-1025<br />1305-1425<br />0905-1255', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13658, 5, '5012', 'Health Conditions-Pharmacology', 'OCCU', 'W',
        TIME(STR_TO_DATE('1005-1155<br />1105-1155', '%k%i')), TIME(STR_TO_DATE('1105', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14597, 5, '5015', 'Musculoskeletal Therapeutics', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14598, 5, '5017', 'Research Approaches and EBP', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14515, 5, '5222', 'Fieldwork II', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13660, 5, '6001', 'III Neurotherapeutics', 'OCCU', 'TW',
        TIME(STR_TO_DATE('0905-1055<br />0905-1225', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14519, 5, '6002', 'Social Influences.', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13661, 5, '6006', 'Applied Research', 'OCCU', 'R',
        TIME(STR_TO_DATE('1335-1555', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14594, 5, '6013', 'Advanced Practice Issues', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13664, 5, '6222', 'Fieldwork IV.', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22184, 6, '3500', 'Human Occu Across Lifespan', 'OCCU', 'MW',
        TIME(STR_TO_DATE('1335-1455', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24317, 6, '5000', 'Theories of Occu. Enab. &Just.', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24318, 6, '5003', 'Dimensions of Prof Practice', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23341, 6, '5004', 'Occu Assess and Occu Analysis', 'OCCU', 'T',
        TIME(STR_TO_DATE('1335-1555<br />1335-1455', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23342, 6, '5006', 'Wellness and Incl  Dsgn & Tech', 'OCCU', 'T',
        TIME(STR_TO_DATE('0905-1055<br />0905-1055', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24319, 6, '5011', 'Mental Health', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24320, 6, '5012', 'Health Conditions-Pharmacology', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23343, 6, '5015', 'Musculoskeletal Therapeutics', 'OCCU', 'M',
        TIME(STR_TO_DATE('0935-1225<br />0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23344, 6, '5017', 'Research Approaches and EBP', 'OCCU', 'M',
        TIME(STR_TO_DATE('1335-1625<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22185, 6, '5112', 'Fieldwork I', 'OCCU', 'F',
        TIME(STR_TO_DATE('<br />0805-1625<br /><br /><br />1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24243, 6, '5222', 'Fieldwork II', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24313, 6, '6001', 'III Neurotherapeutics', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24314, 6, '6002', 'Social Influences.', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24315, 6, '6006', 'Applied Research', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24316, 6, '6013', 'Advanced Practice Issues', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 4);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23347, 6, '6111', 'Fieldwork III', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23348, 6, '6222', 'Fieldwork IV.', 'OCCU', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

##########################################################
###################### Oceanography ######################
##########################################################
INSERT INTO department VALUES ('OCEA','Oceanography');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12428, 5, '2001', 'The Blue Planet I', 'OCEA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12429, 5, '2020', 'Tools and Concepts in Ocean Sc', 'OCEA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12430, 5, 'W', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12429, 12430);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12432, 5, '3001', 'Intro to Physical Oceanography', 'OCEA', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12433, 5, '3002', 'Intro to Chemical Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12434, 5, '3004', 'The Last Billion Years', 'OCEA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12435, 5, '4120', 'Physical Oceanography', 'OCEA', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12436, 5, '4130', 'Chemical Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12437, 5, '4201', 'Honours Research - Part 1', 'OCEA', 'M',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14310, 5, '4250', 'Intro Acoustical Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12438, 5, '4301', 'Special Topics in Ocean Scienc', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12439, 5, '4302', 'Independent Res. in Ocean Scie', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12441, 5, '4370', 'Deep Sea Biology', 'OCEA', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12442, 5, '4401', 'Marine Management I', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12448, 5, '4665', 'Hacking the Blue Planet', 'OCEA', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13667, 5, '5001', 'Graduate Seminar', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13668, 5, '5120', 'Physical Oceanography', 'OCEA', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14306, 5, '5130', 'Chemical Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13669, 5, '5241', 'Special Topics in Oceanography', 'OCEA', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14311, 5, '5250', 'Acoustical Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22190, 6, '2002', 'The Blue Planet II', 'OCEA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22191, 6, '2021', 'Tools & Concept in Ocea Sci II', 'OCEA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22192, 6, 'W', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22191, 22192);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22193, 6, '3420', 'Geochem of Aqua Environment', 'OCEA', 'MF',
        TIME(STR_TO_DATE('1335-1425<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22194, 6, '4000', 'Oceans and Global Change', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22195, 6, '4110', 'Geological Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22196, 6, '4140', 'Biological Oceanography', 'OCEA', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22197, 6, '4202', 'Honours Research - Part II', 'OCEA', 'M',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22198, 6, '4210', 'Time Series Analysis', 'OCEA', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22199, 6, '4220', 'Numerical Modelling', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22200, 6, '4230', 'Biology of Phytoplankton', 'OCEA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22201, 6, '4301', 'Special Topics in Ocean Scienc', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22202, 6, '4302', 'Independent Res. in Ocean Scie', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22203, 6, '4380', 'Marine Modelling', 'OCEA', 'M',
        TIME(STR_TO_DATE('1135-1225<br />1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22204, 6, '4402', 'Marine Management II', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22205, 6, '4412', 'Atmospheric Dynamics II', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24237, 6, '4505', 'Atmospheric Physics', 'OCEA', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22206, 6, '4550', 'Synoptic Meteorology II', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22207, 6, 'TR', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22206, 22207);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23350, 6, '5001', 'Graduate Seminar', 'OCEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23351, 6, '5110', 'Geological Oceanography', 'OCEA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

##########################################################
###################### Oral Surgery ######################
##########################################################
INSERT INTO department VALUES ('ORAL','Oral Surgery');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14197, 5, '5000', 'Anatomy', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14198, 5, '5060', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14200, 5, '5070', 'Oral & Maxillofacial Surg. Sem', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14201, 5, '5080', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14203, 5, '6030', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14098, 5, '6040', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14205, 5, '6050', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14206, 5, '7000', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14213, 5, '7010', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14216, 5, '7020', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14217, 5, '7030', 'Research', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14218, 5, '8000', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14219, 5, '8010', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14220, 5, '8060', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23901, 6, '5000', 'Anatomy', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23902, 6, '5060', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23903, 6, '5070', 'Oral & Maxillofacial Surg. Sem', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23904, 6, '5080', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23905, 6, '6030', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23795, 6, '6040', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23906, 6, '6050', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23908, 6, '7000', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23909, 6, '7010', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23910, 6, '7020', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23911, 6, '7030', 'Research', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23912, 6, '8000', 'OMFS Surgery', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23913, 6, '8010', 'OMFS Seminar', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23921, 6, '8060', 'Oral & Maxillofacial Pathology', 'ORAL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

#########################################################
###################### PHD Program ######################
#########################################################
INSERT INTO department VALUES ('PHDP','PHD Program');

#######################################################
###################### Pathology ######################
#######################################################
INSERT INTO department VALUES ('PATH','Pathology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31431, 4, '5068', 'Directed Readings', 'PATH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22208, 6, '2115', 'Human Organs and Tissues', 'PATH', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22209, 6, '3000', 'Introduction to Pathology', 'PATH', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22210, 6, '4100', 'Critical Thnkg Neuropathology', 'PATH', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23364, 6, '5000', 'General Pathology', 'PATH', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23365, 6, '5035', 'Human Genetics', 'PATH', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23366, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23365, 23366);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23922, 6, '5050', 'Immunopathology', 'PATH', 'TR',
        TIME(STR_TO_DATE('0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23368, 6, '5067', 'Directed Readings', 'PATH', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23369, 6, '5091', 'Pathol Research Seminar Series', 'PATH', 'R',
        TIME(STR_TO_DATE('1205-1255', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23370, 6, '5100', 'Proc & Med of Inflammation', 'PATH', 'M',
        TIME(STR_TO_DATE('0935-1025<br />1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

#################################################################
###################### Performance Studies ######################
#################################################################
INSERT INTO department VALUES ('PERF','Performance Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22212, 6, '1001', 'Writing about Music', 'PERF', 'MW',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22213, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22214, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22212, 22213);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22212, 22214);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22215, 6, '1002', 'Writing About Stage and Screen', 'PERF', 'MW',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22216, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22217, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22218, 6, 'F', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22215, 22216);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22215, 22217);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22215, 22218);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24031, 6, '2451', 'Costume in Performance 1', 'PERF', 'F',
        TIME(STR_TO_DATE('1005-1255', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24030, 6, '2710', 'Stage Design 1', 'PERF', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

##########################################################
###################### Periodontics ######################
##########################################################
INSERT INTO department VALUES ('PERI','Periodontics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30739, 4, '5110', 'Clinical Periodontics', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30740, 4, '5120', 'Evidence-Base Dent&Biostat Gra', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30741, 4, '6110', 'Clinical Periodontics II', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30742, 4, '7110', 'Clinical Periodontics III', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30743, 4, '7130', 'Graduate Dentistry Seminar III', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30744, 4, '7140', 'Hospital Rotation for Grad Per', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30745, 4, '7150', 'Literature Review in Periodont', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13689, 5, '5110', 'Clinical Periodontics I', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13690, 5, '5120', 'Evidence-Based Dent & Biostat', 'PERI', 'T',
        TIME(STR_TO_DATE('0905-1155', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13691, 5, '6110', 'Clinical Periodontics II', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13692, 5, '6160', 'Oral Med, Path, Rad for Grad S', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13693, 5, '7110', 'Clinical Periodontics III', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13694, 5, '7130', 'Graduate Dentistry Seminars', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14221, 5, '7140', 'Hospital Rotation, Grad Dent.', 'PERI', 'T',
        TIME(STR_TO_DATE('0905-1055<br />1305-1455', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13695, 5, '7150', 'Lit Review in Periodontics', 'PERI', 'M',
        TIME(STR_TO_DATE('1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23377, 6, '5110', 'Clinical Periodontics I', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23378, 6, '6110', 'Clinical Periodontics II', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23379, 6, '7110', 'Clinical Periodontics III', 'PERI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23914, 6, '7140', 'Hospital Rotation, Grad Dent.', 'PERI', 'T',
        TIME(STR_TO_DATE('0905-1055<br />1305-1455', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23381, 6, '7150', 'Lit Review in Periodontics', 'PERI', 'M',
        TIME(STR_TO_DATE('1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 9);

##########################################################
###################### Pharmacology ######################
##########################################################
INSERT INTO department VALUES ('PHAC','Pharmacology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12457, 5, '3000', 'Experiential Learn in Pharm.', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12458, 5, '3001', 'Pharmacology I', 'PHAC', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12459, 5, '4000', 'Dir Res Proj in Pharmacology', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13697, 5, '5405', 'Advanced Pharmacology', 'PHAC', 'WF',
        TIME(STR_TO_DATE('1335-1455', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13698, 5, '5507', 'Pharmacology Practice Teaching', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13699, 5, '5508', 'Phac Graduate Seminar (MSc)', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13700, 5, '5509', 'Phac Graduate Seminar (PhD)', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13701, 5, '5626', 'Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13702, 5, '5627', 'Pharmacology Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13703, 5, '5628', 'Pharmacology Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22219, 6, '1472', 'Pharmacology for Pharmacy', 'PHAC', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22220, 6, '3000', 'Experiential Learn in Pharm.', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22221, 6, '4001', 'Pharmacology II', 'PHAC', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22222, 6, '4100', 'Dir Res Proj in Pharmacology', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23383, 6, '5409', 'Pharmacology II', 'PHAC', 'MWF',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23384, 6, '5507', 'Pharmacology Practice Teaching', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23385, 6, '5508', 'Phac Graduate Seminar (MSc)', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23386, 6, '5509', 'Phac Graduate Seminar (PhD)', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23387, 6, '5626', 'Pharmacology Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23388, 6, '5627', 'Pharmacology Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23389, 6, '5628', 'Pharmacology Special Topics', 'PHAC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

######################################################
###################### Pharmacy ######################
######################################################
INSERT INTO department VALUES ('PHAR','Pharmacy');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22223, 6, '1011', 'Critical Appraisal Series 1', 'PHAR', 'T',
        TIME(STR_TO_DATE('1335-1525', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 2);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22224, 6, '1052', 'Integrated PBL 2', 'PHAR', 'MWF',
        TIME(STR_TO_DATE('<br />0835-1025', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22225, 6, 'MWF', TIME(STR_TO_DATE('<br />1135-1325<br />1135-1325<br />1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22224, 22225);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22226, 6, '1062', 'Social Behaviour and Administr', 'PHAR', 'MWF',
        TIME(STR_TO_DATE('<br />1135-1425<br />1135-1425<br />1135-1425<br />1135-1425<br />1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22227, 6, '1074', 'Skills Lab 2', 'PHAR', 'R',
        TIME(STR_TO_DATE('1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22228, 6, 'RF', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22227, 22228);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23933, 6, '1075', 'Skills Lab 3', 'PHAR', 'T',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23934, 6, 'MW', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23933, 23934);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24407, 6, '1283', 'PHAR 1283', 'PHAR', 'R',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22232, 6, '2012', 'Critical Appraisal Series IB', 'PHAR', 'T',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22233, 6, '2035', 'Respiratory Tract Complaints', 'PHAR', 'MF',
        TIME(STR_TO_DATE('<br />1235-1325<br />1335-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22234, 6, 'MWF', TIME(STR_TO_DATE('<br />1435-1625<br />1435-1625<br />1435-1625<br />1435-1625<br />1435-1625<br />1435-1625<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22233, 22234);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22235, 6, '2040', 'Gastrointestinal Disorders', 'PHAR', 'MF',
        TIME(STR_TO_DATE('<br />1235-1325<br />1335-1425<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22236, 6, 'MWF', TIME(STR_TO_DATE('<br />1435-1625<br />1435-1625<br />1435-1625<br />1435-1625<br />1435-1625<br />1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22235, 22236);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22237, 6, '2060', 'Medication Use Management', 'PHAR', 'MWF',
        TIME(STR_TO_DATE('<br />1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 1.5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22238, 6, 'MWF', TIME(STR_TO_DATE('<br />1435-1525<br />1435-1525<br />1435-1525<br />1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22237, 22238);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22239, 6, '2072', 'Pharmacy Skills Lab IIB', 'PHAR', 'MWF',
        TIME(STR_TO_DATE('0835-1125<br />1235-1325', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 1.5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22240, 6, 'MWF', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22239, 22240);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22242, 6, '3012', 'Critical Appraisal Series IIB', 'PHAR', 'R',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 1.5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22243, 6, 'R', TIME(STR_TO_DATE('1305-1555<br />1305-1555<br />1305-1555<br />1305-1555<br />1305-1555<br />1305-1555<br />1305-1555<br />1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22242, 22243);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22244, 6, '3030', 'Infectious Diseases II', 'PHAR', 'M',
        TIME(STR_TO_DATE('<br />0935-1025<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22245, 6, 'MWF', TIME(STR_TO_DATE('<br />1235-1425<br />1235-1425<br />1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22244, 22245);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22246, 6, '3050', 'Pain & Rheumatology', 'PHAR', 'M',
        TIME(STR_TO_DATE('<br />0935-1025<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22247, 6, 'MWF', TIME(STR_TO_DATE('<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22246, 22247);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22248, 6, '3055', 'CNS & Behavioural Disorders', 'PHAR', 'M',
        TIME(STR_TO_DATE('<br />0935-1025<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22249, 6, 'MWF', TIME(STR_TO_DATE('<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425<br />1235-1425', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22248, 22249);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22250, 6, '3072', 'Pharmacy Skills Lab IIIB', 'PHAR', 'M',
        TIME(STR_TO_DATE('1035-1125<br />0835-1125<br />1235-1525<br />1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 1.5);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22251, 6, 'T', TIME(STR_TO_DATE('0835-1125<br />1235-1525<br />1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22250, 22251);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22252, 6, '3082', 'Practice Experience IIIB', 'PHAR', 'R',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 1.5);

########################################################
###################### Philosophy ######################
########################################################
INSERT INTO department VALUES ('PHIL','Philosophy');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12507, 5, '2210', 'Found Polit Thought 1651-1778', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12523, 5, '4700', 'Philosophy of Race', 'PHIL', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13713, 5, '5700', 'Philosophy of Race', 'PHIL', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22255, 6, '1501', 'Introduction to Philosophy, 2', 'PHIL', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23936, 6, '1810', 'Introduction to Philosophy, 1', 'PHIL', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22256, 6, '1820', 'Introduction to Philosophy, 2', 'PHIL', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22257, 6, '2020', 'Legal Thinking', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23937, 6, '2112', 'Act Like You Know', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22259, 6, '2165', 'Phil and the Black Experience', 'PHIL', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22260, 6, '2205', 'Philosophy of Religion', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22261, 6, '2220', 'Found Polit Thought 1789-1900', 'PHIL', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23938, 6, '2475', 'Justice in Global Perspective', 'PHIL', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22264, 6, '2610', 'History of Phil -Rationalists', 'PHIL', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24433, 6, '2651', 'Modern German Philosophy I', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22265, 6, '2680', 'Ethics in Science', 'PHIL', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22266, 6, '2810', 'Ethics & Hlth Care: Soc Policy', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22267, 6, '3051', 'Epistemology', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22268, 6, '3211', 'Philosophy of Law', 'PHIL', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22269, 6, '3420', 'Philosophy of Biology', 'PHIL', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22270, 6, '3640', '20th Century Philosophy', 'PHIL', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22272, 6, '3800', 'Philosophy of Medicine', 'PHIL', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24193, 6, '4190', 'Topics in History of Phil I', 'PHIL', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

###########################################################################
###################### Physics & Atmospheric Science ######################
###########################################################################
INSERT INTO department VALUES ('PHYC','Physics & Atmospheric Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12579, 5, '3303', 'Materials Science', 'PHYC', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12587, 5, '4160', 'Mathemat. Methods of Physics', 'PHYC', 'MWF',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13727, 5, '6410', 'Med. Img. Physics (Part II)', 'PHYC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22311, 6, '2150', 'Physics Tools: Experiment', 'PHYC', 'T',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22312, 6, 'M', TIME(STR_TO_DATE('1435-1725<br />1535-1725', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22311, 22312);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22313, 6, '2270', 'Intro to Applied Geophysics', 'PHYC', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22314, 6, 'W', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22313, 22314);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22315, 6, '2310', 'Energy and the Environment', 'PHYC', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22316, 6, '2452', 'Stellar & Galactic Astrophysic', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22317, 6, 'T', TIME(STR_TO_DATE('1905-1955', '%k%i')),
        TIME(STR_TO_DATE('1905', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22316, 22317);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22318, 6, '2510', 'Electricity & Magnetism', 'PHYC', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22319, 6, 'MW', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22318, 22319);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22320, 6, '3010', 'Experimental Physics II', 'PHYC', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22321, 6, 'TR', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22320, 22321);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22323, 6, '3590', 'Advanced Classical Mechanics', 'PHYC', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22324, 6, '4250', 'Topics in Numerical Computing', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22326, 6, '4412', 'Atmospheric Dynamics II', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22327, 6, '4460', 'Advanced Optics', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22328, 6, '4505', 'Atmospheric Physics', 'PHYC', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22329, 6, '4550', 'Synoptic Meteorology II', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1205-1325', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22330, 6, 'TR', TIME(STR_TO_DATE('1335-1425', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22329, 22330);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22331, 6, '4570', 'Radiative Transfer', 'PHYC', 'MWF',
        TIME(STR_TO_DATE('1335-1425', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24231, 6, '4650', 'General Relativity', 'PHYC', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22333, 6, '4850', 'Honors Research Project II', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22334, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22333, 22334);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23408, 6, '5250', 'Topics in Numerical Computing', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23409, 6, '5412', 'Atmospheric Dynamics II', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23410, 6, '5460', 'Optics', 'PHYC', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23411, 6, '5505', 'Atmospheric Physics', 'PHYC', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

########################################################
###################### Physiology ######################
########################################################
INSERT INTO department VALUES ('PHYL','Physiology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12600, 5, '1500', 'Human Phyl for Pharmacy', 'PHYL', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12601, 5, '2041', 'Human Neurophysiology', 'PHYL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12603, 5, '3120', 'Exercise Physiology', 'PHYL', 'TR',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12604, 5, '3600', 'Directed Project in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12605, 5, '4000', 'Synaptic Function, Plasticity', 'PHYL', 'R',
        TIME(STR_TO_DATE('1435-1655', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12606, 5, '4324', 'Endocrine Physiology', 'PHYL', 'T',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12607, 5, '4504', 'Respiratory Physiology', 'PHYL', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13742, 5, '5504', 'Advanced Respiration', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13743, 5, '5508', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13744, 5, '5509', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13745, 5, '5510', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13746, 5, '5513', 'Endocrine Physiology', 'PHYL', 'T',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13747, 5, '5517', 'Physiology Grad Seminar', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13748, 5, '5519', 'Moleclr Physiol of Ion Channls', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24003, 6, '1012', 'Human Physiology 2', 'PHYL', 'MWF',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24004, 6, 'M', TIME(STR_TO_DATE('1635-1825', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 24003, 24004);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22340, 6, '2044', 'Human Systems Physiology', 'PHYL', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22341, 6, '3320', 'Human Cell Physiology.', 'PHYL', 'MW',
        TIME(STR_TO_DATE('1335-1455', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22342, 6, '3520', 'Core Concepts in Med Physiolog', 'PHYL', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22343, 6, '3600', 'Directed Project in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22344, 6, '3620', 'Human Physiology Lab', 'PHYL', 'TR',
        TIME(STR_TO_DATE('1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22345, 6, '4680', 'Cardiovascular Physiology', 'PHYL', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23429, 6, '5508', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23430, 6, '5509', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23431, 6, '5510', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23432, 6, '5517', 'Physiology Grad Seminar', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22346, 6, '5568', 'Adv. Cardio Phys.', 'PHYL', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23433, 6, '5608', 'Dir Reading in Physiology', 'PHYL', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

###########################################################
###################### Physiotherapy ######################
###########################################################
INSERT INTO department VALUES ('PHYT','Physiotherapy');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13759, 5, 'F', TIME(STR_TO_DATE('1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13761, 5, 'R', TIME(STR_TO_DATE('1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13763, 5, 'T', TIME(STR_TO_DATE('1305-1555', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14615, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14616, 5, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14437, 5, '5500', 'Clinical Placement (Orient)', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12613, 5, 'WF', TIME(STR_TO_DATE('0835-1225', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (14314, 5, 'M', TIME(STR_TO_DATE('1335-1425<br />1335-1425<br />1335-1425<br />1535-1625<br />1535-1625<br />1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14612, 5, '6502', 'Clinical Internship # 4', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23436, 6, '5020', 'Intro Comp for Data Acquis & P', 'PHYT', 'MW',
        TIME(STR_TO_DATE('0935-1125<br />0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23437, 6, '5030', 'Special Topics Neurology I', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23915, 6, '5040', 'Graduate Seminar Series', 'PHYT', 'M',
        TIME(STR_TO_DATE('1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23438, 6, '5070', 'Directed Study', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23439, 6, '5080', 'Directed Study', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24330, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24331, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (24332, 6, '', TIME(STR_TO_DATE('0001', '%k%i')),
        TIME(STR_TO_DATE('2359', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23440, 6, '5202', 'Scientific Inquiry I', 'PHYT', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23441, 6, '5214', 'Cardio Physiotherapy HPRO II', 'PHYT', 'MTF',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23442, 6, 'WF', TIME(STR_TO_DATE('1305-1655', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23441, 23442);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23444, 6, '5215', 'Muscoloskeletal Physio II', 'PHYT', 'MTF',
        TIME(STR_TO_DATE('1005-1155', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23445, 6, 'MWF', TIME(STR_TO_DATE('1305-1655', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23444, 23445);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23447, 6, '5300', 'Surface EMG', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23448, 6, '5460', 'Advanced Exercise Physiol.', 'PHYT', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23449, 6, 'WR', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23448, 23449);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24328, 6, '5501', 'Clinical Internship 1', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24359, 6, '5502', 'Clinical Internship 2', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23916, 6, '5590', 'Measurement & Instrumentation', 'PHYT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23451, 6, '6106', 'Professional Issues in PT', 'PHYT', 'R',
        TIME(STR_TO_DATE('<br />1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

######################################################
###################### Planning ######################
######################################################
INSERT INTO department VALUES ('PLAN','Planning');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14334, 5, '2002', 'Community Design Methods', 'PLAN', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14441, 5, '2009', 'Introduction to Policy Making', 'PLAN', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14302, 5, '2101', 'Data, Probability and Planning', 'PLAN', 'W',
        TIME(STR_TO_DATE('0935-1125<br />0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12620, 5, '3030', 'Site Planning', 'PLAN', 'F',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12621, 5, '3045', 'Community Design Practice', 'PLAN', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12623, 5, '3110', 'Plan.  for Healthy Communities', 'PLAN', 'T',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12624, 5, '4001', 'Environmental Planning Studio', 'PLAN', 'TR',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12625, 5, '4002', 'Urban Design Studio', 'PLAN', 'TR',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12626, 5, '4050', 'Thesis Proposal', 'PLAN', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12627, 5, '4101', 'Hist. & Theo. of Urban Design', 'PLAN', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12628, 5, '4105', 'Land Development Economics', 'PLAN', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12630, 5, '4125', 'Negotiation & Conflct Mgmt', 'PLAN', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14418, 5, '4150', 'Topics in Planning', 'PLAN', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12631, 5, '4200', 'Independent Study', 'PLAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13772, 5, '5000', 'Planning Studio I', 'PLAN', 'TR',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13776, 5, '5101', 'Hist. & Philosophy of Planning', 'PLAN', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13777, 5, '5102', 'Planning Practice', 'PLAN', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13778, 5, '5303', 'Planning Methods', 'PLAN', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13779, 5, 'W', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13778, 13779);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13780, 5, '6000', 'Planning Proj and Sem', 'PLAN', 'F',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 9);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22355, 6, '1002', 'Intro to Community Design', 'PLAN', 'W',
        TIME(STR_TO_DATE('1635-1825', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22356, 6, 'W', TIME(STR_TO_DATE('1835-1925', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22357, 6, 'W', TIME(STR_TO_DATE('1935-2025', '%k%i')),
        TIME(STR_TO_DATE('1935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22358, 6, 'F', TIME(STR_TO_DATE('1835-1925', '%k%i')),
        TIME(STR_TO_DATE('1835', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22359, 6, 'F', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22355, 22356);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22355, 22357);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22355, 22358);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22355, 22359);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22361, 6, '2006', 'Space, Place and GIS', 'PLAN', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22362, 6, 'F', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22363, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22361, 22362);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22361, 22363);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24225, 6, '2010', 'Sustainable Community Design', 'PLAN', 'W',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23989, 6, '2201', 'Introduction to Environmental', 'PLAN', 'M',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23998, 6, '3015', 'Site Infrastructure', 'PLAN', 'F',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22364, 6, '3100', 'Transport. & Land Use Planning', 'PLAN', 'R',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22365, 6, '3115', 'Social Justice', 'PLAN', 'W',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22368, 6, '4035', 'Application of Planning Law', 'PLAN', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22369, 6, '4100', 'Community Design Internship', 'PLAN', 'T',
        TIME(STR_TO_DATE('1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22370, 6, '4106', 'Transportation Planning', 'PLAN', 'M',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22371, 6, '4200', 'Independent Study', 'PLAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22372, 6, '4500', 'Thesis Project', 'PLAN', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23999, 6, '5015', 'Site Infrastructure', 'PLAN', 'F',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23461, 6, '5035', 'Application of Planning Law', 'PLAN', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23462, 6, '5051', 'Topics in Community Design II', 'PLAN', 'W',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23466, 6, '5304', 'Planning Research Methods', 'PLAN', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23467, 6, '5500', 'Planning Studio 2', 'PLAN', 'TF',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23468, 6, '6106', 'Transportation Planning', 'PLAN', 'M',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23469, 6, '6201', 'Directed Studies', 'PLAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

###############################################################
###################### Political Science ######################
###############################################################
INSERT INTO department VALUES ('POLI','Political Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12644, 5, '3311', 'Sport & Politics', 'POLI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23810, 6, '1002', 'Introduction to Gov & Poli II', 'POLI', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22379, 6, '1065', 'Political Worlds: Global Domai', 'POLI', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22380, 6, '2215', 'Canadian Aboriginal Politics', 'POLI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22381, 6, '2220', 'Structures of Cana Parliam Gov', 'POLI', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22382, 6, '2302', 'Comp Poli II: Developing World', 'POLI', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22383, 6, '2420', 'Political Thought 1789-1900', 'POLI', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22384, 6, '2530', 'Foreign Policy in Thry & Pract', 'POLI', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22385, 6, '3206', 'Const Law and Politics in Ca', 'POLI', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22386, 6, '3208', 'Cdn. Provincial Politics', 'POLI', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22387, 6, '3315', 'African Politics', 'POLI', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22388, 6, '3378', 'Am. Pol. Polarization & Crisis', 'POLI', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22389, 6, '3390', 'Politics of Consumption', 'POLI', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24090, 6, '3420', 'The Int. Politics of Mobility', 'POLI', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22390, 6, '3426', 'Sex, Race, and the State', 'POLI', 'TR',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22392, 6, '3492', 'Political Inquiry I', 'POLI', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22393, 6, '3505', 'Human Rights:  Foundations', 'POLI', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22394, 6, '3520', 'Building Democracy & Peace', 'POLI', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22395, 6, '3569', 'Canadian Foreign Policy', 'POLI', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22396, 6, '3603', 'Readings in Political Science', 'POLI', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

####################################################################
###################### Post-Graduate Pharmacy ######################
####################################################################
INSERT INTO department VALUES ('PGPH','Post-Graduate Pharmacy');

############################################################################
###################### Process Engineering & App Scie ######################
############################################################################
INSERT INTO department VALUES ('PEAS','Process Engineering & App Scie');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23373, 6, '6000', 'Research Methodology', 'PEAS', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23374, 6, '6020', 'Biomass Valorization', 'PEAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22211, 6, '6250', 'Adv. Transport Pheonomena', 'PEAS', 'TR',
        TIME(STR_TO_DATE('1135-1325', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23375, 6, '6710', 'Research Symposium I.', 'PEAS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

############################################################
###################### Prosthodontics ######################
############################################################
INSERT INTO department VALUES ('PROS','Prosthodontics');

########################################################
###################### Psychiatry ######################
########################################################
INSERT INTO department VALUES ('PSYR','Psychiatry');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13819, 5, '5001', 'Independent Study', 'PSYR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13820, 5, '6001', 'Core Persp on Psych Disorders', 'PSYR', 'W',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23506, 6, '5001', 'Independent Study', 'PSYR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24234, 6, '6003', 'Fundamentals of Applied S', 'PSYR', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

########################################################
###################### Psychology ######################
########################################################
INSERT INTO department VALUES ('PSYO','Psychology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12757, 5, '4000', 'Senior Seminar', 'PSYO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12761, 5, '4140', 'Topics in Animal Learning', 'PSYO', 'T',
        TIME(STR_TO_DATE('1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14481, 5, '4225', 'Science of Mindfulness', 'PSYO', 'R',
        TIME(STR_TO_DATE('1005-1155', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12762, 5, '4501', 'Honours Thesis I', 'PSYO', 'F',
        TIME(STR_TO_DATE('0835-1025', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13802, 5, '5000', 'Research Assignment', 'PSYO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13803, 5, '5001', 'Independent Study', 'PSYO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13804, 5, '6003', 'Multivariate   Methods', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13805, 5, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13804, 13805);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13806, 5, '6102', 'Child Assessment', 'PSYO', 'R',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13807, 5, '6104', 'Psychopathology: Lifespan', 'PSYO', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13808, 5, '6105', 'Ethics & Prof Decision Making', 'PSYO', 'F',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12763, 5, '6106', 'Foundation Prac Sk-Clinical Ps', 'PSYO', 'T',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13809, 5, '6204', 'Intervention: Lifespan', 'PSYO', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13810, 5, '6240', 'Topics in Animal Learning', 'PSYO', 'T',
        TIME(STR_TO_DATE('1535-1725', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12764, 5, '6303', 'Adv Clin Practice Skills', 'PSYO', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13811, 5, '6304', 'Clinical Rnds/Case Conf.', 'PSYO', 'M',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13812, 5, '7100', 'Teaching  Effectiveness', 'PSYO', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13813, 5, '7501', 'Methods of Psycholog. Inq. I', 'PSYO', 'R',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14599, 5, '8011', 'Psy & Neuro Colloquium Masters', 'PSYO', 'T',
        TIME(STR_TO_DATE('1135-1255<br />1535-1655', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14600, 5, '8012', 'Psy & Neuro Colloquium PhD yr1', 'PSYO', 'T',
        TIME(STR_TO_DATE('1135-1255<br />1535-1655', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22450, 6, '2080', 'Social Psychology', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22451, 6, '2090', 'Developmental Psychology', 'PSYO', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22452, 6, '2140', 'Learning', 'PSYO', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22453, 6, '2160', 'Animal Behaviour.', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22454, 6, '2220', 'Abnormal Behaviour', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22455, 6, '2470', 'Systems Neuroscience', 'PSYO', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22456, 6, '3001', 'Dir. Research in Psychology', 'PSYO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22457, 6, '3012', 'Exp. Learning Scie. Comm. II', 'PSYO', 'F',
        TIME(STR_TO_DATE('1335-1525', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22458, 6, '3051', 'Sensory Neuroscience I: Vision', 'PSYO', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22459, 6, 'F', TIME(STR_TO_DATE('1135-1225', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22458, 22459);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24118, 6, '3060', 'Sex & Gender', 'PSYO', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22460, 6, '3082', 'Experimental Social Psychology', 'PSYO', 'WF',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22461, 6, '3091', 'Methods in Development Psyo', 'PSYO', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22462, 6, '3093', 'Language and Literacy', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22463, 6, '3101', 'Ind. Res. in Psychology II', 'PSYO', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22464, 6, '3122', 'Methods in Exp Clin Psychology', 'PSYO', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22465, 6, '3131', 'Res Methods in Attention.', 'PSYO', 'MW',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22466, 6, 'M', TIME(STR_TO_DATE('0935-1055', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22465, 22466);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22467, 6, '3133', 'RES Methods in Memory.', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1205-1255', '%k%i')), TIME(STR_TO_DATE('1205', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22468, 6, 'M', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22467, 22468);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22469, 6, '3137', 'Rsch Meth Cognitive Neurosci', 'PSYO', 'MW',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22470, 6, 'R', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22469, 22470);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22472, 6, '3170', 'Hormones & Behaviour', 'PSYO', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

###################################################################
###################### Public Administration ######################
###################################################################
INSERT INTO department VALUES ('PUAD','Public Administration');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13823, 5, '5100', 'Org Dsgn Gover & Publc Mgmt', 'PUAD', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13824, 5, '5120', 'Introduction to Public Policy', 'PUAD', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13825, 5, '5130', 'Managerial Economics', 'PUAD', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13826, 5, 'R', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13825, 13826);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13827, 5, '5140', 'Quantitative Methods I', 'PUAD', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (13828, 5, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 13827, 13828);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14367, 5, '5201', 'Professional Development 1', 'PUAD', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12766, 5, '6020', 'Food Policy & Sustainability', 'PUAD', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14368, 5, '6201', 'Prof Development 3', 'PUAD', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13832, 5, '6450', 'Health Policy and Economics', 'PUAD', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23508, 6, '5131', 'Public Economics', 'PUAD', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23509, 6, 'M', TIME(STR_TO_DATE('1435-1725', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23508, 23509);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23510, 6, '5170', 'Public Sector Human Resources', 'PUAD', 'T',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23511, 6, '5180', 'Res Methods & Policy Analysis', 'PUAD', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23512, 6, 'F', TIME(STR_TO_DATE('1135-1425', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23511, 23512);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24064, 6, '5202', 'PD - Self & Teams in Workplace', 'PUAD', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23514, 6, '5250', 'Strategic Financial Management', 'PUAD', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23515, 6, 'T', TIME(STR_TO_DATE('1735-2025', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23514, 23515);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23516, 6, '6000', 'Sr Sem: Ethics, Pub Serv & Gov', 'PUAD', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23517, 6, '6150', 'Info in Pol & Decision-Making', 'PUAD', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24066, 6, '6202', 'Prof Development 4', 'PUAD', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23520, 6, '6500', 'Business & Government', 'PUAD', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23521, 6, '6561', 'Security-Development Nexus', 'PUAD', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

#####################################################################
###################### Radiological Technology ######################
#####################################################################
INSERT INTO department VALUES ('RADT','Radiological Technology');

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12768, 5, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12769, 5, 'T', TIME(STR_TO_DATE('1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12770, 5, 'R', TIME(STR_TO_DATE('0905-0955', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12772, 5, 'F', TIME(STR_TO_DATE('1705-1855', '%k%i')),
        TIME(STR_TO_DATE('1705', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12774, 5, 'R', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12775, 5, 'T', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12776, 5, 'TR', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12778, 5, 'W', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12779, 5, 'M', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (10027, 5, '4000', 'Spec Prac Radiolog Technology', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12780, 5, '4000', 'Spec Prac Radiolog Technology', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 12);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12781, 5, '4100', 'Spec Prac Radiolog Tech II', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12782, 5, '4200', 'Pediatric Radiography', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12783, 5, '4210', 'Prof Skill Development in RADT', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22484, 6, '1020', 'Skeletal & Systems Radiography', 'RADT', 'TR',
        TIME(STR_TO_DATE('1235-1355', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22485, 6, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22486, 6, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22487, 6, 'M', TIME(STR_TO_DATE('1405-1525<br />1335-1455', '%k%i')),
        TIME(STR_TO_DATE('1335', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22484, 22485);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22484, 22486);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22484, 22487);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22488, 6, '2010', 'Imaging Equipment', 'RADT', 'TR',
        TIME(STR_TO_DATE('1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22489, 6, 'W', TIME(STR_TO_DATE('1505-1625', '%k%i')),
        TIME(STR_TO_DATE('1505', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22488, 22489);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22490, 6, '2020', 'Adaption Radiography', 'RADT', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22491, 6, 'M', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22492, 6, 'F', TIME(STR_TO_DATE('0805-1155', '%k%i')),
        TIME(STR_TO_DATE('0805', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22493, 6, 'T', TIME(STR_TO_DATE('1205-1325', '%k%i')),
        TIME(STR_TO_DATE('1205', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22490, 22491);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22490, 22492);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22490, 22493);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22494, 6, '3210', 'CT & Interventional Imaging', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22495, 6, '3220', 'Fluoroscopic Img & Spec Proc', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22496, 6, '3240', 'General/Adpt Radiography', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22499, 6, '4100', 'Spec Prac Radiolog Tech II', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22500, 6, '4200', 'Pediatric Radiography', 'RADT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

##########################################################################
###################### Registration Course-Graduate ######################
##########################################################################
INSERT INTO department VALUES ('REGN','Registration Course-Graduate');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30764, 4, '9999', 'Graduate Program Fee Reg\'n', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30765, 4, '9999', 'Graduate Program Fee Reg\'n', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30766, 4, '9999', 'Graduate Program Fee Reg\'n', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30767, 4, '9999', 'Graduate Program Fee Reg\'n', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31133, 4, '9999', 'Graduate Program Fee Reg\'n', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30768, 4, '9999', 'Graduate Program Fee Reg\'n MFA', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30311, 4, '9999', 'Graduate Program Fee Reg\'n-MBA', 'REGN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

###############################################################
###################### Religious Studies ######################
###############################################################
INSERT INTO department VALUES ('RELS','Religious Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12785, 5, '0400', 'Rels Stud Honours Examination', 'RELS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12790, 5, '2120', 'Magic, Science & Occult', 'RELS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12796, 5, '3200', 'Scie & Reli: Hist Perspective', 'RELS', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22502, 6, '0400', 'Rels Stud Honours Examination', 'RELS', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22503, 6, '1001', 'Religions of the East', 'RELS', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22504, 6, '2001', 'Judaism', 'RELS', 'WF',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22505, 6, '2026', 'Paganism', 'RELS', 'MWF',
        TIME(STR_TO_DATE('0935-1025', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22506, 6, '2052', 'Cultural Intro to Arab World', 'RELS', 'MW',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22507, 6, '2205', 'Philosophy of Religion', 'RELS', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22508, 6, '2420', 'Witchcraft in Earl Mod Eur', 'RELS', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22509, 6, '3012', 'Mystics of the Middle East', 'RELS', 'R',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22511, 6, '3112', 'Buddhism in India and Tibet.', 'RELS', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22512, 6, '3121', 'Hist of European Alchemy', 'RELS', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22513, 6, '3201', 'Scie & Reli: Contemp Persp', 'RELS', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22514, 6, '4010', 'Islamic Phil.: al-Ghazali', 'RELS', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22515, 6, '4060', 'The Consolation of Philosophy', 'RELS', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22516, 6, '4501', 'Seminar on Neoplatonism I', 'RELS', 'W',
        TIME(STR_TO_DATE('1905-2155', '%k%i')), TIME(STR_TO_DATE('1905', '%k%i')), 3);

#################################################################
###################### Respiratory Therapy ######################
#################################################################
INSERT INTO department VALUES ('RSPT','Respiratory Therapy');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30313, 4, '1500', 'Clinical Prac 1', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (30314, 4, '2500', 'Clinical Prac II in RSPT', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12807, 5, 'R', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12809, 5, 'W', TIME(STR_TO_DATE('0905-1155', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14116, 5, '3001', 'Anesthes Instsr & Clin Tech I', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14117, 5, '3011', 'Neonatal & Pediat Therapeut I', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14118, 5, '3021', 'Cardiac & Pulmonary Diag I', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14119, 5, '3231', 'Crit Care Instru & Clin Tech I', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14120, 5, '3251', 'Health Practice I', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22522, 6, '1020', 'Resp Clin Assess & Tech', 'RSPT', 'M',
        TIME(STR_TO_DATE('1405-1525<br />1235-1355', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22523, 6, 'T', TIME(STR_TO_DATE('0835-1125', '%k%i')),
        TIME(STR_TO_DATE('0835', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22522, 22523);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22524, 6, '1030', 'Cardiopulmonary Physiology I', 'RSPT', 'MT',
        TIME(STR_TO_DATE('1235-1355<br />0905-1025', '%k%i')), TIME(STR_TO_DATE('0905', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22525, 6, '2020', 'Appl. of Mech. Ventilation', 'RSPT', 'M',
        TIME(STR_TO_DATE('0835-0955<br />1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22526, 6, 'R', TIME(STR_TO_DATE('0905-1155', '%k%i')),
        TIME(STR_TO_DATE('0905', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22525, 22526);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22527, 6, '2050', 'Hlth Practice for Resp Therapy', 'RSPT', 'T',
        TIME(STR_TO_DATE('1235-1355<br />1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22528, 6, 'M', TIME(STR_TO_DATE('1235-1525', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 0);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22529, 6, '2065', 'Resp Disease * Therapeutics II', 'RSPT', 'M',
        TIME(STR_TO_DATE('1005-1125<br />1405-1525<br />1235-1355', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23814, 6, '3002', 'Anesthes Instsr & Clin Tech II', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23815, 6, '3012', 'Neonatal & Pediat Therapeut II', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23816, 6, '3022', 'Cardiac & Pulmonary Diag II', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23817, 6, '3232', 'Crit Care Instr & Clin Tech II', 'RSPT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#############################################################
###################### Russian Studies ######################
#############################################################
INSERT INTO department VALUES ('RUSN','Russian Studies');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12815, 5, '1002', 'Elementary Russian I', 'RUSN', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12816, 5, '1020', 'Russ Cult& Civil Under Tsars', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12817, 5, '2002', 'Intermediate Russian I', 'RUSN', 'MWF',
        TIME(STR_TO_DATE('1035-1125', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12818, 5, '2022', 'Imperial Russia', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12823, 5, '3060', 'Special Topics', 'RUSN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12825, 5, '3121', '19th C Russ Prose & Poetry', 'RUSN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22530, 6, '1003', 'Elementary Russian II', 'RUSN', 'MWF',
        TIME(STR_TO_DATE('1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22531, 6, '1003', 'Elementary Russian II', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22532, 6, '1070', 'Modern Russ Culture & Civil', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22533, 6, '2003', 'Intermediate Russian II', 'RUSN', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22534, 6, '2023', 'Soviet Russia', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24272, 6, '2034', 'Soviet Sci & Techno Utopia', 'RUSN', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22535, 6, '2037', 'Russian Film II', 'RUSN', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24271, 6, '2750', 'Dostoevsky & Russian Idea', 'RUSN', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22538, 6, '3003', 'Advanced Russian II', 'RUSN', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22540, 6, '4003', 'Structure Contemp Russ II', 'RUSN', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

#####################################################
###################### Science ######################
#####################################################
INSERT INTO department VALUES ('SCIE','Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14208, 5, '2001', 'Intro Hist of Science I', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12859, 5, '3100', 'Experiential Learning MedSci', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12860, 5, '4101', 'Directed Project MedSci I', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12861, 5, '4102', 'Directed Project MedSci II', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12862, 5, '4444', 'Leadership in Science', 'SCIE', 'T',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (12863, 5, 'T', TIME(STR_TO_DATE('1935-2025', '%k%i')),
        TIME(STR_TO_DATE('1935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (5, 12862, 12863);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12864, 5, '4701', 'Sci & Tech Innov Comm Ent I', 'SCIE', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12865, 5, '4901', 'MDSC Honours Res & Thesis I', 'SCIE', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23917, 6, '2002', 'Intro Hist of Science II', 'SCIE', 'MW',
        TIME(STR_TO_DATE('1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23918, 6, 'W', TIME(STR_TO_DATE('1535-1625<br />1535-1625', '%k%i')),
        TIME(STR_TO_DATE('1535', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23919, 6, 'F', TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23917, 23918);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23917, 23919);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22572, 6, '3100', 'Experiential Learning MedSci', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22573, 6, '3333', 'Sci Ed:Intro to Principle/Prac', 'SCIE', 'M',
        TIME(STR_TO_DATE('1735-1925<br />1835-1925', '%k%i')), TIME(STR_TO_DATE('1835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22574, 6, 'W', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22573, 22574);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22575, 6, '4005', 'Major Capstone Course in Meds', 'SCIE', 'TR',
        TIME(STR_TO_DATE('1505-1625', '%k%i')), TIME(STR_TO_DATE('1505', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22576, 6, '4101', 'Directed Project MedSci I', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22577, 6, '4102', 'Directed Project MedSci II', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22578, 6, '4445', 'Scie. Ldrshp & Comm Portfolio', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22579, 6, '4702', 'Science Innovation II', 'SCIE', 'R',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22580, 6, '4850', 'Geographic Info Scie Res Proj', 'SCIE', 'F',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22581, 6, '4902', 'MDSC Honours Res & Thesis II', 'SCIE', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

#########################################################
###################### Social Work ######################
#########################################################
INSERT INTO department VALUES ('SLWK','Social Work');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23823, 6, '2113', 'Development of Canadian Social', 'SLWK', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23824, 6, '2113', 'Development of Canadian Social', 'SLWK', 'W',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24154, 6, '2335', 'Beginning Social Work Practice', 'SLWK', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24155, 6, '2335', 'Beginning Social Work Practice', 'SLWK', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24428, 6, '2550', 'Indigenizing and Decolonizing', 'SLWK', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24429, 6, '2550', 'Indigenizing and Decolonizing', 'SLWK', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23829, 6, '3033', 'Thrticl Persp & Prac in SLWK 2', 'SLWK', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23830, 6, '3033', 'Thrticl Persp & Prac in SLWK 2', 'SLWK', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24156, 6, '3087', 'Social Work Research', 'SLWK', 'W',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24157, 6, '3087', 'Social Work Research', 'SLWK', 'T',
        TIME(STR_TO_DATE('1735-2025<br />1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22587, 6, '3110', 'Africentric Perspectives/Socia', 'SLWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24423, 6, '3135', 'SLWK and Mental Health', 'SLWK', 'T',
        TIME(STR_TO_DATE('1305-1555', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22589, 6, '3220', 'Cross Cult Iss/Soc Wrk Practic', 'SLWK', 'R',
        TIME(STR_TO_DATE('1235-1525', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22590, 6, '3220', 'Cross Cult Iss/Soc Wrk Practic', 'SLWK', 'M',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22592, 6, '3300', 'Independent Study', 'SLWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24218, 6, '4009', 'Advanced Social Work Practice', 'SLWK', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24219, 6, '4009', 'Advanced Social Work Practice', 'SLWK', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24158, 6, '4035', 'Field Practicum & Seminar', 'SLWK', 'R',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 4.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24159, 6, '4035', 'Field Practicum & Seminar', 'SLWK', 'R',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 4.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24160, 6, '4035', 'Field Practicum & Seminar', 'SLWK', 'R',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 4.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23978, 6, '5002', 'Cnd Social Welfare and Policy', 'SLWK', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23920, 6, '5004', 'Field Work Class', 'SLWK', 'T',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23526, 6, '5830', 'Independent Study', 'SLWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23527, 6, '5830', 'Independent Study', 'SLWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23528, 6, '5831', 'Independent Study II', 'SLWK', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24136, 6, '6003', 'Queering Social Work', 'SLWK', 'W',
        TIME(STR_TO_DATE('1335-1625', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22594, 6, '6363', 'Post-Modern & Narrative SLWK', 'SLWK', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23995, 6, '6415', 'SLWK Field Work', 'SLWK', 'T',
        TIME(STR_TO_DATE('1335-1525', '%k%i')), TIME(STR_TO_DATE('1335', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23997, 6, '6415', 'SLWK Field Work', 'SLWK', 'T',
        TIME(STR_TO_DATE('1735-1925', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23532, 6, '6540', 'Mental Health and Addiction', 'SLWK', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

##########################################################################
###################### Sociol & Social Anthropology ######################
##########################################################################
INSERT INTO department VALUES ('SOSA','Sociol & Social Anthropology');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (31480, 4, '5003', 'Contemp Perspect Ethnography', 'SOSA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14363, 5, '2007', 'Thinking Sociologically', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14362, 5, '2012', 'Thinking Through Anthropology', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12893, 5, '2181', 'Explain. Crime & Crim. Behav.', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12894, 5, '2191', 'Gender Across Cultures', 'SOSA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12895, 5, '2270', 'Introduction to Popular Cultur', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12898, 5, '3143', 'Hlth, Illness & World', 'SOSA', 'M',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12899, 5, '3145', 'Gender & Health', 'SOSA', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12900, 5, '3148', 'Drugs, Health & Society', 'SOSA', 'M',
        TIME(STR_TO_DATE('0935-1225', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12902, 5, '3206', 'Ethnicity Nation & Race', 'SOSA', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12903, 5, '3228', 'Belief Systm:Symbol,Myth&Magic', 'SOSA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12904, 5, '3250', 'Science and Technology Studies', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14480, 5, '3260', 'Deviance & Society: Mkng Norms', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12906, 5, '3285', 'Sociology of Law', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12907, 5, '3400', 'History  Anthro Theory', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12908, 5, '3401', 'History of Socio. Thought', 'SOSA', 'W',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12909, 5, '3402', 'Figuring Out Society', 'SOSA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14154, 5, '4000X', 'Honours Seminar -  Soc.Anth.', 'SOSA', 'F',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12910, 5, '4001', 'Quant Anal/Social Science I.', 'SOSA', 'W',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22598, 6, '1002', 'People&Culture: Intro to Anth', 'SOSA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22599, 6, '1003', 'Introduction to Sociology', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1535-1655', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22600, 6, '2005', 'Intro to African Can. Studies', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24063, 6, '2008', 'Doing Sociology', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24062, 6, '2013', 'Anthropology in Practice', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24446, 6, '2042', 'Explaining Social Inequality', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24067, 6, '2045', 'Indian Society', 'SOSA', 'M',
        TIME(STR_TO_DATE('1735-2025<br />1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23983, 6, '2052', 'Contemp Iss in Indig Studies', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22601, 6, '2192', 'Gender, Sexuality and Society', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22602, 6, '2402', 'Food and Culture', 'SOSA', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22603, 6, '2503', 'Health and Society', 'SOSA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22605, 6, '3009', 'Public Opinion & Social Trends', 'SOSA', 'T',
        TIME(STR_TO_DATE('1735-2025', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22607, 6, '3016', 'Colonialism and the Body', 'SOSA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23984, 6, '3052', 'Indigenous Soc Hlth & Env Iss.', 'SOSA', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22608, 6, '3060', 'Social Change & Development', 'SOSA', 'M',
        TIME(STR_TO_DATE('1135-1425', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22610, 6, '3260', 'Deviance & Society: Mkng Norms', 'SOSA', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22611, 6, '3281', 'Youth Crime', 'SOSA', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22612, 6, '3285', 'Sociology of Law', 'SOSA', 'WF',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22614, 6, '3403', 'Qualitative & Field Methods', 'SOSA', 'WF',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

###########################################################################
###################### Spanish & Latin American Stud ######################
###########################################################################
INSERT INTO department VALUES ('SPAN','Spanish & Latin American Stud');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12916, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12917, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12918, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12919, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12921, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12924, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12926, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14308, 5, '1021', 'Beginning Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12927, 5, '1022', 'Beginning Spanish II', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12928, 5, '1022', 'Beginning Spanish II', 'SPAN', 'MW',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12929, 5, '1035', 'Accelerated Beginning Spanish', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12930, 5, '2021', 'Intermediate Spanish I', 'SPAN', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12931, 5, '2021', 'Intermediate Spanish I', 'SPAN', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12934, 5, '2090', 'Intr to Hispanic Literary Stud', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12935, 5, '2130', 'Lat Am Dictators:Fact/Fiction?', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12937, 5, '3005', 'Espanol Practico-Nivel avanzad', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12938, 5, '3020', 'Translation', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12939, 5, '3035', 'Advanced Spanish I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (12940, 5, '3408', 'The Cuban Development Model', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14386, 5, '4981', 'Honours Reading Class I', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22622, 6, '1015', 'Spanish on the Go', 'SPAN', 'MW',
        TIME(STR_TO_DATE('1735-1855', '%k%i')), TIME(STR_TO_DATE('1735', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22623, 6, '1021', 'Beginning Spanish I', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22624, 6, '1021', 'Beginning Spanish I', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22625, 6, '1021', 'Beginning Spanish I', 'SPAN', 'MW',
        TIME(STR_TO_DATE('1605-1725', '%k%i')), TIME(STR_TO_DATE('1605', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22626, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22627, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22628, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22629, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22630, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22631, 6, '1022', 'Beginning Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22632, 6, '1022', 'Beginning Spanish II', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22633, 6, '1022', 'Beginning Spanish II', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22634, 6, '1022', 'Beginning Spanish II', 'SPAN', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24216, 6, '1022', 'Beginning Spanish II', 'SPAN', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22635, 6, '2005', 'Espanol Practico - Nivel Inter', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22637, 6, '2021', 'Intermediate Spanish I', 'SPAN', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22639, 6, '2022', 'Intermediate Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24025, 6, '2022', 'Intermediate Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22640, 6, '2100', 'Evolving Spain', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22642, 6, '3036', 'Advanced Spanish II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22643, 6, '3190', 'Conversation & Expression', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22644, 6, '3510', 'Contemp.Spanish American Lit.', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24086, 6, '4982', 'Honours Reading Class II', 'SPAN', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 1.5);

########################################################
###################### Statistics ######################
########################################################
INSERT INTO department VALUES ('STAT','Statistics');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13866, 5, '9520', 'Comprehensive Examinations', 'STAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22683, 6, '2060', 'Intro Probability & Stats', 'STAT', 'TRF',
        TIME(STR_TO_DATE('1635-1725', '%k%i')), TIME(STR_TO_DATE('1635', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22684, 6, 'T', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22685, 6, 'R', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22686, 6, 'T', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22687, 6, 'R', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22688, 6, 'T', TIME(STR_TO_DATE('1135-1325', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22683, 22684);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22683, 22685);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22683, 22686);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22683, 22687);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22683, 22688);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22690, 6, '2080', 'Stat Meth/Data Analysis/Infere', 'STAT', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22691, 6, '2080', 'Stat Meth/Data Analysis/Infere', 'STAT', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22692, 6, 'M', TIME(STR_TO_DATE('1735-1825', '%k%i')),
        TIME(STR_TO_DATE('1735', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22690, 22692);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22691, 22692);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22693, 6, '2300', 'Intro Math Modelling', 'STAT', 'MWF',
        TIME(STR_TO_DATE('0835-0925', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22694, 6, 'M', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22695, 6, 'M', TIME(STR_TO_DATE('1235-1325', '%k%i')),
        TIME(STR_TO_DATE('1235', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22693, 22694);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22693, 22695);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24026, 6, '2450', 'Intro Data Mining with R', 'STAT', 'M',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22697, 6, '3460', 'Intermediate Statistic. Theory', 'STAT', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22698, 6, '3703', 'Actuarial Models I', 'STAT', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22699, 6, '3720', 'Life Contingencies I', 'STAT', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22700, 6, '4390', 'Time Series Analysis I', 'STAT', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22702, 6, '4950', 'Honour Research Project', 'STAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23546, 6, '5067', 'Advanced Statistical Theory II', 'STAT', 'MWF',
        TIME(STR_TO_DATE('1135-1225', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23547, 6, '5390', 'Time Series Analysis I', 'STAT', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23856, 6, '7320', 'Statistics Seminar', 'STAT', 'R',
        TIME(STR_TO_DATE('1535-1625', '%k%i')), TIME(STR_TO_DATE('1535', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23551, 6, '9520', 'Comprehensive Examinations', 'STAT', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 0);

############################################################
###################### Sustainability ######################
############################################################
INSERT INTO department VALUES ('SUST','Sustainability');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22706, 6, '1001', 'A Sustainable Future', 'SUST', 'MW',
        TIME(STR_TO_DATE('1435-1555<br />1905-2055', '%k%i')), TIME(STR_TO_DATE('1905', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22707, 6, 'W', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22708, 6, 'M', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22709, 6, 'R', TIME(STR_TO_DATE('1135-1255', '%k%i')),
        TIME(STR_TO_DATE('1135', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22710, 6, 'T', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22711, 6, 'T', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22712, 6, 'T', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22713, 6, 'R', TIME(STR_TO_DATE('1435-1555', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22714, 6, 'R', TIME(STR_TO_DATE('1005-1125', '%k%i')),
        TIME(STR_TO_DATE('1005', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22715, 6, 'R', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22716, 6, 'M', TIME(STR_TO_DATE('1605-1725', '%k%i')),
        TIME(STR_TO_DATE('1605', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22707);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22708);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22709);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22710);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22711);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22712);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22713);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22714);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22715);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22706, 22716);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22718, 6, '2001', 'Global Environ. Governance', 'SUST', 'TR',
        TIME(STR_TO_DATE('1605-1725<br />1905-2055', '%k%i')), TIME(STR_TO_DATE('1905', '%k%i')), 6);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22719, 6, 'T', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22720, 6, 'W', TIME(STR_TO_DATE('1435-1625', '%k%i')),
        TIME(STR_TO_DATE('1435', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22721, 6, 'M', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        
INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (22722, 6, 'W', TIME(STR_TO_DATE('0935-1125', '%k%i')),
        TIME(STR_TO_DATE('0935', '%k%i')), 1);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22718, 22719);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22718, 22720);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22718, 22721);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 22718, 22722);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22723, 6, '3002', 'ESS Engagement Project', 'SUST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24363, 6, '3039', 'Indigenous Persp on Env Mgmt', 'SUST', 'W',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24041, 6, '3101', 'Food & Sustainability', 'SUST', 'TR',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22724, 6, '3102', 'Coastal Change & Adaptation', 'SUST', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22725, 6, '3103', 'Effective Argument in Sust.', 'SUST', 'R',
        TIME(STR_TO_DATE('1905-2055<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22726, 6, '3106', 'The Canadian North', 'SUST', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22727, 6, '3502', 'The Campus as a Living Lab', 'SUST', 'MW',
        TIME(STR_TO_DATE('1135-1255', '%k%i')), TIME(STR_TO_DATE('1135', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22728, 6, '3702', 'Sustainable Industries', 'SUST', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23857, 6, '4002', 'ESS Capstone.', 'SUST', 'MWF',
        TIME(STR_TO_DATE('1235-1425', '%k%i')), TIME(STR_TO_DATE('1235', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22730, 6, '4800', 'ESS Independent Study', 'SUST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22731, 6, '4801', 'ESS Independent Study', 'SUST', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23858, 6, '4902', 'Honours Thesis Part 2', 'SUST', 'M',
        TIME(STR_TO_DATE('0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 3);

#####################################################
###################### Theatre ######################
#####################################################
INSERT INTO department VALUES ('THEA','Theatre');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13035, 5, '4101', 'Short Apprenticeship', 'THEA', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22732, 6, '1052', 'Thea Organize&Stagecraft 2', 'THEA', 'WF',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23859, 6, '1452', 'Intro to Costume Studies b', 'THEA', 'TR',
        TIME(STR_TO_DATE('1005-1255', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23861, 6, '1802', 'Intro Acting & Performance b', 'THEA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22733, 6, '2012', 'Early Modern Theatre', 'THEA', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23862, 6, '2062', 'Technical Theatre 1b', 'THEA', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23863, 6, 'T', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23862, 23863);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23864, 6, '2072', 'Performance Technology 1b', 'THEA', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23865, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23864, 23865);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24420, 6, '2216', 'Shakespeare at the Globe', 'THEA', 'MW',
        TIME(STR_TO_DATE('1005-1125', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23866, 6, '2408', 'Aesthetics Contemp Dress b', 'THEA', 'TR',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22738, 6, '2451', 'Costume in Performance 1', 'THEA', 'F',
        TIME(STR_TO_DATE('1005-1255', '%k%i')), TIME(STR_TO_DATE('1005', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22739, 6, '2710', 'Stage Design 1', 'THEA', 'T',
        TIME(STR_TO_DATE('1435-1725', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23867, 6, '2802', 'Acting 2b', 'THEA', 'MW',
        TIME(STR_TO_DATE('1435-1625', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23868, 6, 'MW', TIME(STR_TO_DATE('1635-1725', '%k%i')),
        TIME(STR_TO_DATE('1635', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23867, 23868);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23869, 6, '2812', 'Voice & Speech 2b', 'THEA', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23870, 6, 'F', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23869, 23870);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23871, 6, '2822', 'Dance & Movement 2b', 'THEA', 'TR',
        TIME(STR_TO_DATE('0835-0955', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22740, 6, '2902', 'Play Analysis for Directing', 'THEA', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (22741, 6, '3015', 'Renaissance Drama', 'THEA', 'M',
        TIME(STR_TO_DATE('1435-1525<br />1435-1525', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23872, 6, '3062', 'Technical Theatre 2b', 'THEA', 'T',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23873, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23872, 23873);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23874, 6, '3072', 'Performance Technology 2b', 'THEA', 'R',
        TIME(STR_TO_DATE('0835-1125', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

INSERT INTO labInfo (L_CRN, T_CODE, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL)
        VALUES (23875, 6, 'R', TIME(STR_TO_DATE('1305-1425', '%k%i')),
        TIME(STR_TO_DATE('1305', '%k%i')), 0);

        INSERT INTO classLabs (T_CODE, C_CRN, L_CRN) VALUES
        (6, 23874, 23875);

        
INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (24028, 6, '3201', 'Directing for the Stage', 'THEA', 'MW',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23876, 6, '3453', 'Costume in Performance 2b', 'THEA', 'M',
        TIME(STR_TO_DATE('0835-1425', '%k%i')), TIME(STR_TO_DATE('0835', '%k%i')), 3);

#####################################################################
###################### Transition Year Program ######################
#####################################################################
INSERT INTO department VALUES ('TYPR','Transition Year Program');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14189, 5, '0002X', 'English Language Skills', 'TYPR', 'MF',
        TIME(STR_TO_DATE('1235-1325<br />1435-1525<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14190, 5, '0005X', 'Strategies-Univ Learning', 'TYPR', 'M',
        TIME(STR_TO_DATE('1135-1225<br />1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14191, 5, '0008X', 'Indigenous Studies', 'TYPR', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (14192, 5, '0009X', 'TYP Black Studies', 'TYPR', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23887, 6, '0002Y', 'English Language Skills', 'TYPR', 'MF',
        TIME(STR_TO_DATE('1235-1325<br />1435-1525<br />0935-1125', '%k%i')), TIME(STR_TO_DATE('0935', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23888, 6, '0005Y', 'Strategies-Univ Learning', 'TYPR', 'M',
        TIME(STR_TO_DATE('1135-1225<br />1035-1155', '%k%i')), TIME(STR_TO_DATE('1035', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23889, 6, '0008Y', 'Indigenous Studies', 'TYPR', 'TR',
        TIME(STR_TO_DATE('1305-1425', '%k%i')), TIME(STR_TO_DATE('1305', '%k%i')), 0);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23890, 6, '0009Y', 'TYP Black Studies', 'TYPR', 'TR',
        TIME(STR_TO_DATE('1435-1555', '%k%i')), TIME(STR_TO_DATE('1435', '%k%i')), 0);

############################################################
###################### Vision Science ######################
############################################################
INSERT INTO department VALUES ('VISC','Vision Science');

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13868, 5, '5010', 'VISC: Afferent System', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13870, 5, '5020', 'VISC: Optics', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13872, 5, '5040', 'VISC: Neuropharmacology', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13874, 5, '5210', 'VISC: Foundations OMT', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13876, 5, '5230', 'VISC: Motility Disorders', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13878, 5, '5310', 'VISC: Systemic Disease', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13880, 5, '5340', 'VISC: Visual Disorders', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (13882, 5, '5350', 'VISC: Vision Care', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23555, 6, '5011', 'VISC: Efferent System', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23557, 6, '5211', 'VISC: Orthoptics', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23559, 6, '5222', 'Adv Oph Tec for Clinic Vis Sci', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 6);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23561, 6, '5240', 'VISC: Low Vision', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);

INSERT INTO classInfo (C_CRN, T_CODE, C_CODE, C_NAME, D_CODE, C_DAYS, C_TIMESTART,
        C_TIMEEND, C_CREDIT_HRS) VALUES (23564, 6, '5330', 'VISC: Treatment of O.M.D.', 'VISC', '',
        TIME(STR_TO_DATE('0001', '%k%i')), TIME(STR_TO_DATE('2359', '%k%i')), 3);
