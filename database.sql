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
    D_CODE VARCHAR(4) NOT NULL,
    C_DAYS VARCHAR(5) NOT NULL,
    C_TIMESTART TIME NOT NULL,
    C_TIMEEND TIME NOT NULL,
    C_CREDIT_HRS SMALLINT(2),
    C_SIZE SMALLINT(3),
    C_NUM_REGISTERED SMALLINT(3),
    PRIMARY KEY (C_CRN),
    FOREIGN KEY (D_CODE) REFERENCES department (D_CODE)
);

CREATE TABLE classes (
    C_CRN SMALLINT(5),
    C_NAME VARCHAR(64),
    PRIMARY KEY (C_CRN),
    FOREIGN KEY (C_CRN) REFERENCES classInfo (C_CRN)
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
###############################################################
###################### Actuarial Science ######################
###############################################################
INSERT INTO department VALUES ('ACSC','Actuarial Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20031, 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20031, '3703 Actuarial Models I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20032, 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20032, '3720 Life Contingencies I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24252, 'ACSC', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24252, '4703 Actuarial Models II');

#####################################################
###################### Anatomy ######################
#####################################################
INSERT INTO department VALUES ('ANAT','Anatomy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20046, 'ANAT', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20046, '3010 Introductory Human Anatomy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20047, 'ANAT', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20047, '3421 Comparative Vert. Histology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20048, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20047);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20049, 'ANAT', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20049, '4010 Advanced Human Anatomy');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20050, 'TR', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20049);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23432, 'ANAT', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23432, '5100Y Human Neuroanatomy');

####################################################
###################### Arabic ######################
####################################################
INSERT INTO department VALUES ('ARBC','Arabic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20115, 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20115, '1022 Introduction to Arabic II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20116, 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20116, '2022 Intermediate Arabic II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20117, 'ARBC', 'MW', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20117, '2100 A Cultural Intro to Arab World');

##########################################################
###################### Architecture ######################
##########################################################
INSERT INTO department VALUES ('ARCH','Architecture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23434, 'ARCH', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23434, '1002 Intro to Architecture 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23986, 'ARCH', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23986, '1202 Sci of the Built Environment 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20119, 'ARCH', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20119, '2502 Design Communication 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20120, 'ARCH', 'MR', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20120, '3002 Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20121, 'ARCH', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20121, '3107 Mod. Settlmnt, Bldg, &  Lndscp');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20122, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20123, 'F', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20121);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20124, 'ARCH', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20124, '3208 Building Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24051, 'ARCH', 'MTWRF', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 1);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24051, '3302 Professional Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20125, 'ARCH', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20125, '3502 Representation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20126, 'ARCH', 'T', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20126, '4005 Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20127, 'ARCH', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20127, '4113 Architect Theory & Interpretat');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20128, 'ARCH', 'M', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20128, '4212 Building Systems Integration');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24053, 'ARCH', 'MTWRF', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 1);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24053, '4304 Professional Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20129, 'ARCH', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20129, '4502 Representation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22659, 'ARCH', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22659, '5210 Life Cycle Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24054, 'ARCH', 'MTWRF', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24054, '5311 Professional Practice.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22663, 'ARCH', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22663, '6504 Montage in Architecture');

####################################################################
###################### Arts & Social Sciences ######################
####################################################################
INSERT INTO department VALUES ('ASSC','Arts & Social Sciences');

#########################################################################
###################### Biochem & Molecular Biology ######################
#########################################################################
INSERT INTO department VALUES ('BIOC','Biochem & Molecular Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20156, 'BIOC', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20156, '1420 Introductory Biochemistry');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20157, 'BIOC', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20157, '2300 Introduction to Biochemistry');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20158, 'BIOC', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20158, '2610 Intro Biochemistry Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20159, 'BIOC', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20159, '2610 Intro Biochemistry Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20160, 'BIOC', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20160, '2610 Intro Biochemistry Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20161, 'BIOC', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20161, '3300 Intermediary Metabolism');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20162, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20161);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20166, 'BIOC', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20166, '4027 Molecular Mechanisms of Cancer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20167, 'BIOC', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20167, '4305 Mechansms of Sig. Transduction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20168, 'BIOC', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20168, '4403 Genes and Genomes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20171, 'BIOC', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20171, '4701 Enzymes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20172, 'BIOC', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20172, '4835 Human Genetics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20173, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20172);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24298, 'BIOC', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24298, '5305 Mechanisms of Signal Transduct');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22667, 'BIOC', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22667, '5403 Genes and Genomes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22668, 'BIOC', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22668, '5701 Enzymes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22669, 'BIOC', 'W', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22669, '5915 Sci Com  Bioc & Molec Biol II');

####################################################################
###################### Biological Engineering ######################
####################################################################
INSERT INTO department VALUES ('BIOE','Biological Engineering');

#####################################################
###################### Biology ######################
#####################################################
INSERT INTO department VALUES ('BIOL','Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20177, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20177, '1011 Principles of Biology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20179, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20180, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20181, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20182, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20183, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20184, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20185, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20186, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20187, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20188, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20189, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20190, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20191, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20192, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20193, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20194, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20195, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20196, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20197, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20198, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20199, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20200, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20201, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20202, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20203, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20204, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20205, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20206, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20207, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20208, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20177);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20178, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20178, '1011 Principles of Biology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20179, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20180, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20181, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20182, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20183, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20184, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20185, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20186, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20187, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20188, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20189, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20190, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20191, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20192, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20193, 'T', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20194, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20195, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20196, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20197, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20198, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20199, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20200, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20201, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20202, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20203, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20204, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20205, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20206, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20207, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20208, 'R', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20178);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20212, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20212, '2004 Diversity of Plants & Microorg');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20213, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20214, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20215, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23906, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20216, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20218, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20217, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20219, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20220, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20212);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20221, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20221, '2020 Cell Biology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20222, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20223, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20225, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20227, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20226, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24093, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20228, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20229, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20230, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20231, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20221);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24061, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 0, 20221);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20233, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20233, '2030 Genetics and Molecular Biology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20234, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20237, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20235, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20236, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20238, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20239, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20240, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20241, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20242, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20243, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20244, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20247, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20248, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20249, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20250, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20251, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20252, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20253, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20254, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20255, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20256, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20257, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20233);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20258, 'R', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20233);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20261, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20261, '2040 Evolution.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20262, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20263, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20264, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20265, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20266, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20261);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20268, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20268, '2060 Introductory Ecology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20269, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20268);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20270, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20268);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20271, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20268);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20272, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20268);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20273, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20268);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23900, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20268);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23929, 'BIOL', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23929, '3037 Life Rewritten: Gene Editing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20275, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20275, '3044 Ecological Genetics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20276, 'BIOL', 'TRF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20276, '3062 Behavioural Ecology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20277, 'TR', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20276);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20278, 'TR', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20276);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20279, 'MW', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20276);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20280, 'MW', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20276);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20281, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20281, '3065 Conservation Biology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20282, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20281);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20283, 'BIOL', 'MTR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20283, '3079 Animal Physiology Part II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20284, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20283);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20285, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20283);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20286, 'BIOL', 'MTR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20286, '3080 Ecology & Evolution Fishes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23954, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23954, '3101 Microbial Ecology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20287, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20287, '3225 Plants in the Human Landscape.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20288, 'F', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20287);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20289, 'BIOL', 'TRF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20289, '3301 Invertebrate Biology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20290, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20289);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20291, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20289);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20295, 'BIOL', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20295, '3421 Comp Vertebrate Histology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20296, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20295);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20297, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20297, '3580 Philosophy of Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20298, 'BIOL', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20298, '3601 Nature Conservation');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20299, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20298);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20300, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20298);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20301, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20298);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20302, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20298);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20303, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20298);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24404, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24404, '4039 Special Topics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20307, 'BIOL', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20307, '4080 Laboratory Studies of Fishes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23914, 'BIOL', 'MTR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23914, '4500 The Evolution of Life Historie');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20309, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20309, '4661 Biological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20310, 'BIOL', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20310, '4662 Biology of Phytoplankton');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20313, 'BIOL', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20313, '4850 Geographic Info Scie Res Proj');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22674, 'BIOL', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22674, '5035 Human Genetics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22675, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22674);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22676, 'BIOL', 'MTR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22676, '5067 Ecology & Evolution of Fishes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22677, 'BIOL', 'MTR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22677, '5501 Evolution of Life Histories');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22679, 'BIOL', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22679, '5660 Aquaculture Modelling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22680, 'BIOL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22680, '5661 Biological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23436, 'BIOL', 'F', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23436, '5700Y Communication Skills-Scientist');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23437, 'BIOL', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23437, '5701Y Communication Assignment');

####################################################################
###################### Biomedical Engineering ######################
####################################################################
INSERT INTO department VALUES ('BMNG','Biomedical Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20320, 'BMNG', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20320, '3000 Technology in Medicine');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22724, 'BMNG', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22724, '5500 BME MSC Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22726, 'BMNG', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22726, '6500 BME PhD Seminar');

######################################################
###################### Business ######################
######################################################
INSERT INTO department VALUES ('BUSS','Business');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24455, 'BUSS', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24455, '6102 Behavioral Statistics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24456, 'BUSS', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24456, '6103 Research Reading & Conference');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24457, 'BUSS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24457, '6292 Financial Econometrics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24458, 'BUSS', 'W', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24458, '6293 Seminar in Investment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24459, 'BUSS', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24459, '6502 Seminar in MIS Research');

############################################################
###################### Business Admin ######################
############################################################
INSERT INTO department VALUES ('BUSI','Business Admin');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23440, 'BUSI', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23440, '5004Y Pers. & Prof. Effectiveness II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22732, 'BUSI', 'MW', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22732, '5902 Starting Lean');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22733, 'BUSI', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22733, '6005 Strategy Implementation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22734, 'BUSI', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22734, '6006 Managing the Family Entrprs');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22735, 'BUSI', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22735, '6007 Innovation Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22736, 'BUSI', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22736, '6009 Business & Government');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22737, 'BUSI', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22737, '6050 Corporate Governance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22738, 'BUSI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22738, '6106 Cost Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22739, 'BUSI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22739, '6109 Adv. Financial Accounting II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22740, 'BUSI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22740, '6110 Adv. Financial Accounting III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22741, 'BUSI', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22741, '6207 Advanced Corp Finance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22742, 'BUSI', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22742, '6255 Global Markets & Institutions');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22743, 'BUSI', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22743, '6313 Organizational Change');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22744, 'BUSI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22744, '6408 Transport Modes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22746, 'BUSI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22746, '6450 Marketing Strategy Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22749, 'BUSI', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22749, '6942 Applied Topics in Business II');

##############################################################
###################### Canadian Studies ######################
##############################################################
INSERT INTO department VALUES ('CANA','Canadian Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20325, 'CANA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20325, '1103 Halifax and the World Part II.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20335, 'CANA', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20335, '2002 Idea of Canada: Cultural & Lit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20337, 'CANA', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20337, '2005 Intro to African Can. Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20338, 'CANA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20338, '2052 Contemp Iss in Indig Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20339, 'CANA', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20339, '2235 History of Canadian Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20340, 'CANA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20340, '2272 Atlntc Can since Confederation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20341, 'CANA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20341, '3050 Indigenous Practices');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24264, 'CANA', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24264, '3052 Indigenous Soc Hlth & Env Iss.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20342, 'CANA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20342, '3270 Contemporary Canadian Lit.');

############################################################################
###################### Centre for Learning & Teaching ######################
############################################################################
INSERT INTO department VALUES ('CNLT','Centre for Learning & Teaching');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22816, 'CNLT', 'R', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22816, '5000 Teach. & Learn. in Higher Ed.');

##################################################################
###################### Chemical Engineering ######################
##################################################################
INSERT INTO department VALUES ('CHEE','Chemical Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23980, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23980, '2201 Fund. of Chemical Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24002, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 23980);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20346, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20346, '2203 Organic Chem for Chem Engineer');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20347, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20346);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20348, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20346);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20351, 'CHEE', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20351, '3501 Unit Operations Lab II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20352, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20351);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20353, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20351);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20354, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20354, '3522 Mechanical Unit Operation');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20355, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20354);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20356, 'CHEE', 'WF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20356, '3525 Separation Processes');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20357, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20356);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23979, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23979, '3530 Chem Engr Thermodynamics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23981, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23979);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20358, 'CHEE', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20358, '3540 Law & Ethics for Chem Eng.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20359, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20358);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20360, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20360, '3560 Green Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20361, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20360);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24326, 'CHEE', 'MT', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24326, '4123 Environmental Biotechnology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24327, 'R', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 24326);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20364, 'CHEE', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20364, '4842 Process & Product Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20365, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20364);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20366, 'CHEE', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20366, '4844 Process Simulation & Plnt Dsgn');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20367, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20366);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22765, 'CHEE', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22765, '6736 Comp Application Chem Engrng');

#######################################################
###################### Chemistry ######################
#######################################################
INSERT INTO department VALUES ('CHEM','Chemistry');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20377, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20377, '1012 Concepts in Chemistry II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20379, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20380, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20381, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20382, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20383, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20384, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20385, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20386, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20387, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20388, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20389, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20390, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20391, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20392, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20393, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20394, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20395, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20396, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20377);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20378, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20378, '1012 Concepts in Chemistry II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20379, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20380, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20381, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20382, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20383, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20384, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20385, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20386, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20387, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20388, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20389, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20390, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20391, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20392, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20393, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20394, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20395, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20396, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20378);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20399, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20399, '1022 Engineering Chemistry II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20401, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20402, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20403, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20404, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20405, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20406, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20407, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20399);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20408, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20399);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20400, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20400, '1022 Engineering Chemistry II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20401, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20402, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20403, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20404, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20405, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20406, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20407, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20400);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20408, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20400);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20411, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20411, '2101 Introductory Inorganic Chem');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20412, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20411);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20413, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20411);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20415, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20415, '2304 Intro. Physical Chem II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20417, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20415);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20418, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20415);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20420, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20420, '2402 Organic Chemistry II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20422, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20420);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20423, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20420);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20424, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20420);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20425, 'T', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 20420);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20426, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20420);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20428, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20428, '3203 Advanced Analytical lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20429, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20429, '3203 Advanced Analytical lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20430, 'CHEM', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20430, '3203 Advanced Analytical lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20431, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20431, '3401 Intermediate Organic Chem');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20433, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20432, 'R', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20431);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20435, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20435, '3601 Chemistry of Living Systems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20437, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20437, '4101 Adv. Main Group Chem.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20438, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20438, '4205 Chemometrics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20439, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20439, '4301 Theory of Chemical Bonding');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20440, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20440, '4402 Organ.Struct Determination');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24288, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24288, '4502 Polymer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22770, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22770, '5101 Topics-Adv Main Group Chem');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22771, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22771, '5205 Chemometrics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22773, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22773, '5312 Adv in Batt, FC & SC Mat');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22774, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22774, '5402 Organ.Structure Determin.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24289, 'CHEM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24289, '5502 Polymer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22775, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22775, '5509 Grad Student Seminar I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24283, 'CHEM', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24283, '6154 Organometallic Catalysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22777, 'CHEM', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22777, '6509 Grad Student Seminar II');

#####################################################
###################### Chinese ######################
#####################################################
INSERT INTO department VALUES ('CHIN','Chinese');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20449, 'CHIN', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20449, '1032 Intro to Chin (Mandarin) Pt 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20450, 'CHIN', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20450, '1032 Intro to Chin (Mandarin) Pt 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20452, 'CHIN', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20452, '2032 Intermed Chin (Mandarin) Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20454, 'CHIN', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20454, '3032 Adv Chinese (Mandarin), Pt 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20456, 'CHIN', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20456, '3062 Modern Chinese Literature');

###############################################################
###################### Civil Engineering ######################
###############################################################
INSERT INTO department VALUES ('CIVL','Civil Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20474, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20474, '3200 Transportation Engineerng');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20475, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20474);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20476, 'CIVL', 'TWR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20476, '3310 Engineering Hydrology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20477, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20476);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20478, 'CIVL', 'TF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20478, '3515 Struct. Sys. II: Loads & Behav');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20479, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20478);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20480, 'CIVL', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20480, '3725 Const. Materials & Methods');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23995, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20481, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20480);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20483, 'CIVL', 'R', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20483, '3840 Professional Pract Civil Eng');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20484, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20484, '4250 Highway Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20485, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 20484);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20486, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20486, '4350 Hydraulic Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20487, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20486);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20488, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20488, '4359 Form & Process in Alluvial Chn');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20489, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20488);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20490, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20490, '4410 Engineering Hydrogeology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20491, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20490);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20492, 'CIVL', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20492, '4460 Solid Waste Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20493, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20492);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20494, 'CIVL', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20494, '4560 Spec. Topics in Struct. Syst.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20495, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20494);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20496, 'CIVL', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20496, '4703 Senior Project II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20497, 'CIVL', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20497, '4711 Construction Planning');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20498, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 20497);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22783, 'CIVL', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22783, '6126 Foundation Engineering I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22786, 'CIVL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22786, '6159 Form & Process in Alluvial Chn');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22787, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22786);
        
######################################################
###################### Classics ######################
######################################################
INSERT INTO department VALUES ('CLAS','Classics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20504, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20504, '1104 Gods, Heroes & Monsters II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20505, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20504);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23948, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23948, '2002 Medieval Natural Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20506, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20506, '2104 Gods, Heroes & Monsters II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20507, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20506);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20508, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20508, '2202 Westrn Medi: Birth of the Body');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20509, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20509, '2215 The Classical Greek World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20510, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20510, '2233 Roman Legions & The Barbarians');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20511, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20511, '2402 Introductory Latin Part II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20512, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20512, '2506 Introductory Ancient Greek II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20513, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20513, '2600 Introductory Sanskrit - II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20514, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20514, '2702 Intermediate Greek II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20515, 'CLAS', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20515, '2802 Intermediate Latin II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20516, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20516, '3320 Oracles, Omens & Astrology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23975, 'CLAS', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23975, '3382 Mdvl Phil Arabic-Aquinas');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20518, 'CLAS', 'TRF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20518, '3434 Political Thought: Homer-Arist');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20519, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20519, '3503 Aristotle');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20520, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20520, '3515 Greek Tragedy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20521, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20521, '3525 Ancient Greek Epic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20522, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20522, '3782 Greek Texts: History II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24405, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24405, '3901 Philosophy of Aristotle I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20524, 'CLAS', 'W', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20524, '4451 Medieval Interpreters Aristotl');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24332, 'CLAS', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24332, '4690 Reading & Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20525, 'CLAS', 'MF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20525, '4810 Special Topics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22792, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22792, '5038 Adv. Latin Sem: Myth & History');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23951, 'CLAS', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23951, '5559 Adv. Greek Sem.: History II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22795, 'CLAS', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22795, '5614 Aristotle');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22796, 'CLAS', 'W', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22796, '5701 Sem Medieval Interp Aristotle');

######################################################
###################### Commerce ######################
######################################################
INSERT INTO department VALUES ('COMM','Commerce');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20529, 'COMM', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20529, '1010 Business in a Global Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20530, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20530, '1101 Introductory Accounting I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20531, 'COMM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20531, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20531);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20531);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20532, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20532, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20532);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20532);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20533, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20533, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20533);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20533);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20534, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20534, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20534);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20534);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20535, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20535, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20535);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20535);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20536, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20536, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20537, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24057, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20536);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20538, 'COMM', 'F', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20538, '1502 Core Business Applications');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20539, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24284, 'F', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20538);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20540, 'COMM', 'M', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20540, '1700 Prep for Study/Work in Canada');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20541, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20540);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20542, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20540);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20543, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20543, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20544, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20544, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20545, 'COMM', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20545, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20546, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20546, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20547, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20547, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20548, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20548, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20549, 'COMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20549, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24333, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24333, '1710 Business Communication I.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20551, 'COMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20551, '2203 Finance II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20552, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20552, '2303 Intro to Organiz. Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24127, 'COMM', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24127, '2310 Business Ethics and CSR');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20553, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24127);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20554, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 24127);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20555, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 24127);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20557, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20557, '2401 Introduction to Marketing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23874, 'COMM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23874, '2502 Predictive Analytics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20559, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20559, '2603 Legal Aspects of Business');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20561, 'COMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20561, '3105 Intermed Financial Acctng I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20562, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20562, '3105 Intermed Financial Acctng I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20563, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20563, '3116 Cost Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20564, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20564, '3116 Cost Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20565, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20565, '3203 Financial Institutions');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20567, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 20565);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20566, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20566, '3203 Financial Institutions');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20567, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 20566);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20568, 'COMM', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20568, '3303 Intro Humn Res Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20569, 'COMM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20569, '3307 New Venture Creation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20570, 'COMM', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20570, '3308 Managing Family Enterprise');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20572, 'COMM', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20572, '3310 Reflections on Leadership');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20573, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20573, '3402 Marketing Communications');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20574, 'COMM', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20574, '3404 Marketing Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20575, 'COMM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20575, '3405 Global Marketing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20577, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20577, '3407 Logistics Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20578, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20578, '3408 Transport Modes & Policy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20579, 'COMM', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20579, '3410 Services Marketing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20580, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20580, '3501 Production/Operations Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20581, 'COMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20581, '3501 Production/Operations Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20582, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20582, '3501 Production/Operations Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20583, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20583, '3501 Production/Operations Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20584, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20584, '3501 Production/Operations Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20585, 'COMM', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20585, '3511 Management Information Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20589, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20590, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20591, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20592, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20593, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20594, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20595, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20585);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20596, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20585);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20586, 'COMM', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20586, '3511 Management Information Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20589, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20590, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20591, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20592, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20593, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20594, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20595, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20586);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20596, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20586);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20587, 'COMM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20587, '3511 Management Information Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20589, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20590, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20591, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20592, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20593, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20594, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20595, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20587);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20596, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20587);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20588, 'COMM', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20588, '3511 Management Information Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20589, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20590, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20591, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20592, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20593, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20594, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20595, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20588);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20596, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20588);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20597, 'COMM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20597, '3710 Business in Emerging Markets');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20600, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20600, '4101 Advanced Accounting I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20601, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20601, '4101 Advanced Accounting I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20602, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20602, '4102 Advanced Accounting II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20603, 'COMM', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20603, '4102 Advanced Accounting II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20604, 'COMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20604, '4126 Taxation II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20605, 'COMM', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20605, '4126 Taxation II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20606, 'COMM', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20606, '4201 International Financial Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20607, 'COMM', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20607, '4201 International Financial Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20608, 'COMM', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20608, '4202 Derivatives');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20609, 'W', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20608);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20610, 'COMM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20610, '4240 Advanced Corporate Finance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20611, 'COMM', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20611, '4240 Advanced Corporate Finance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20613, 'COMM', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20613, '4340 Corporate Governance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20621, 'COMM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20621, '4401 Marketing Strategy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20622, 'COMM', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20622, '4510 Corporate Communication');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20623, 'COMM', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20623, '4520 Supply Chain Plan & Execution');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20624, 'COMM', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20624, '4523 Project Management');

###########################################################################
###################### Communication Sci & Disorders ######################
###########################################################################
INSERT INTO department VALUES ('CMSD','Communication Sci & Disorders');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22799, 'CMSD', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22799, '5020 Phonetics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23443, 'CMSD', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23443, '5070Y Clinical Methods - SLP');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23444, 'CMSD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23444, '5071Y Clinical Methods-Audiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22800, 'CMSD', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22800, '5120 Hearing Measurement');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22801, 'CMSD', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22801, '5260 Hearing Disorders');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22802, 'CMSD', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22802, '5280 Audition II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22803, 'CMSD', 'R', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22803, '6070 Topics in Audiology Procedures');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22804, 'CMSD', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22804, '6320 Pediatric Audiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22805, 'CMSD', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22805, '6350 Assess. Lang. Disorders - Adlt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22808, 'CMSD', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22808, '6390 Voice/Resonance Disorders');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22809, 'CMSD', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22809, '6450 Speech Disorders-Adults');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22810, 'CMSD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22810, '6470 Lang Disorder Schl Age Child');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22811, 'CMSD', 'MR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22811, '6560 Amplification II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22812, 'CMSD', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22812, '6980 Research Design');

###################################################################
###################### Complementary Studies ######################
###################################################################
INSERT INTO department VALUES ('CPST','Complementary Studies');

##############################################################
###################### Computer Science ######################
##############################################################
INSERT INTO department VALUES ('CSCI','Computer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20639, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20639, '1105 Intro to Computer Programming');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20640, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20639);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20641, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20639);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20646, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20646, '1107 Social Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20647, 'TR', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20646);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20648, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20646);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20649, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20649, '1108 Experimental Robotics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20651, 'TR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20649);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20652, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 0, 20649);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20653, 'TR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20649);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20654, 'WR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20649);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20655, 'WR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20649);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20650, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20650, '1108 Experimental Robotics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20651, 'TR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20650);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20652, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 0, 20650);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20653, 'TR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20650);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20654, 'WR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20650);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20655, 'WR', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 20650);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24141, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24141, '1109 Practical Data Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24142, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 24141);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24143, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 24141);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20656, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20656, '1110 Intro to Computer Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20659, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20660, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20661, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20662, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20663, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20664, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20665, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20666, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20667, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20656);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20668, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20656);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20657, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20657, '1110 Intro to Computer Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20659, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20660, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20661, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20662, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20663, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20664, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20665, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20666, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20667, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20657);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20668, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20657);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20658, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20658, '1110 Intro to Computer Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20659, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20660, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20661, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20662, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20663, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20664, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20665, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20666, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20667, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20658);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20668, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20658);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20669, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20669, '1120 Intro to Computer Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20670, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0925', '%k%i')), 0, 20669);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20671, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20669);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20672, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20672, '1170 Intro to Web Design & Devel.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20674, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20672);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20675, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20672);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20673, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20673, '1170 Intro to Web Design & Devel.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20674, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20673);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20675, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20673);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20676, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20676, '1801 Case Studies in Comp & Society');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20678, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20679, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20680, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20681, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20682, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20683, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20684, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20686, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20688, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20689, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20690, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20691, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20692, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20693, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20694, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20695, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20696, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20676);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20697, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20676);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20677, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20677, '1801 Case Studies in Comp & Society');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20678, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20679, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20680, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20681, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20682, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20683, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20684, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20686, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20688, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20689, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20690, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20691, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20692, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20693, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20694, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20695, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20696, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20677);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20697, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20677);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20698, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20698, '2100 Comm Skills: Oral/Written');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20699, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20699, '2100 Comm Skills: Oral/Written');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20700, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20700, '2110 Data Structures & Algorithms');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20701, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20700);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20702, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20702, '2112 Discrete Structures I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20703, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20703, '2113 Discrete Structures II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20704, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20704, '2114 Mathematical App. in Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24106, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24106, '2122 Systems Programming');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24107, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 24106);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24108, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 24106);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24109, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 24106);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24110, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 24106);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24113, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24113, '2134 Software Development');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24114, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 24113);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24115, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 24113);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24116, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 24113);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24117, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 24113);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20716, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20716, '2141 Intro to Database Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20717, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20716);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20718, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 20716);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20719, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20716);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20720, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 20716);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20721, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20721, '2170 Intro to Server Side Scripting');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20722, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20721);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20723, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20723, '2201 Introduction to Info Security');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20724, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20723);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20725, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20723);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20726, 'CSCI', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20726, '2202 Comp. Modeling for Scientists');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20727, 'MW', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 20726);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20729, 'CSCI', 'TRF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20729, '2690 Intro to Software Projects');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20730, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20730, '2691 Introductory Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20731, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20731, '3101 Soc/Ethi/Prof Issues in Csci');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20732, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20732, '3130 Software Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20733, 'TR', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20732);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20734, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20734, '3136 Principles/Programming Languag');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20735, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20735, '3151 Foundations  of Machine Learn.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20736, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20735);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20737, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20737, '3160 Designing User Interfaces');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20738, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20738, '3162 Digital Media');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20739, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20739, '3171 Network Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20740, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20739);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20741, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20741, '3172 Web-Centric Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20742, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 20741);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20743, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 20741);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20744, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20744, '3691 Intermediate Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20745, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20745, '3901 Software Development Concepts');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20746, 'M', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20745);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24296, 'CSCI', 'MF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24296, '4115 Topics in Graph Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20748, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20748, '4116 Cryptography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20749, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20749, '4144 Data Mining/Warehousing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20750, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 20749);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20751, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20751, '4145 Cloud Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20752, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 20751);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20753, 'CSCI', 'TRF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20753, '4152 Natural Lang Processing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20754, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 20753);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20755, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20755, '4155 Machine Learning');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20756, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 20755);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23875, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23875, '4163 Human-Computer Interaction');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23876, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23875);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20760, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20760, '4174 Network Security');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20761, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20761, '4177 Advanced Web Services');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20762, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 20761);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20763, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20763, '4181 Bioinformatics Algorithms');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24244, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24244, '4193 Technology Innovation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24196, 'CSCI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24196, '4260 Persuasive Computing Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24198, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 24196);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20765, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20765, '4691 Advanced Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22818, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22818, '5100 Communication Skills');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24245, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24245, '5193 Technology Innovation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22819, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22819, '5306 Software Comprehension');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22821, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22821, '5308 Adv Topics in Software Develop');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24377, 'M', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22821);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22822, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22822, '5408 Data Mgmt, Warhsng Analytics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22823, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22822);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22824, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22822);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22825, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22825, '5409 Adv Topic in Cloud Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22826, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 22825);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24361, 'CSCI', 'R', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24361, '5601 Designing for UX');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24362, 'F', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 24361);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22827, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22827, '5708 Mobile Computing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22828, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 22827);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22829, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22829, '5709 Adv. Topics in Web Development');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22830, 'T', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 22829);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24366, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24366, '6055 Research Methods & Statistics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24367, 'F', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 24366);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22831, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22831, '6405 Data Mining & Data Warehousing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22832, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22831);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22833, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22833, '6406 Visualization');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24371, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24371, '6508 Neurocomputing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22836, 'CSCI', 'TRF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22836, '6509 Adv. Topics in NLP');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22837, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22836);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24276, 'CSCI', 'F', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24276, '6511 Autonomous Robotics.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24278, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 0, 24276);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23877, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23877, '6610 Human Computer Interaction');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23878, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23877);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24197, 'CSCI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24197, '6611 Persuasive Computing Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24199, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 24197);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22840, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22840, '6708 Adv Topics in Network Security');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22841, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22841, '6709 Software Defined Networking');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24446, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24446, '6710 Advanced Mobile Comm. Systems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22842, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22842, '6802 Bioinformatics Algorithms');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22845, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22845, '6999 Research Sem Computer Science');

##################################################################
###################### Contemporary Studies ######################
##################################################################
INSERT INTO department VALUES ('CTMP','Contemporary Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23448, 'CTMP', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23448, '2000Y Modern Social & Polit Thought');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24016, 'CTMP', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24016, '2100 Politics of Hope Romant-Anarch');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24176, 'CTMP', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24176, '2115 Idea of Race in Phil, Lit, Art');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20770, 'CTMP', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20770, '2150 Society, Politics & Literature');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20771, 'CTMP', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20771, '2203 Bio-Politics:Human Natu/CtmpTh');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20772, 'CTMP', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20772, '2301 Pain');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20773, 'CTMP', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20773, '2316 Pictorial Turn');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20774, 'CTMP', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20774, '2350 Feminisms: The First Three Wav');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23879, 'CTMP', 'M', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23879, '3000Y Science & Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24017, 'CTMP', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24017, '3105 The Nietzschean Legacy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20776, 'CTMP', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20776, '3201 Scie & Relig: Contemp Perspec');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24023, 'CTMP', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24023, '3204 Human Experiments');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20777, 'CTMP', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20777, '3220 The Aesthetics of Environments');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20778, 'CTMP', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20778, '3305 Modern Film & Theory of Gaze.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20780, 'CTMP', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20780, '3321 Holocaust: Bearing Witness');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23450, 'CTMP', 'T', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23450, '4000Y Deconstruction of Tradition');

##############################################################
###################### Creative Writing ######################
##############################################################
INSERT INTO department VALUES ('CRWR','Creative Writing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20628, 'CRWR', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20628, '2002 Intro to Creative Writing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20629, 'CRWR', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20629, '3011 Creative Writing: Poetry II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20630, 'CRWR', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20630, '3021 Creative Writing: Fiction II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20631, 'CRWR', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20631, '3021 Creative Writing: Fiction II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23445, 'CRWR', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23445, '4000Y Adv Creative Writing: Poetry');

############################################################
###################### Dental Hygiene ######################
############################################################
INSERT INTO department VALUES ('DEHY','Dental Hygiene');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24269, 'DEHY', 'W', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24269, '4002 Applied Oral Hlth Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23452, 'DEHY', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23452, '4009Y Teach Methodol & Practicum');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23453, 'DEHY', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23453, '4010Y Alternate Practice Setting');

#######################################################
###################### Dentistry ######################
#######################################################
INSERT INTO department VALUES ('DENT','Dentistry');

######################################################################
###################### Diag Med Ultrasound Tech ######################
######################################################################
INSERT INTO department VALUES ('DMUT','Diag Med Ultrasound Tech');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20790, 'DMUT', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20790, '1010 Prin & Inst Diag Med Ultrsnd I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20791, 'DMUT', 'TR', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20791, '1020 Fundamentals of Sonography II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20792, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1455', '%k%i')), 0, 20791);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20793, 'DMUT', 'MW', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20793, '2030 Sono of Abdomen&Sup Struct II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20794, 'F', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 20793);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20795, 'DMUT', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20795, '2040 Sonography in Obstetrics I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20796, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 20795);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20797, 'DMUT', 'MTWRF', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20797, '3200 Abdominal Imaging');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20798, 'DMUT', 'MTWRF', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20798, '3210 Obstetrical Imaging');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20799, 'DMUT', 'MTWRF', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20799, '3220 Gynecological Imaging');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20800, 'DMUT', 'MTWRF', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20800, '3230 Superficial Structure Imaging');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20801, 'DMUT', 'MTWRF', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20801, '3240 Appl Ultrasnd Instrumentation');

##################################################################
###################### Early Modern Studies ######################
##################################################################
INSERT INTO department VALUES ('EMSP','Early Modern Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23454, 'EMSP', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23454, '2000Y Structures of the Modern Self');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20921, 'EMSP', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20921, '2215 Violence & Wonder: Baroque');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20922, 'EMSP', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20922, '2320 Witchcraft in Erly Mdrn Europe');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20923, 'EMSP', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20923, '2350 The Body in Early Moder Europe');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20924, 'EMSP', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20924, '2480 The Pirate and Piracy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23455, 'EMSP', 'MW', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23455, '3000Y Study Nature Early Mod.Europe');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20925, 'EMSP', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20925, '3270 Leonardo da Vinci: Art & Scie.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20926, 'EMSP', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20926, '3321 History of European Alchemy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23457, 'EMSP', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23457, '4000Y Concpt State, Soc & Rev EMP');

############################################################
###################### Earth Sciences ######################
############################################################
INSERT INTO department VALUES ('ERTH','Earth Sciences');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21083, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21083, '1030 Intro Physical Geography');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21085, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21083);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21086, 'F', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21083);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21087, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21083);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24038, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21083);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21089, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21089, '1080 Geology I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21090, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21089);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21091, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21089);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21092, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21092, '1090 Geology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21093, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21092);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21094, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21092);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21096, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21096, '2002 Introduction to Petrology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21097, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21096);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21098, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21096);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21099, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21099, '2270 Intro to Applied Geophysics.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21100, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 21099);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21101, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21101, '2380 Geochemistry');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21102, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21101);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21103, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21103, '2410 Environ Iss. in Erth Scie.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21104, 'ERTH', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21104, '3020 Metamorphic Petrology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21105, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21104);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21106, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21106, '3140 Structural Geology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21107, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21106);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21110, 'ERTH', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21110, '3440 Geomorphology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21111, 'ERTH', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21111, '3601 Global Biogeochemical Cycles');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21112, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 21111);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23942, 'ERTH', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23942, '4010 Advanced Petrology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23944, 'M', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 23942);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21113, 'ERTH', 'M', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21113, '4102 Research Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21114, 'ERTH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21114, '4110 Geological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21118, 'ERTH', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21118, '4157 Petroleum Geoscience Field Met');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21119, 'ERTH', 'M', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21119, '4202 Honours Thesis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21122, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21122, '4520 GIS Applicatns Enviro & Geo');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21123, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21124, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21122);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21125, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21125, '4530 Environmental Remote Sensing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21125);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21127, 'ERTH', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21127, '4850 Geographic Info Scie. Res. Pro');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23945, 'ERTH', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23945, '5010 Advanced Petrology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23946, 'M', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 23945);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22921, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22921, '5520 GIS Applications');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22922, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22921);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22923, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22921);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22924, 'ERTH', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22924, '5530 Environmental Remote Sensing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22925, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22924);
        
#######################################################
###################### Economics ######################
#######################################################
INSERT INTO department VALUES ('ECON','Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20849, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20849, '1101 Principles of Microeconomics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20851, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20851, '1102 Principles of Macroeconomics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20854, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20855, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20856, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20857, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20858, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20859, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20860, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20861, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20862, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20863, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20864, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20865, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20866, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20867, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20868, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20869, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20870, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20871, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20872, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20873, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20874, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20875, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20876, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20851);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20877, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20851);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20852, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20852, '1102 Principles of Macroeconomics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20854, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20855, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20856, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20857, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20858, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20859, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20860, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20861, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20862, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20863, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20864, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20865, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20866, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20867, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20868, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20869, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20870, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20871, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20872, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20873, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20874, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20875, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20876, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20852);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20877, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20852);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20853, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20853, '1102 Principles of Macroeconomics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20854, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20855, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20856, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20857, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20858, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20859, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20860, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20861, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20862, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20863, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20864, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20865, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20866, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20867, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20868, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20869, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20870, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20871, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20872, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20873, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20874, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20875, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20876, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20853);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20877, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 20853);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20878, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20878, '2200 Intermediate Microeconomics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20880, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20880, '2201 Intermediate Macroeconomics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20881, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20881, '2201 Intermediate Macroeconomics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20884, 'ECON', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20884, '2212 Law and Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24039, 'ECON', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24039, '2216 Economics of Global Warming');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20885, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20885, '2219 Common Markt to European Union');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20886, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20886, '2231 Perspectives Health Economics.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20887, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20887, '2239 European Economy Since 1900');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20888, 'ECON', 'TRF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20888, '2260 Statistics I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20889, 'T', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 20888);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20890, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 20888);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20891, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20888);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20892, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20888);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20893, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20888);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20895, 'ECON', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20895, '2280 Statistics II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20897, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20895);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20896, 'ECON', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20896, '2280 Statistics II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20897, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20896);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20898, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20898, '2334 Perspective on Econ Developmen');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20899, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20899, '2336 Regional Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20901, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20901, '3330 International Trade');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20902, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20902, '3331 International Finance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20903, 'ECON', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20903, '3332 Resource Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20904, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20904, '3333 Economic Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20905, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20905, '3338 Intro Econometrics I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20906, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 20905);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20907, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20907, '3339 Intro Econometrics II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20908, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20907);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20910, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20910, '3349 History of Economic Thought');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20912, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20912, '3900 Financial Mathematics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20914, 'ECON', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20914, '4202 Honours Thesis II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20915, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20915, '4420 Microeconomic Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20916, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20916, '4440 Time Series in Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23960, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23960, '5231 Health Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22877, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22877, '5254 Applied Development Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22878, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22878, '5330 International Trade');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22879, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22879, '5440 Time Series in Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22880, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22880, '5517 Environmental Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22881, 'ECON', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22881, '5525 Applied Econometrics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22882, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22882, '5576 Econometrics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22883, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22883, '6534 Advanced Econometrics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22884, 'ECON', 'TF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22884, '6600 Advanced Macro Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22885, 'ECON', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22885, '6609 Advanced Micro Theory');

############################################################################
###################### Electrical & Computer Engineer ######################
############################################################################
INSERT INTO department VALUES ('ECED','Electrical & Computer Engineer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20803, 'ECED', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20803, '2001 Circuit Analysis');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20804, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20803);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20805, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20803);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20806, 'ECED', 'MW', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20806, '2200 Digital Circuits');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20807, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20806);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24208, 'ECED', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24208, '3600 Modern Control Systems.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24209, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 24208);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20809, 'ECED', 'TF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20809, '4071 Analog Filter Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20810, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 20809);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20811, 'ECED', 'M', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20811, '4350 Semiconductor Matl & Devices');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20812, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 20811);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20813, 'ECED', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20813, '4360 Antenna Theory & Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20814, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 0, 20813);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20815, 'ECED', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20815, '4404 Comp Networks & Communication');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20816, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20815);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20817, 'ECED', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20817, '4421 Tech & Apps of Fiber Optics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20818, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20817);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20821, 'ECED', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20821, '4502 Digital Signal Processing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20822, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20821);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20823, 'ECED', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20823, '4513 Communication Networks');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20824, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20823);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20825, 'ECED', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20825, '4602 Control Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20826, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20825);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20827, 'ECED', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20827, '4760 Biomedical Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20828, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20827);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20829, 'ECED', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20829, '4900 Senior Year Project I.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20830, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20829);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20831, 'ECED', 'T', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20831, '4901 Senior Year Project II.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20832, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 20831);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22859, 'ECED', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22859, '6070 Modern Integrated Filters');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22860, 'ECED', 'F', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22860, '6221 Analog MOS Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22864, 'ECED', 'R', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22864, '6585 Telecommunications Systems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24309, 'ECED', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24309, '6640 Mobile Robotics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22865, 'ECED', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22865, '6900 ECED Graduate Seminars');

#################################################################
###################### Electronic Commerce ######################
#################################################################
INSERT INTO department VALUES ('ECMM','Electronic Commerce');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22869, 'ECMM', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22869, '6014 Databases & Data Mining/ElecCo');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22870, 'ECMM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22870, '6022 Project Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22871, 'ECMM', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22871, '6040 Research Methods');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24365, 'F', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 22871);
        
#########################################################
###################### Engineering ######################
#########################################################
INSERT INTO department VALUES ('ENGI','Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20929, 'ENGI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20929, '1203 Mechanics 1: Statics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20930, 'F', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20931, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20932, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20933, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20934, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20935, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20936, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20937, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 20929);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20939, 'M', TIME(STR_TO_DATE('1835', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 20929);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20940, 'ENGI', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20940, '2103 Thermo-Fluid Engi II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20941, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 20940);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20942, 'ENGI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20942, '2203 Engineering Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20947, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20942);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20948, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20942);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20949, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20942);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20950, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20942);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20951, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20942);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20943, 'ENGI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20943, '2203 Engineering Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20947, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20943);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20948, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20943);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20949, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20943);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20950, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20943);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20951, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20943);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20944, 'ENGI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20944, '2203 Engineering Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20947, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20944);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20948, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20944);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20949, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20944);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20950, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20944);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20951, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20944);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20945, 'ENGI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20945, '2203 Engineering Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20947, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20945);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20948, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20945);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20949, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20945);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20950, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20945);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20951, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20945);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20946, 'ENGI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20946, '2203 Engineering Design II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20947, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20946);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20948, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20946);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20949, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20946);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20950, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20946);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20951, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20946);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20952, 'ENGI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20952, '2204 Mechanics of Materials');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20953, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 20952);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20954, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20952);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20955, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 20952);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20956, 'ENGI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20956, '2400 Mechanics Dynamics II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20957, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20956);
        
#########################################################################
###################### Engineering Internetworking ######################
#########################################################################
INSERT INTO department VALUES ('INWK','Engineering Internetworking');

#####################################################################
###################### Engineering Mathematics ######################
#####################################################################
INSERT INTO department VALUES ('ENGM','Engineering Mathematics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21007, 'ENGM', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21007, '1041 Applied Linear Algebra');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21008, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21009, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21010, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21011, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21012, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21013, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21014, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21015, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21016, 'W', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21007);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21017, 'ENGM', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21017, '2022 Applied Differential Equations');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21018, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 21017);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21019, 'ENGM', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21019, '2283 Data Structures & Algorithms');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21020, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21019);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21021, 'ENGM', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21021, '3052 Applied Numerical Methods');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21022, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21021);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21023, 'ENGM', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21023, '3356 Num Meth & Partial Dif Equatio');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21024, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21023);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24005, 'ENGM', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24005, '4675 Risk Assessment');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24006, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 24005);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24009, 'ENGM', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24009, '6675 Risk Assessment and Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24010, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 24009);
        
#####################################################
###################### English ######################
#####################################################
INSERT INTO department VALUES ('ENGL','English');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20958, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20958, '1005 Literature: Global Perspective');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20959, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20958);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20960, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20958);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20961, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20958);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20962, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 20958);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20963, 'ENGL', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20963, '1015 Literature: How it Works');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20964, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20963);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20965, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20963);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20966, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20963);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20967, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 20963);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20968, 'ENGL', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20968, '1025 Literature: Why it Matters');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20969, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20968);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20970, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20968);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20971, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20968);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20972, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 20968);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20973, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20973, '1040 Reading Pop Cult: Writing Req.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20974, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 20973);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20975, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 20973);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20976, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 20973);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20977, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 20973);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20978, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20978, '1050 Pulp Fiction: Writing Req.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20979, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20980, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20981, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20978);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20982, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20982, '1051 Pulp Fiction: non-Writ.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20983, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 20982);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20984, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20984, '1100 Writing for University');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20985, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 20984);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20986, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 20984);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20987, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 20984);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (20988, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 20984);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20989, 'ENGL', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20989, '2002 British Lit after 1800');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20990, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20990, '2005 World Literature');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20991, 'ENGL', 'MWF', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20991, '2006 Cultural Studies.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20992, 'ENGL', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20992, '2215 Young Shakespeare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24139, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24139, '2222 Fictions of Self Discovery');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20993, 'ENGL', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20993, '2229 Tragedy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20995, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20995, '3000 Close Reading');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20997, 'ENGL', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20997, '3031 19th Cent Fict: Austen-Dickens');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23912, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23912, '3112 Writing Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23909, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23909, '3260 Contemporary Fiction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20999, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20999, '3270 Contemporary Canadian Lit.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21000, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21000, '3320 Literature and Medicine');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21002, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21002, '4020 Paradise Lost');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21003, 'ENGL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21003, '4024 James Joyce\'s Ulysses');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21004, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21004, '4407 Oppositional Archives');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21005, 'ENGL', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21005, '4619 The Marginalized Middle Ages');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22895, 'ENGL', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22895, '5850 Aesthetic Scandals');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22896, 'ENGL', 'M', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22896, '5955 Psychoanalysis and Fiction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22897, 'ENGL', 'F', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22897, '5973 Climate Fic Apocalypse Utopia');

###################################################################
###################### English Language (CE) ######################
###################################################################
INSERT INTO department VALUES ('ENSL','English Language (CE)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21034, 'ENSL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21034, '0005 Acad Writing & Research Skills');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21035, 'ENSL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21035, '0005 Acad Writing & Research Skills');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21036, 'ENSL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21036, '0005 Acad Writing & Research Skills');

#######################################################################
###################### Environmental Engineering ######################
#######################################################################
INSERT INTO department VALUES ('ENVE','Environmental Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21048, 'ENVE', 'W', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21048, '3500 Air Quality');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21049, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21048);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21050, 'ENVE', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21050, '4402 Dsgn Proj for Env. Engineer II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21051, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21050);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24111, 'ENVE', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24111, '4641 Contaminant Fate & Transport');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24112, 'W', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 1, 24111);
        
###################################################################
###################### Environmental Science ######################
###################################################################
INSERT INTO department VALUES ('ENVS','Environmental Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21055, 'ENVS', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21055, '1200 Environmental Challenges');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21056, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21055);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21057, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21055);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21058, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21055);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21059, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 1, 21055);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21060, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 21055);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21061, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 21055);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21062, 'ENVS', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21062, '2310 Energy and the Environment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21063, 'ENVS', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21063, '2410 Env Issues in Earth Sciences');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21065, 'ENVS', 'W', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21065, '3100 Environmental Analytics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21066, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21065);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21067, 'ENVS', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21067, '3200 Intro to Environmental Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21068, 'ENVS', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21068, '3225 Plants in the Human Landscape');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21069, 'F', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21068);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21072, 'ENVS', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21072, '3502 Env Problem Solving II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21073, 'ENVS', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21073, '3601 Global Biogeochemical Cycles');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21074, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 1, 21073);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21075, 'ENVS', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21075, '3702 Sustainable Industries');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21078, 'ENVS', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21078, '4850 Geographic Info Scie Res Proj');

###################################################################
###################### Environmental Studies ######################
###################################################################
INSERT INTO department VALUES ('ENVI','Environmental Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23460, 'ENVI', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23460, '5009Y Grad Sem in Res. & Env. Stud.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24285, 'ENVI', 'M', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24285, '5010 Environ & Occupational Hlth');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22908, 'ENVI', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22908, '5023 Qualitative Data Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22909, 'ENVI', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22909, '5047 Conservation System Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22912, 'ENVI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22912, '5051 Special Topics REM');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23905, 'ENVI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23905, '5052 Sp Topic in Env Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22913, 'ENVI', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22913, '5205 Resource & Environmental Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22914, 'ENVI', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22914, '5500 Socio-politic dimensions');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22915, 'ENVI', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22915, '5505 Biophysical Dimensions REM');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22916, 'ENVI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22916, '6100 Info in Pol & Decision-Making');

##############################################################
###################### European Studies ######################
##############################################################
INSERT INTO department VALUES ('EURO','European Studies');

##########################################################
###################### Film Studies ######################
##########################################################
INSERT INTO department VALUES ('FILM','Film Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21134, 'FILM', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21134, '2337 Russian Film II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21135, 'FILM', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21135, '3301 Film History 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23939, 'FILM', 'T', 
        TIME(STR_TO_DATE('1805', '%k%i')), TIME(STR_TO_DATE('2055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23939, '4392 Point of View in the Cinema');

############################################################################
###################### First Year Interest Groups-Sci ######################
############################################################################
INSERT INTO department VALUES ('FIGS','First Year Interest Groups-Sci');

##########################################################
###################### Food Science ######################
##########################################################
INSERT INTO department VALUES ('FOSC','Food Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21141, 'FOSC', 'TW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21141, '4070 Food Processing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21142, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 21141);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22930, 'FOSC', 'TW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22930, '6325 Fish/Food Processing II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22931, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 22930);
        
####################################################
###################### French ######################
####################################################
INSERT INTO department VALUES ('FREN','French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21146, 'FREN', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21146, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21145, 'FREN', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21145, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21148, 'FREN', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21148, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21147, 'FREN', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21147, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21149, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21149, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21150, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21150, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21151, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21151, '1008 Basic French, Pt. 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23466, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23466, '1045Y Intermediate French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23467, 'FREN', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23467, '1045Y Intermediate French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23468, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23468, '1045Y Intermediate French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23469, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23469, '1045Y Intermediate French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23470, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23470, '1045Y Intermediate French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23472, 'FREN', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23472, '1050Y Fr. for Former Immersion Stdnt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23471, 'FREN', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23471, '1050Y Fr. for Former Immersion Stdnt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21154, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21154, '2002 Spoken French');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21155, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21155, '2022 Language and Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23473, 'FREN', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23473, '2045Y Advanced French/Fr. niv.avancé');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23474, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23474, '2045Y Advanced French/Fr. niv.avancé');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23475, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23475, '2045Y Advanced French/Fr. niv.avancé');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21156, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21156, '2201 Intro to French Literature');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21157, 'FREN', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21157, '2202 Intro to French Literature');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21158, 'FREN', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21158, '2666 The End of the World.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21159, 'FREN', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21159, '3000 Advanced Oral French Workshop');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21160, 'FREN', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21160, '3021 Syntax/Syntaxe');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23476, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23476, '3045Y Written Expression');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21161, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21161, '3150 Aspects de la francophonie');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21162, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21162, '3500 17th Century French Lit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21164, 'FREN', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21164, '4017 Traduction Generale');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24092, 'FREN', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24092, '4500 Intellect Advntr-17th Cent');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21166, 'FREN', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21166, '5110 Lexicologie Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21168, 'FREN', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21168, '5876 Studies-French Canadian Lit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24387, 'FREN', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24387, '5930 Popular Literature');

#######################################################################
###################### Gender & Women\'s Studies ######################
#######################################################################
INSERT INTO department VALUES ('GWST','Gender & Women\'s Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21228, 'GWST', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21228, '1015 Gender and Diversity');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21229, 'GWST', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21229, '1070 Modern Russ Culture & Civil');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24140, 'GWST', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24140, '2222 Fictions of Self-Discovery');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21232, 'GWST', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21232, '2320 Witchcraft in Early Modern Eur');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21233, 'GWST', 'T', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21233, '2412 Human Sexuality');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24129, 'GWST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24129, '2900 Intro to Art Hist & Visual Cul');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24020, 'GWST', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24020, '3017 Sex and the Practice of Power');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24257, 'GWST', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24257, '3800 Gender & Health');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23921, 'GWST', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23921, '4116 Cont Issues in Gen & Develop');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21238, 'GWST', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21238, '4151 Contemporary Masculinities');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21239, 'GWST', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21239, '4390 NGOs & Government Services');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21240, 'GWST', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21240, '4500 Topics in Feminist Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22941, 'GWST', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22941, '5170 Contemporay Feminist Theories');

#######################################################
###################### Geography ######################
#######################################################
INSERT INTO department VALUES ('GEOG','Geography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21178, 'GEOG', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21178, '1030 Intro to Physical Geography');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21180, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21181, 'F', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24037, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21178);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21183, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21178);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21184, 'GEOG', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21184, '1035 Intro to Human Geography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21185, 'GEOG', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21185, '2006 Space, place and GIS');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21186, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21185);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21187, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 21185);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21188, 'GEOG', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21188, '2202 Intro to Develop Stud II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21189, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21188);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21190, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21188);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21191, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21188);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21192, 'GEOG', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21192, '2206 Africa: An Introduction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24451, 'GEOG', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24451, '3102 Coastal Change and Adaptation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24452, 'GEOG', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24452, '3106 The Canadian North');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21195, 'GEOG', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21195, '3440 Geomorphology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21196, 'GEOG', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21196, '4520 GIS Appl to Env & Geolog Scie.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21197, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21196);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21198, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21196);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21199, 'GEOG', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21199, '4530 Environmental Remote Sensing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21200, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21199);
        
####################################################
###################### German ######################
####################################################
INSERT INTO department VALUES ('GERM','German');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23478, 'GERM', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23478, '1010Y German for Beginners');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23482, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23483, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23484, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23485, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23486, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23487, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23488, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23478);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23489, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23478);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23479, 'GERM', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23479, '1010Y German for Beginners');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23482, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23483, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23484, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23485, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23486, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23487, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23488, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23479);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23489, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23479);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23480, 'GERM', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23480, '1010Y German for Beginners');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23482, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23483, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23484, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23485, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23486, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23487, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23488, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23480);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23489, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23480);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23481, 'GERM', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23481, '1010Y German for Beginners');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23482, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23483, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23484, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23485, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23486, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23487, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23488, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23481);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23489, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 23481);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21202, 'GERM', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21202, '1027 German Fiction Novel & Film II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21203, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 21202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21204, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 21202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21205, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 21202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21206, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 21202);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21207, 'GERM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21207, '2002 Intermediate German II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21208, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21207);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21209, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21207);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21210, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21207);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21211, 'GERM', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21211, '2022 Translation & Composition II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21214, 'GERM', 'M', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21214, '2600 Freiheit:Freedom in German Lit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24082, 'GERM', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24082, '2651 Modern German Philosophy I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21217, 'GERM', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21217, '3004 Advanced German II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21218, 'GERM', 'T', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21218, '3010 Advanced Transl I: Germ-Engl');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24081, 'GERM', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24081, '3056 Goeth\'s Faust I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24182, 'GERM', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24182, '3251 Modern German Lit. I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24079, 'GERM', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24079, '3301 Hist or Germany Poetry I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21224, 'GERM', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21224, '3450 Confronting Fascism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21225, 'GERM', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21225, '3550 Germany and the Environment');

###################################################################
###################### Health Administration ######################
###################################################################
INSERT INTO department VALUES ('HESA','Health Administration');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22943, 'HESA', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22943, '5315 Managing Change/Hlth Sys');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22944, 'HESA', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22944, '5320 Managerial Epidemiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22945, 'HESA', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22945, '5335 Info Sys/Health Administration');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22946, 'HESA', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22946, '5341 Healthcare Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22947, 'HESA', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22947, '5350 Mgmt Cntrl/Fund Sys/Hlth Care');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22948, 'HESA', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22948, '6310 Health Care Policy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22949, 'HESA', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22949, '6341 Management Union Relations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22950, 'HESA', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22950, '6345 Healthcare Leadership');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22951, 'HESA', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22951, '6361 Business Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22952, 'HESA', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22952, '6362 Advanced Healthcare Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22953, 'HESA', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22953, '6365 QM in Healthcare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22954, 'HESA', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22954, '6367 Hlth Law & Pol. Curr. Issue II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22955, 'HESA', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22955, '6380 Senior Seminar');

################################################################
###################### Health Informatics ######################
################################################################
INSERT INTO department VALUES ('HINF','Health Informatics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22961, 'HINF', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22961, '6020 Research Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22962, 'HINF', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22962, '6102 HI Flow and Standards');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22963, 'HINF', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22963, '6230 Knowledge Management for HI');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22964, 'HINF', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22964, '6300 Project Management');

################################################################
###################### Health Professions ######################
################################################################
INSERT INTO department VALUES ('HLTH','Health Professions');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23504, 'HLTH', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23504, '6000Y Health Seminar Series I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23505, 'HLTH', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23505, '6100Y Aspects of Health Research');

##############################################################
###################### Health Promotion ######################
##############################################################
INSERT INTO department VALUES ('HPRO','Health Promotion');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21307, 'HPRO', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21307, '2110 Health Promotion Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21308, 'HPRO', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21308, '2120 Health Promotion Policy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21309, 'HPRO', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21309, '2361 Program Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21310, 'HPRO', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21310, '3250 Human Nutrition');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21311, 'HPRO', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21311, '3325 Mental Health Promotion');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21312, 'HPRO', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21312, '3351 Injury Prevention & Safety Ed.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21313, 'HPRO', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21313, '4101 Applied Research Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21314, 'HPRO', 'T', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21314, '4412 Human Sexuality');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22983, 'HPRO', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22983, '5503 Intermed Stat - Health Scie');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22984, 'HPRO', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22984, '5595 Prog Plan and Eval Hlth Prom');

#######################################################################
###################### Health Sciences Education ######################
#######################################################################
INSERT INTO department VALUES ('HSCE','Health Sciences Education');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21316, 'HSCE', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21316, '1010 Clinical Skills for Hlth Scie.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21317, 'T', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 21316);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21318, 'R', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 21316);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21321, 'HSCE', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21321, '2030 Radiation Biology & Protection');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21322, 'HSCE', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21322, '2040 Pathophysiology for Hlth Scie.');

##########################################################################
###################### Health and Human Performance ######################
##########################################################################
INSERT INTO department VALUES ('HAHP','Health and Human Performance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21242, 'HAHP', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21242, '2000 Human Growth & Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21243, 'HAHP', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21243, '3000 Community Development');

##########################################################################
###################### Hist of Science & Technology ######################
##########################################################################
INSERT INTO department VALUES ('HSTC','Hist of Science & Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23506, 'HSTC', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23506, '1200Y Intr to the History of Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23507, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 23506);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23508, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23506);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21326, 'HSTC', 'MW', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21326, '1801 Tec & Eng: Indus-Cybern Age');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21327, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21328, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21329, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21330, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21331, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21332, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21333, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21334, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21335, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21336, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21337, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21338, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21326);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21339, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21326);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21340, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21340, '2002 Medieval Natural Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23509, 'HSTC', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23509, '2200Y Intr to the History of Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23510, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 23509);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23511, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23509);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21341, 'HSTC', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21341, '2202 Westrn Medi: Birth of the Body');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21342, 'HSTC', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21342, '2206 Bio-Politics:Human Natu/CtmpTh');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21343, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21343, '2350 Body in Erly Modern Europe');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21344, 'HSTC', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21344, '2400 Science and the Media');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23887, 'HSTC', 'M', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23887, '3030Y Science and Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24021, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24021, '3101 Human Experiments');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21346, 'HSTC', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21346, '3121 Hist of European Alchemy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21347, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21347, '3201 Scie & Relig: Contemp Perspect');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24024, 'HSTC', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24024, '3202 Ecology and Religion');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21349, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21349, '3270 Leonardo da Vinci: Between A&S');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21350, 'HSTC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21350, '3320 Oracles, Omens & Astrology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24130, 'HSTC', 'F', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24130, '3400 History of Mathematics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24250, 'HSTC', 'T', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24250, '4301 The Hist. of Neuroscience');

#####################################################
###################### History ######################
#####################################################
INSERT INTO department VALUES ('HIST','History');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23884, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23884, '1021 Europe: Fren Rev to Present');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23885, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23885, '1023 Europe: Fre Rev-Pres (Writing)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21256, 'HIST', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21256, '1510 History of the Future');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21257, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21256);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21258, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21256);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21259, 'T', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21256);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21260, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21256);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21261, 'HIST', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21261, '1911 Life Stories Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21262, 'HIST', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21262, '2007 Atlantic World 1650-1800');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21263, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21263, '2015 Europ. Military Hist 1550-1740');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21264, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21264, '2016 The Classical Greek World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21265, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21265, '2021 Soviet Russia');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21266, 'HIST', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21266, '2023 Roman Legions & The Barbarians');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24373, 'HIST', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24373, '2042 Capital of Europe: Paris 19thC');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21267, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21267, '2049 The 1st World War Causes & Cam');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23490, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23490, '2074Y Intr to the History of Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23491, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 23490);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23492, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23490);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21269, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21269, '2235 History of Canadian Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21270, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21270, '2272 Atlntc Can since Confederation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24084, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24084, '2402 Castles to Cafes:Dresses from');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21271, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21271, '2426 Africa:Disruption & Innovation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21272, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21272, '2510 Trauma of Modern S. Asia');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21273, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21273, '2750 The Pirate and Piracy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24103, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24103, '2900 Intro Art Hist& Visual Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21276, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21276, '3050 Europe & World War II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21277, 'HIST', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21277, '3059 Confronting Fascism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21278, 'HIST', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21278, '3076 Scie & Relig: Contemp Perspect');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21280, 'HIST', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21280, '3101 Pun. Crime. Courts - Early Mod');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24104, 'HIST', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24104, '3222 Canadian Soc His 19th & 20th C');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21281, 'HIST', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21281, '3226 Law & Justice in Can to 1890');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21282, 'HIST', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21282, '3227 Crim Law/Punish/Canada 1890-Pr');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21283, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21283, '3302 Tech & Hist in N. America');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24085, 'HIST', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24085, '3403 Bustle/Boardrm: Dress 1870-Now');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21284, 'HIST', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21284, '3430 Colonial Africa - 1850-1930');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21285, 'HIST', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21285, '3452 Apartheid and After');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21286, 'HIST', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21286, '3471 Wars & Revol. 20th Cent Africa');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23901, 'HIST', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23901, '3520 Empire & Resistance: Sri Lanka');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21288, 'HIST', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21288, '3750 History of Seafaring');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21289, 'HIST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21289, '3990 Hist of European Alchemy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21293, 'HIST', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21293, '4370 The American Revolution');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23495, 'HIST', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23495, '4986Y The Varieties of History');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22970, 'HIST', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22970, '5007 The European Enlightenment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22971, 'HIST', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22971, '5091 Soviet History Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22972, 'HIST', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22972, '5430 Making of Colonial Africa');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22973, 'HIST', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22973, '5471 Wars & Revol. in 20th Cent Afr');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23498, 'HIST', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23498, '5800Y The Masters Seminar');

################################################################
###################### Indigenous Studies ######################
################################################################
INSERT INTO department VALUES ('INDG','Indigenous Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21376, 'INDG', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21376, '2052 Contemp. Issue in Indg Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21377, 'INDG', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21377, '3050 Indg Res Meth & Knowldg Pract');

####################################################################
###################### Industrial Engineering ######################
####################################################################
INSERT INTO department VALUES ('IENG','Industrial Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21356, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21356, '4432 Simulation of Industrial Sys.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21357, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21356);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21358, 'IENG', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21358, '4443 Quality Control and Reliabilit');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21359, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 21358);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21360, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21360, '4445 Facilities Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23888, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21360);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21362, 'IENG', 'MW', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21362, '4454 Design of Inventory Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21363, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21362);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21366, 'IENG', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21366, '4480 Industrial Engineering Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21367, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 0, 21366);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24201, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24201, '4529 Indust & Org Psychology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24202, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 24201);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21368, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21368, '4564 Design of Hlth Care Sys.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21369, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21368);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24253, 'IENG', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24253, '4567 Engineering Risk Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24254, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 24253);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24255, 'IENG', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24255, '4575 Stochastic Proc & Queuing');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24256, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 24255);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21370, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21370, '4579 Supply Chain Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21371, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 21370);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24025, 'IENG', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24025, '4581Y Design Project');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23516, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24025);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22986, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22986, '6908 Advanced Facilities Planning');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23889, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22986);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22988, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22988, '6909 Supply Chain Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22989, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22988);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24258, 'IENG', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24258, '6916 Stochastic Processes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22990, 'IENG', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22990, '6917 Simulation of Indust Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24247, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22990);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22991, 'IENG', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22991, '6920 Adv Top Linear/Integer Program');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24397, 'IENG', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24397, '6967 Adv. Top Eng Rsk and Saf');

####################################################################
###################### Information Management ######################
####################################################################
INSERT INTO department VALUES ('INFO','Information Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22997, 'INFO', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22997, '5520 Research Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22998, 'INFO', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22998, '5570 Organizational Mgmt & Strategy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22999, 'INFO', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22999, '6100 Info Pub Policy & Decisn Makng');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23000, 'INFO', 'F', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23000, '6270 Introduction to Data Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23001, 'INFO', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23001, '6330 Cataloguing & Classification');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23003, 'INFO', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23003, '6450 Serv & Resources for Children');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23004, 'INFO', 'R', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23004, '6540 Data Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23904, 'INFO', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23904, '6620 Web Design and Architecture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23006, 'INFO', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23006, '6682 Human Information Interaction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23009, 'INFO', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23009, '6750 Hlth Scie Lit & Info Sources');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23010, 'INFO', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23010, '6800 Archives');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23011, 'INFO', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23011, '6810 Manage Info Lit Instr');

##########################################################################
###################### Interdisc Studies (Graduate) ######################
##########################################################################
INSERT INTO department VALUES ('INTE','Interdisc Studies (Graduate)');

###########################################################################
###################### International Develop Studies ######################
###########################################################################
INSERT INTO department VALUES ('INTD','International Develop Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21380, 'INTD', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21380, '1103 Halifax and the World: Pt II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21381, 'INTD', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21381, '2002 Intro to Development II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21382, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21381);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21383, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21381);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21384, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21381);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21385, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21381);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21386, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21381);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21387, 'INTD', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21387, '2045 Indian Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21388, 'INTD', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21388, '2106 Africa: An Introduction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21389, 'INTD', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21389, '3003 Development & Activism');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21390, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21389);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23518, 'INTD', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23518, '3107Y Experiential Learning: Canada');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23920, 'INTD', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23920, '3116 Ctmp Issues in Gender & Devt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21393, 'INTD', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21393, '3150 Aspects of Francophone World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21394, 'INTD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21394, '4001 Topics in Development Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21395, 'INTD', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21395, '4012 Honours Thesis Seminar B');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23519, 'INTD', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23519, '5002Y Grad Sem/Research Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23016, 'INTD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23016, '5003 Special Topics in INTD I');

###########################################################################
###################### Interprofessional Health Educ ######################
###########################################################################
INSERT INTO department VALUES ('IPHE','Interprofessional Health Educ');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21397, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21397, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21398, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21398, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21399, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21399, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21400, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21400, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21401, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21401, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21402, 'IPHE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21402, '4900 Interprof Hlth Edu Portfolio');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23021, 'IPHE', 'M', 
        TIME(STR_TO_DATE('1805', '%k%i')), TIME(STR_TO_DATE('2055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23021, '5100 Addictions Studies');

#####################################################
###################### Italian ######################
#####################################################
INSERT INTO department VALUES ('ITAL','Italian');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23520, 'ITAL', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23520, '1010Y Italian for Beginners');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23521, 'ITAL', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23521, '1010Y Italian for Beginners');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24001, 'ITAL', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24001, '2010Y Intermediate Italian');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21403, 'ITAL', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21403, '2200 Modern Italian Culture');

########################################################
###################### Journalism ######################
########################################################
INSERT INTO department VALUES ('JOUR','Journalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23522, 'JOUR', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23522, '1001Y Foundations of Journalism');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23524, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23522);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23525, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23522);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23526, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23522);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23527, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23522);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23528, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23522);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23529, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23522);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23523, 'JOUR', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23523, '1001Y Foundations of Journalism');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23524, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23523);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23525, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23523);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23526, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23523);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23527, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23523);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23528, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23523);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23529, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 23523);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21406, 'JOUR', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21406, '2400 Science and the Media');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21407, 'JOUR', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21407, '2701 Intermediate Reporting');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21408, 'JOUR', 'F', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21408, '3005 Advanced Reporting 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21409, 'JOUR', 'T', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21409, '3339 Ethics & Law for Journalists');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21410, 'JOUR', 'W', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21410, '3441 Advanced Creative Nonfiction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21412, 'JOUR', 'M', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21412, '3550 Copy Editing.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21413, 'JOUR', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21413, '3660 Photojournalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21414, 'JOUR', 'T', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21414, '3660 Photojournalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21415, 'JOUR', 'R', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21415, '3660 Photojournalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21416, 'JOUR', 'W', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21416, '3660 Photojournalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21417, 'JOUR', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21417, '3660 Photojournalism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21418, 'JOUR', 'R', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21418, '3670 Opinion Writing');

#########################################################
###################### Kinesiology ######################
#########################################################
INSERT INTO department VALUES ('KINE','Kinesiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21419, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21419, '1102 Physical Activity and Health');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21420, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21421, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21422, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21423, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21424, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21425, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21426, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21427, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21419);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21428, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21419);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21429, 'KINE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21429, '1106 Philosophy and Ethics for KINE');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21431, 'KINE', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21431, '1108 Psychology and Physical Activi');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21432, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21433, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21434, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21435, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21436, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21437, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21438, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21439, 'M', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21431);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21440, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21431);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21441, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21441, '2430 Motor Control & Learning');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21442, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21443, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21444, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21445, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21446, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21447, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21441);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21448, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21441);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21450, 'KINE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21450, '2465 Introductory Biomechanics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21451, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21452, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21453, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21454, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21455, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21456, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21457, 'W', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21450);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21458, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0955', '%k%i')), 0, 21450);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21459, 'KINE', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21459, '3200 Sociocult Iss. in Phys Activit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21460, 'KINE', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21460, '3250 Human Nutrition');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21461, 'KINE', 'MWF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21461, '3320 Anatomical Bas - Hmn Move');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21462, 'KINE', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21462, '3419 Appl Physio Principles Perform');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21463, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21462);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21464, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21462);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21465, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21462);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21467, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21467, '3430 Princples of Skill Acquisition');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21468, 'KINE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21468, '3482 Care & Prevention Injuries');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21469, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21468);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21470, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21468);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21471, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21468);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21472, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21468);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21474, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21468);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21475, 'KINE', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21475, '3500 Prin Measurement & Evaluation');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21476, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21477, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21478, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21479, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21480, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21481, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21475);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21482, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 21475);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23530, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23530, '4412Y Adv Fitness Assessment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21484, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21484, '4600 Case Studies in Kines Assessmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21485, 'KINE', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21485, '4701 Sr Sem Strn Phys. Hi Perf Sprt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21486, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21486, '4706 Sr. Sem. Hips and Shoulders');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21487, 'KINE', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21487, '4707 Sen Sem: Adv Sport Psych');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21488, 'KINE', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21488, '4708 Sen Sem: Sport Nutrition');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23531, 'KINE', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23531, '4900Y Honours Research & Thesis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23033, 'KINE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23033, '5503 Intermed Stat - Health Scie');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23035, 'KINE', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23035, '6000 Graduate Sem in Kinesiology');

#############################################################################
###################### King\'s Foundation Year Program ######################
#############################################################################
INSERT INTO department VALUES ('KING','King\'s Foundation Year Program');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23533, 'KING', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 12);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23533, '1000Y Foundation Yr Program Arts');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23534, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 23533);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23535, 'MWF', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 23533);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23536, 'MWF', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 23533);
        
#################################################
###################### Law ######################
#################################################
INSERT INTO department VALUES ('LAWS','Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23541, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23541, '1000Y Contracts&Jud Decision Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23542, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23542, '1000Y Contracts&Jud Decision Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23543, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23543, '1000Y Contracts&Jud Decision Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23544, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23544, '1000Y Contracts&Jud Decision Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23545, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23545, '1000Y Contracts&Jud Decision Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23547, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23547, '1001Y Criminal Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23548, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23548, '1001Y Criminal Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23549, 'LAWS', 'MT', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23549, '1001Y Criminal Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23550, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23550, '1001Y Criminal Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23551, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23551, '1001Y Criminal Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23553, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23553, '1003Y Fundamentals of Public Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23554, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23554, '1003Y Fundamentals of Public Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23555, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23555, '1003Y Fundamentals of Public Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23557, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23557, '1004Y Legal Research and Writing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23558, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23558, '1004Y Legal Research and Writing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23559, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23559, '1004Y Legal Research and Writing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23561, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23561, '1005Y Property in Hist. Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23562, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23562, '1005Y Property in Hist. Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23563, 'LAWS', 'TR', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23563, '1005Y Property in Hist. Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23565, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23565, '1006Y Tort Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23566, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23566, '1006Y Tort Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23567, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23567, '1006Y Tort Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23568, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23568, '1006Y Tort Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23569, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23569, '1006Y Tort Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23351, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23351, '2000 Administrative Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24152, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24152, '2002 Business Associations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23353, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23353, '2005 Private International Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23354, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23354, '2008 Evidence');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21495, 'LAWS', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21495, '2010 Insurance Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24271, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1805', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24271, '2014 Labour Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23355, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23355, '2015 Planning Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24272, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24272, '2019 Law and Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23356, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23356, '2020 Fisheries Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23357, 'LAWS', 'R', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23357, '2022 Law of the Sea');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24154, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24154, '2028 Copyright, Indust.Designs');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23358, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23358, '2029 Taxation I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23359, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23359, '2033 Equity & Trusts');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23361, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23361, '2040 Civil Trial Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23362, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23362, '2040 Civil Trial Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23363, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23363, '2040 Civil Trial Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24155, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24155, '2045 Criminal Law Problems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23364, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23364, '2048 Employment Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23365, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23365, '2051 International Environmntl Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23366, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23366, '2056 International Trade Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23572, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23572, '2061Y Civil Procedure');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23573, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23573, '2061Y Civil Procedure');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23574, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 2.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23574, '2061Y Civil Procedure');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23367, 'LAWS', 'TR', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23367, '2062 Constitutional Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24180, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24180, '2076 Poverty Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23374, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23374, '2079 Oil and Gas');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24151, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24151, '2081 Bankruptcy & Insolvency');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23375, 'LAWS', 'R', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23375, '2087 General Jurisprudence');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24191, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0940', '%k%i')), TIME(STR_TO_DATE('1130', '%k%i')), 9);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24191, '2092 Criminal Clinic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23377, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 9);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23377, '2092 Criminal Clinic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23378, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23378, '2096 Entertainment Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23379, 'LAWS', 'R', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23379, '2099 Legal Profession');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23383, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23383, '2110 Family Law I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23384, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23384, '2112 Advanced Issues in Fam Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24150, 'LAWS', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24150, '2113 Alt. Dispute Res. Processes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23385, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23385, '2113 Alt. Dispute Res. Processes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23386, 'LAWS', 'R', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23386, '2123 Canadian Legal History');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23387, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23387, '2129 Corporate Transactions');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23388, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23388, '2133 Environmental Law II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23390, 'LAWS', 'TR', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23390, '2138 Securities Regulation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24279, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24279, '2159 Health Systems Law & Policy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23394, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23394, '2168 Internet and Media Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24161, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24161, '2170 Information Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23395, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23395, '2172 Advanced Legal Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23398, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23398, '2188 Restorative Justce Theo & Pra');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24273, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24273, '2191 Animals and the Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23399, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23399, '2197 International Criminal Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23575, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), .5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23575, '2201Y Second Year Moot');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23404, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23404, '2218 Construction Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23405, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23405, '2220 Privacy Law.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23406, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23406, '2223 Elder Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24177, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24177, '2230 Science and the Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24167, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24167, '2236 Mental Disability Law:Criminal');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24156, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24156, '2252 Fiduciary Law/Business Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23415, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23415, '2253 Class Act. Law & Proc. in Can.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24175, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24175, '2269 Taxation II: Int\'l Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24164, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24164, '2278 Law & Public Policy in Practic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24447, 'LAWS', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24447, '2279 Law and Public Policy in Pract');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23421, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23421, '2280 Aboriginal Peoples  & the Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24160, 'LAWS', 'M', 
        TIME(STR_TO_DATE('1105', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 2);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24160, '2289 Indigenous Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24149, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24149, '2290 Adv. Aboriginal People & Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24157, 'LAWS', 'F', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 1);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24157, '2292 Hlth Law & Policy: Current Iss');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24158, 'F', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1455', '%k%i')), 1, 24157);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24162, 'LAWS', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24162, '2297 Intl Sexual & Reprod Hlth Rght');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23424, 'LAWS', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 1);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23424, '2298 Adv Commercial Drafting');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24170, 'LAWS', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 1);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24170, '2301 Qualitative Meth. & Interview');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24192, 'LAWS', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24192, '2308Y Responding to Sexual. Violence');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24153, 'LAWS', 'W', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24153, '2310 Child Protection Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21497, 'LAWS', 'TR', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21497, '2520 Introduction to Law II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23425, 'LAWS', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23425, '2800 Intro to Environmental Law');

#######################################################################
###################### Law, Justice, and Society ######################
#######################################################################
INSERT INTO department VALUES ('LJSO','Law, Justice, and Society');

#############################################################
###################### Leisure Studies ######################
#############################################################
INSERT INTO department VALUES ('LEIS','Leisure Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21498, 'LEIS', 'TRF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21498, '2127 Leisure Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21499, 'LEIS', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21499, '2130 Found/Concpt Theraputic Rec');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21500, 'LEIS', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21500, '2361 Program Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21501, 'LEIS', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21501, '3360 Analys of Leisure Serv Del Set');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21502, 'LEIS', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21502, '3370 Rec Fac Dsgn & Ops Mgmt');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21503, 'LEIS', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21503, '3426 Therapeutic Rec:Serv.Delivery');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21504, 'LEIS', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21504, '4101 Advanced Research Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23578, 'LEIS', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), .75);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23578, '4804Y Directed Study I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23037, 'LEIS', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23037, '5503 Intermed Stat - Health Scie');

##########################################################################
###################### Magnetic Resonance Imag Tech ######################
##########################################################################
INSERT INTO department VALUES ('MRIT','Magnetic Resonance Imag Tech');

########################################################
###################### Management ######################
########################################################
INSERT INTO department VALUES ('MGMT','Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24035, 'MGMT', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24035, '1101 Intro. Accounting I (Fin)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24028, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24028, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24028);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24028);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24029, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24029, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24029);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24029);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24030, 'MGMT', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24030, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24030);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24030);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24031, 'MGMT', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24031, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24031);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24031);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24032, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24032, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24032);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24032);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24033, 'MGMT', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24033, '1102 Introductory Accounting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24034, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24033);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24058, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24033);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21695, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21695, '1302 Interdisciplinary Mgmt. II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21697, 'MGMT', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21697, '1601 Electronic Info. Mgmt.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21706, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21706, '2304 Pple, wk, org. Macro aspects');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21707, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21707, '2304 Pple, wk, org. Macro aspects');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21708, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21708, '2304 Pple, wk, org. Macro aspects');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21709, 'MGMT', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21709, '2305 Ethics & Social Responsibility');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21710, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21709);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21711, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21709);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21712, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21709);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21714, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21714, '2401 Intro to Marketing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21715, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21715, '2402 Mrktng App Not-for-Profit Sect');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21716, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21716, '2402 Mrktng App Not-for-Profit Sect');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21717, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21717, '2402 Mrktng App Not-for-Profit Sect');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23890, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23890, '2502 Predictive Analytics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21720, 'MGMT', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21720, '2902 Innovation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21721, 'MGMT', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21721, '3308 Managing the Family Enterprise');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21722, 'MGMT', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21722, '3309 Management Skills Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21724, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21724, '3400 Intro to Real Estate Managemen');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21725, 'MGMT', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21725, '3501 Operations Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21726, 'MGMT', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21726, '3511 Management Info. Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21730, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21731, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21732, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21733, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21734, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21735, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21736, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21726);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21737, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21726);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21727, 'MGMT', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21727, '3511 Management Info. Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21730, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21731, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21732, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21733, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21734, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21735, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21736, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21727);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21737, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21727);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21728, 'MGMT', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21728, '3511 Management Info. Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21730, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21731, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21732, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21733, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21734, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21735, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21736, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21728);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21737, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21728);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21729, 'MGMT', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21729, '3511 Management Info. Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21730, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21731, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21732, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21733, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21734, 'M', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21735, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21736, 'F', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21729);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21737, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 21729);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21738, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21738, '3601 Info in a Networked World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21740, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21740, '3602 Prof. Communication Skills');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21741, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 21740);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21742, 'W', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21740);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21744, 'MGMT', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21744, '3702 Sustainable Industries');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21745, 'MGMT', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21745, '3710 Business in Emerging Markets');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21747, 'MGMT', 'MW', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21747, '3902 Starting Lean');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21748, 'MGMT', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21748, '3907 New Venture Creatn Entrepren');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21749, 'MGMT', 'W', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21749, '4002 Strategy Implementation');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21750, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21749);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21751, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 21749);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21752, 'MGMT', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21752, '4047 Conservation System Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21753, 'MGMT', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21753, '4205 Law and Policy for REM');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21754, 'MGMT', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21754, '4333 Project Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21755, 'MGMT', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21755, '4340 Corporate Governance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21757, 'MGMT', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21757, '4500 Socio-Political Dimens of REM');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21758, 'MGMT', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21758, '4505 Biophysical Dimensions - REM');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21759, 'MGMT', 'R', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21759, '4540 Data Management');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21760, 'MGMT', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21760, '4620 Web Design and Architecture');

############################################################
###################### Marine Affairs ######################
############################################################
INSERT INTO department VALUES ('MARA','Marine Affairs');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23040, 'MARA', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23040, '5003 Marine Science and Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23042, 'MARA', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23042, '5011 Cont Issu Ocean Mgmt Devl Pt 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23043, 'MARA', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23043, '5012 Community Based Co-Management');

############################################################
###################### Marine Biology ######################
############################################################
INSERT INTO department VALUES ('MARI','Marine Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21509, 'MARI', 'MTR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21509, '3076 Physiology Marine Animals II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21510, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21509);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21511, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21509);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21512, 'MARI', 'MTR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21512, '3080 Ecology & Evolution Fishes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21513, 'MARI', 'MWF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21513, '3090 Marine Mammalogy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23955, 'MARI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23955, '3101 Microbial Ecology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21514, 'MARI', 'TRF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21514, '3301 Invertebrate Biology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21515, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21516, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21514);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21519, 'MARI', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21519, '4080 Laboratory Studies of Fishes');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21520, 'MARI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21520, '4350 Cutting Edge Marine Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21522, 'MARI', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21522, '4600 Aquaculture Modelling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21523, 'MARI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21523, '4661 Intro Biological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21524, 'MARI', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21524, '4662 Biology of Phytoplankton');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23045, 'MARI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23045, '5350 Cutting Edge Marine Science');

###################################################################
###################### Materials Engineering ######################
###################################################################
INSERT INTO department VALUES ('MATL','Materials Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21638, 'MATL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21638, '3500 Materials Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21639, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21638);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21640, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21638);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21641, 'MATL', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21641, '4800 Materials Design Project II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21642, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21641);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21645, 'MATL', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21645, '4810 Materials Process Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21646, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21645);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21647, 'MATL', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21647, '4820 Non-Metallic Materials');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21648, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 21647);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21649, 'MATL', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21649, '4830 Non-Ferrous Alloys');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21650, 'R', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 21649);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21651, 'MATL', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21651, '4840 Corrosion & Degradation Matl.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21652, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21651);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23056, 'MATL', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23056, '6020 Sel Topics in Phys Metallurgy');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23057, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23056);
        
#########################################################
###################### Mathematics ######################
#########################################################
INSERT INTO department VALUES ('MATH','Mathematics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21532, 'MATH', 'TRF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21532, '1000 Differential & Integral Calc I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21533, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21532);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21534, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21532);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21535, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21532);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21536, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21536, '1010 Differential & Integral CalcII');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21539, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21540, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21541, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21542, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21543, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21544, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21545, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21546, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21536);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21547, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21536);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21537, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21537, '1010 Differential & Integral CalcII');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21539, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21540, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21541, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21542, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21543, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21544, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21545, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21546, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21547, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21537);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21538, 'MATH', 'TRF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21538, '1010 Differential & Integral CalcII');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21539, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21540, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21541, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21542, 'W', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21543, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21544, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21545, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21546, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21538);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21547, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21538);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21548, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21548, '1030 Matrix Theory & Linear Alg 1');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21549, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21548);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21550, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21548);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21551, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21548);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21552, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21548);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21553, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21548);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21554, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21554, '1060 Intro Stat Science & Health Sc');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21558, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21559, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21560, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21561, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21562, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21563, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21564, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21565, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21566, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21567, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21568, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21569, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21570, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21571, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21572, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21573, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21574, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21575, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21554);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21576, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21554);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21555, 'MATH', 'MW', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21555, '1060 Intro Stat Science & Health Sc');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21558, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21559, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21560, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21561, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21562, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21563, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21564, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21565, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21566, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21567, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21568, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21569, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21570, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21571, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21572, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21573, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21574, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21575, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21555);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21576, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21555);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21556, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21556, '1060 Intro Stat Science & Health Sc');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21558, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21559, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21560, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21561, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21562, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21563, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21564, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21565, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21566, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21567, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21568, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21569, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21570, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21571, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21572, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21573, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21574, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21575, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21556);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21576, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21556);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21557, 'MATH', 'TRF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21557, '1060 Intro Stat Science & Health Sc');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21558, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21559, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21560, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21561, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21562, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21563, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21564, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21565, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21566, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21567, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21568, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21569, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21570, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21571, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21572, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21573, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21574, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21575, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21557);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21576, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21557);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21577, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21577, '1115 Mathematics for Commerce');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21578, 'MATH', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21578, '1115 Mathematics for Commerce');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21579, 'MATH', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21579, '1215 Life Sciences Calculus');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21580, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21579);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21581, 'R', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21579);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21582, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21582, '1280 Engineering Math I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21583, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21582);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21584, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21584, '1290 Engineering Math II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21586, 'MWF', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21587, 'MWF', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21588, 'MWF', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21589, 'MWF', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21590, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21591, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21592, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21593, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21584);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21594, 'MWF', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21584);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21596, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21596, '2002 Intermediate Calculus II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21597, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21597, '2040 Matrix Theo/Linear Algebra II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21598, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21598, '2051 Problems in Geometry');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21599, 'MATH', 'TRF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21599, '2060 Intro Probability & Statistics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21600, 'T', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 21599);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21601, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21599);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21602, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21599);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21603, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21599);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21604, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21599);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21606, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21606, '2080 Stat Meth Data-Analys Infernce');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21608, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 21606);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21607, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21607, '2080 Stat Meth Data-Analys Infernce');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21608, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 21607);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21609, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21609, '2112 Discrete Structures I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21610, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21610, '2113 Discrete Structures II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21611, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21611, '2135 Linear Algebra');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21612, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21612, '2300 Mathematical Modelling');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21613, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 21612);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21614, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21612);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21615, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21615, '2505 Introductory Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21616, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21616, '3032 Topics in Abstract Algebra');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21617, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21617, '3080 Intro Complex Variables');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21618, 'MATH', 'TRF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21618, '3120 Differential Equations II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21620, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21620, '3260 Applied Differential Equations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21621, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21621, '3350 Design of Experiments');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21622, 'MATH', 'MF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21622, '3460 Intermediate Stat Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21623, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21623, '3502 Intermediate Analysis II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21624, 'MATH', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21624, '3900 Financial Mathematics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21625, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21625, '4020 Analytic Function Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21626, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21626, '4045 Advanced Algebra I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21627, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21627, '4116 Cryptography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21628, 'MATH', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21628, '4135 Intro to Category Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24088, 'MATH', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24088, '4140 Intro Functional Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21629, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21629, '4220 Intro Partial Diff Equations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24071, 'MATH', 'MF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24071, '4330 Topics in Graph Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24059, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24059, '4360 Combinatorial Modeling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21631, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21631, '4410 Cosmology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21633, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21633, '4680 Topics in Logic and Comp.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21634, 'MATH', 'W', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21634, '4950 Honours Research Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23046, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23046, '5020 Analytic Function Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23048, 'MATH', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23048, '5135 Intro to Category Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24089, 'MATH', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24089, '5140 Intro-Functional Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23049, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23049, '5220 Intro-Partial Diff Equations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24145, 'MATH', 'MF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24145, '5330 Topics in Graph Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24060, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24060, '5360 Combinatorial Modeling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24011, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24011, '5410 Cosmology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24412, 'MATH', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24412, '5650 General Relativity');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23052, 'MATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23052, '5680 Topics in Logic and Comp.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23579, 'MATH', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23579, '7030Y Category Theory Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23580, 'MATH', 'W', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23580, '7050Y Comb. and Game  Theo Sem.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23581, 'MATH', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23581, '7060Y Relativity Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23582, 'MATH', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23582, '7190Y Analysis Seminar');

####################################################################
###################### Mechanical Engineering ######################
####################################################################
INSERT INTO department VALUES ('MECH','Mechanical Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21663, 'MECH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21663, '3010 Machine Design I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21664, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21663);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21665, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21663);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21666, 'MECH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21666, '3500 Dynamics of Machines');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21667, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21666);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21668, 'MECH', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21668, '3805 Thermodynamics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21669, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21668);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21670, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21668);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21671, 'MECH', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21671, '4025 Design Project II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21672, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21671);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23990, 'MECH', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23990, '4210 Introduction to Additive Manuf');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23991, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23990);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24064, 'MECH', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24064, '4444 Mechatronics, Technical Electi');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24065, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 24064);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21675, 'MECH', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21675, '4500 Vibrations');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21676, 'W', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21675);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21677, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21675);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24066, 'MECH', 'MR', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24066, '4640 Robotics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24067, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 24066);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21678, 'MECH', 'R', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21678, '4670 Finite-Element Simulation Tech');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21679, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21678);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21680, 'MECH', 'M', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21680, '4810 Energy Conversion Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21681, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21680);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24068, 'MECH', 'M', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24068, '4830 Reciprocating I-C Engines');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24069, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 24068);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21684, 'MECH', 'MR', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21684, '4850 Solar Energy Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24063, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21684);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21685, 'MECH', 'MR', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21685, '4880 Intro to Nuclear Engineering');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21686, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 21685);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21687, 'MECH', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21687, '4900 Systems II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21688, 'M', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 21687);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21689, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 21687);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21690, 'F', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21687);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24242, 'MECH', 'WF', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24242, '6346 Advanced Energy Storage');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24359, 'MECH', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24359, '6350 Adv Engineering Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24070, 'MECH', 'W', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24070, '6535 Fibre Reinforced Plastics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24408, 'MECH', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24408, '6660 Finite Element Simulation Tech');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24409, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 24408);
        
####################################################################
###################### Medical Lab Technology ######################
####################################################################
INSERT INTO department VALUES ('MDLT','Medical Lab Technology');

#############################################################
###################### Medical Physics ######################
#############################################################
INSERT INTO department VALUES ('MEDP','Medical Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23070, 'MEDP', 'TR', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23070, '6410 Med. Img. Physics (Part II)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23071, 'MEDP', 'T', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23071, '6416 Seminars in Medical Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23072, 'MEDP', 'W', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23072, '6423 Radiation Therapy Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23073, 'MEDP', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23073, '6431 Radiation Safety & Protection');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23074, 'MEDP', 'MW', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23074, '6450 Computational Meth in Med Phyc');

##############################################################
###################### Medical Research ######################
##############################################################
INSERT INTO department VALUES ('MEDR','Medical Research');

#######################################################################
###################### Microbiology & Immunology ######################
#######################################################################
INSERT INTO department VALUES ('MICI','Microbiology & Immunology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21781, 'MICI', 'MTWRF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21781, '1050 Basic Micro and Imm for Pharm');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21782, 'TR', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21781);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21783, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 21781);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21784, 'MICI', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21784, '1100 Health Science Microbiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24200, 'MICI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24200, '2115 Human Organs and Tissues');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21787, 'MICI', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21787, '2400 Lab Methods Microbio & Imm');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21788, 'MICI', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21788, '2400 Lab Methods Microbio & Imm');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21789, 'MICI', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21789, '3620 Exp Lrn in Microbiol and Immun');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24321, 'MICI', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24321, '4027 Molecular Mechanisms of Cancer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21791, 'MICI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21791, '4100 Processes and Mediators Inflm');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21792, 'MICI', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21792, '4114 Adv Top Molec/Medic Virology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21793, 'MICI', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21793, '4115 Medical Immunology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21794, 'MICI', 'TRF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21794, '4218 Clinical Microbiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23089, 'MICI', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23089, '5027 Molecular Mechanisms of Cancer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23090, 'MICI', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23090, '5029 Adv Topics/Mol Pathogen (MSc)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23093, 'MICI', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23093, '5049 Adv Topics/Mol Pathogen (Phd)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23907, 'MICI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23907, '5056 Topics in Advanced Immun-MSc');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23095, 'MICI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23095, '5100 Processes & Mediators Inflm');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23096, 'MICI', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23096, '5114 Adv Top Molec/Medic Virology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23930, 'MICI', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23930, '5115 Immunology of Host Resistance');

##########################################################################
###################### Mineral Resource Engineering ######################
##########################################################################
INSERT INTO department VALUES ('MINE','Mineral Resource Engineering');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21804, 'MINE', 'WF', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21804, '2200 Geology for Engineers');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21805, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 21804);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21806, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21804);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21807, 'MINE', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21807, '3600 Equipment Sel and Matl. Handl.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21808, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21807);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21809, 'MINE', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21809, '3611 Rock Mechanics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21810, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21809);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21811, 'MINE', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21811, '3612 Rock Penetrat\'n & Fragmentat\'n');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21812, 'MINE', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21812, '4100 Mining Geotechnique');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21813, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 21812);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21814, 'MINE', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21814, '4706 Mining Geology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21815, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 21814);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21816, 'MINE', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21816, '4710 Mine Excavation Systems');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21817, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 21816);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21818, 'MINE', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21818, '4711 Mine Ventilat\'n & Environ Crtl');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21819, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21818);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21820, 'MINE', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21820, '4820 Surface Mine Slope Stability');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21821, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 21820);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21824, 'MINE', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21824, '4850 Senior Design Project II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21825, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 21824);
        
###################################################
###################### Music ######################
###################################################
INSERT INTO department VALUES ('MUSC','Music');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21843, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21843, '1081 Voice Clinic for Theatre II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23586, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23586, '1101Y Voice I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23587, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23587, '1101Y Voice I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23588, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23588, '1102Y Guitar I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23589, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23589, '1103Y Piano I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23591, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23591, '1105Y Violin I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23592, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23592, '1106Y Viola I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23593, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23593, '1107Y Cello  I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23594, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23594, '1108Y Double Bass I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23595, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23595, '1109Y Flute I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23596, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23596, '1110Y Oboe I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23597, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23597, '1111Y Clarinet I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23598, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23598, '1112Y Bassoon I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23600, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23600, '1114Y French Horn  I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23601, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23601, '1115Y Trumpet  I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23603, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23603, '1117Y Tuba I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23604, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23604, '1118Y Percussion I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21844, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21844, '1222 Music Theory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23605, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23605, '1270Y Aural Skills I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23606, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23606, '1271Y Keyboard Skills I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23607, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23607, '1271Y Keyboard Skills I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23608, 'MUSC', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23608, '1271Y Keyboard Skills I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21845, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21845, '2019 Rock\'n Roll Era & Beyond');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21846, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21846, '2020 The History of Jazz');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21848, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21848, '2025 Guitar: Hist. & Techniques 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21849, 'MUSC', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21849, '2025 Guitar: Hist. & Techniques 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21851, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21851, '2029 Art & Science of Drumming 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23609, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23609, '2101Y Voice II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23610, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23610, '2101Y Voice II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23611, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23611, '2102Y Guitar II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23612, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23612, '2103Y Piano II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23614, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23614, '2105Y Violin  II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23615, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23615, '2106Y Viola II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23616, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23616, '2107Y Cello II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23617, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23617, '2108Y Double Bass II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23618, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23618, '2109Y Flute II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23620, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23620, '2111Y Clarinet  II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23621, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23621, '2112Y Bassoon  II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23623, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23623, '2114Y French  Horn  II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23624, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23624, '2115Y Trumpet II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23625, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23625, '2116Y Trombone II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23626, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23626, '2117Y Tuba  II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23627, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23627, '2118Y Percussion II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21852, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21852, '2222 Music Theory IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23628, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23628, '2270Y Aural Skills II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23629, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23629, '2271Y Keyboard Skills II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23630, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23630, '2271Y Keyboard Skills II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21853, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21853, '2355 Hist West Musc 1750-Present');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21884, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21884, '3061 Electroacoustic Music');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23631, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23631, '3101Y Voice III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23632, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23632, '3101Y Voice III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23633, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23633, '3102Y Guitar  III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23636, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23636, '3105Y Violin III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23637, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23637, '3106Y Viola III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23638, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23638, '3107Y Cello  III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23639, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23639, '3108Y Double Bass III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23640, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23640, '3109Y Flute III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23641, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23641, '3110Y Oboe III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23643, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23643, '3111Y Clarinet  III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23644, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23644, '3112Y Bassoon  III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23646, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23646, '3114Y French Horn III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23647, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23647, '3115Y Trumpet III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23648, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23648, '3116Y Trombone III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23649, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23649, '3117Y Tuba III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23650, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23650, '3118Y Percussion III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23891, 'MUSC', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23891, '3210Y Composition I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24007, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24007, '3282 Orchestration');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21888, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21888, '3661 Electroacoustic Music');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23653, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23653, '3701Y Voice III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23654, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23654, '3701Y Voice III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23655, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23655, '3702Y Guitar III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23656, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23656, '3703Y Piano III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23658, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23658, '3705Y Violin III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23659, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23659, '3706Y Viola III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23660, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23660, '3707Y Cello III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23661, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23661, '3708Y Double Bass III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23662, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23662, '3709Y Flute III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23663, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23663, '3710Y Oboe III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23664, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23664, '3711Y Clarinet III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23665, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23665, '3712Y Bassoon III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23667, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23667, '3714Y French Horn III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23668, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23668, '3715Y Trumpet III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23669, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23669, '3716Y Trombone III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23670, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23670, '3717Y Tuba III (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23672, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23672, '4101Y Voice IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23673, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23673, '4101Y Voice IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23674, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23674, '4102Y Guitar  IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23675, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23675, '4103Y Piano IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23676, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23676, '4105Y Violin IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23677, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23677, '4106Y Viola IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23678, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23678, '4107Y Cello IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23679, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23679, '4108Y Double Bass IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23680, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23680, '4109Y Flute IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23681, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23681, '4110Y Oboe  IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23682, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23682, '4111Y Clarinet IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23683, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23683, '4112Y Bassoon  IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23685, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23685, '4114Y French  Horn  IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23686, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23686, '4115Y Trumpet IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23687, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23687, '4116Y Trombone IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23688, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23688, '4117Y Tuba  IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23689, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23689, '4118Y Percussion IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21904, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21904, '4170 Improvisation Tech & Practices');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23892, 'MUSC', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23892, '4210Y Composition II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24342, 'MUSC', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24342, '4369 Special Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21909, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21909, '4380 Selected Composer Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23715, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23715, '4701Y Voice IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23716, 'MUSC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23716, '4701Y Voice IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23717, 'MUSC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23717, '4702Y Guitar IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23718, 'MUSC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23718, '4703Y Piano IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23720, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23720, '4705Y Violin IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23722, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23722, '4707Y Cello IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23723, 'MUSC', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23723, '4708Y Double Bass IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23724, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23724, '4709Y Flute IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23725, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23725, '4710Y Oboe IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23726, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23726, '4711Y Clarinet IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23727, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23727, '4712Y Bassoon IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23729, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23729, '4714Y French Horn IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23730, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23730, '4715Y Trumpet IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23731, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23731, '4716Y Trombone IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23732, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1705', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23732, '4717Y Tuba IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23733, 'MUSC', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23733, '4718Y Percussion IV (Performance)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24072, 'MUSC', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24072, '5001 Proseminar in Musicology.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21941, 'MUSC', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21941, '5370 Selected Composer Studies');

##########################################################
###################### Neuroscience ######################
##########################################################
INSERT INTO department VALUES ('NESC','Neuroscience');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21943, 'NESC', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21943, '2160 Animal Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21944, 'NESC', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21944, '2470 Systems Neuroscience');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21946, 'NESC', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21946, '3012 Exp Learn in Scie Comm II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21947, 'NESC', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21947, '3051 Sensory Neuroscience I: Vision');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21948, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 21947);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21950, 'NESC', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21950, '3131 Res Methods in Attention.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21951, 'W', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21950);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21952, 'NESC', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21952, '3137 Rsch Meth Cognitive Neurosci');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21953, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 21952);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21954, 'NESC', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21954, '3162 Adv. Anim. Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21955, 'NESC', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21955, '3165 Neuroethology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21956, 'NESC', 'TRF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21956, '3170 Hormones & Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21957, 'NESC', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21957, '3227 Prin Human Neuropsychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21959, 'NESC', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21959, '3371 Neuroscience Laboratory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21960, 'NESC', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21960, '3371 Neuroscience Laboratory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21961, 'NESC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21961, '3775 Behavioural Neuroscience Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23932, 'NESC', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23932, '4007 Contemporary Issues');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21963, 'NESC', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21963, '4070 Chemical Neurobiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21964, 'NESC', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21964, '4160 Topics in Behaviour. Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24372, 'NESC', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24372, '4177 Theoretical Neuroscience');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24243, 'NESC', 'T', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24243, '4587 History of Neuro Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23109, 'NESC', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23109, '5070 Chemical Neurobiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23956, 'NESC', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23956, '6071 Behavioural Neuroscience');

#########################################################################
###################### Nuclear Medicine Technology ######################
#########################################################################
INSERT INTO department VALUES ('NUMT','Nuclear Medicine Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21967, 'NUMT', 'T', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21967, '1020 Nuclear Med Clinical Procedure');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21968, 'R', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 21967);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21969, 'NUMT', 'MW', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21969, '2000 Radiopharmacy');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21970, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1755', '%k%i')), 0, 21969);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21971, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1755', '%k%i')), 0, 21969);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21972, 'NUMT', 'MW', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21972, '2020 Nuclear Med Clin Procedure III');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21973, 'T', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 0, 21972);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21974, 'R', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 21972);
        
#####################################################
###################### Nursing ######################
#####################################################
INSERT INTO department VALUES ('NURS','Nursing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21992, 'NURS', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21992, '2725 Clinical Integration II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (21994, 'NURS', 'MW', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (21994, '2740 Nursing & Family Health');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21996, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21997, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21998, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (21999, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22000, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22001, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22002, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22003, 'M', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 21994);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22015, 'NURS', 'TR', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22015, '3710 Nursing & Episodic Illness');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22016, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22017, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22018, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22019, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22020, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22021, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22022, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22023, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22015);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22024, 'NURS', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22024, '3715 Clinical Integration III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22028, 'NURS', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22028, '4710 Relational Practice & Adv Clin');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22030, 'NURS', 'F', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22030, '4715 Exploratory Nurs Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22032, 'NURS', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22032, '4720 Professional Formation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22035, 'NURS', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22035, '4800 Human Nutrition');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23112, 'NURS', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23112, '5140 Comm. Res. Meth. Hlth Disparit');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23113, 'NURS', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23113, '5200 Health Care Sys. Pol. Anal.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23115, 'NURS', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23115, '5485 Prin/Theo NP Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23117, 'NURS', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23117, '5550 Marginalized Populationa');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24248, 'NURS', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24248, '5560 Hlth System Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23119, 'NURS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23119, '5570 Knowledge Translation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23120, 'NURS', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23120, '5570 Knowledge Translation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23125, 'NURS', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23125, '5734 Prin Pharmacotherapy NPs');

##################################################################
###################### Occupational Therapy ######################
##################################################################
INSERT INTO department VALUES ('OCCU','Occupational Therapy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24014, 'OCCU', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24014, '3500 Human Occu Across Lifespan');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23138, 'OCCU', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23138, '5004 Occu Assess and Occu Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23140, 'OCCU', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23140, '5006 Wellness and Incl  Dsgn & Tech');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24292, 'OCCU', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24292, '5015 Musculoskeletal Therapeutics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24293, 'OCCU', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24293, '5017 Research Approaches and EBP');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24291, 'OCCU', 'R', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24291, '5112 Fieldwork I');

##########################################################
###################### Oceanography ######################
##########################################################
INSERT INTO department VALUES ('OCEA','Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22043, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22043, '1002 Conversat w/ Ocean Scientst II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22044, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22043);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22045, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22043);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22046, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22043);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22047, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22047, '2002 The Blue Planet II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22048, 'OCEA', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22048, '2021 Tools & Concept in Ocea Sci II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22049, 'W', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22048);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22050, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22050, '4000 Oceans and Global Change');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22051, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22051, '4110 Geological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22052, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22052, '4140 Biological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22054, 'OCEA', 'W', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22054, '4202 Honours Research - Part II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22055, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22055, '4210 Time Series Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22056, 'OCEA', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22056, '4220 Numerical Modelling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22057, 'OCEA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22057, '4221 Ocean Dynamics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22058, 'OCEA', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22058, '4230 Biology of Phytoplankton');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22061, 'OCEA', 'M', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22061, '4380 Marine Modelling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22062, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22062, '4402 Marine Management II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22063, 'OCEA', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22063, '4412 Atmospheric Dynamics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22065, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22065, '4550 Synoptic Meteorology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22066, 'TR', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22065);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23150, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23150, '5110 Geological Oceanography');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23153, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23153, '5210 Time Series Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23154, 'OCEA', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23154, '5220 Num Modelling of Atmsph & Ocea');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23155, 'OCEA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23155, '5221 Ocean Dynamics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23156, 'OCEA', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23156, '5230 Biology of Phytoplankton');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23157, 'OCEA', 'M', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23157, '5380 Marine Modelling');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23158, 'OCEA', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23158, '5412 Atmospheric Dynamics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23160, 'OCEA', 'TR', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23160, '5550 Synoptic Meteorology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23161, 'TR', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23160);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23162, 'OCEA', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23162, '5570 Radiative Transfer');

##########################################################
###################### Oral Surgery ######################
##########################################################
INSERT INTO department VALUES ('ORAL','Oral Surgery');

#########################################################
###################### PHD Program ######################
#########################################################
INSERT INTO department VALUES ('PHDP','PHD Program');

#######################################################
###################### Pathology ######################
#######################################################
INSERT INTO department VALUES ('PATH','Pathology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24146, 'PATH', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24146, '2115 Human Organs and Tissues');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22067, 'PATH', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22067, '3000 Introduction to Pathology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22068, 'PATH', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22068, '4100 Critical Thnkg Neuropathology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23166, 'PATH', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23166, '5000 General Pathology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23167, 'PATH', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23167, '5027 Molecular Mechanisms of Cancer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23168, 'PATH', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23168, '5035 Human Genetics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23169, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 23168);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23938, 'PATH', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23938, '5091 Pathol Research Seminar Series');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23172, 'PATH', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23172, '5100 Proc & Med of Inflammation');

#################################################################
###################### Performance Studies ######################
#################################################################
INSERT INTO department VALUES ('PERF','Performance Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22069, 'PERF', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22069, '1001 Writing about Music');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22070, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22069);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22071, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22069);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22072, 'PERF', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22072, '1002 Writing About Stage and Screen');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22073, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22072);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22074, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22072);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22075, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22072);
        
##########################################################
###################### Periodontics ######################
##########################################################
INSERT INTO department VALUES ('PERI','Periodontics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23178, 'PERI', 'W', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23178, '5100 Basic Science-Graduate Dentist');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23753, 'PERI', 'T', 
        TIME(STR_TO_DATE('0805', '%k%i')), TIME(STR_TO_DATE('0855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23753, '5100Y Basic Sciences for Grad Dentis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23183, 'PERI', 'M', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 9);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23183, '7150 Literature Review in Periodont');

##########################################################
###################### Pharmacology ######################
##########################################################
INSERT INTO department VALUES ('PHAC','Pharmacology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22076, 'PHAC', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22076, '1470 Pharmacology for Pharmacy');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22077, 'F', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22076);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22079, 'PHAC', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22079, '4001 Pharmacology II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23185, 'PHAC', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23185, '5409 Intro to Pharmacology II');

######################################################
###################### Pharmacy ######################
######################################################
INSERT INTO department VALUES ('PHAR','Pharmacy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23962, 'PHAR', 'M', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23962, '1072 Pharmacy Skills Lab IB');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23963, 'MW', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 23962);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23965, 'PHAR', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23965, '2012 Critical Appraisal Series IB');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22084, 'PHAR', 'MF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22084, '2035 Respiratory Tract Complaints');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22085, 'MW', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 22084);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22086, 'PHAR', 'MF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22086, '2040 Gastrointestinal Disorders');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22087, 'MW', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 22086);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22088, 'PHAR', 'MWF', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22088, '2060 Medication Use Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22089, 'MW', TIME(STR_TO_DATE('1405', '%k%i')),
        TIME(STR_TO_DATE('1455', '%k%i')), 1, 22088);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23966, 'PHAR', 'MWF', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23966, '2072 Pharmacy Skills Lab IIB');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23967, 'MWF', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 23966);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23968, 'PHAR', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23968, '3012 Critical Appraisal Series IIB');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23969, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 23968);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22092, 'PHAR', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22092, '3030 Infectious Diseases II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22093, 'MW', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22092);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22094, 'PHAR', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22094, '3050 Pain & Rheumatology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22095, 'MW', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22094);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22096, 'PHAR', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22096, '3055 CNS & Behavioural Disorders');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22097, 'MWF', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22096);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23972, 'PHAR', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23972, '3072 Pharmacy Skills Lab IIIB');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23973, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 0, 23972);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23974, 'PHAR', 'R', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23974, '3082 Practice Experience IIIB');

########################################################
###################### Philosophy ######################
########################################################
INSERT INTO department VALUES ('PHIL','Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23767, 'PHIL', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23767, '1000Y Introduction to Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23768, 'PHIL', 'MW', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23768, '1010Y Introduction to Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23769, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23769, '1010Y Introduction to Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22100, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22100, '2020 Legal Thinking');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22101, 'PHIL', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22101, '2220 Found Polit Thought 1789-1900');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22102, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22102, '2260 Philosophy of Art');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23977, 'PHIL', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23977, '2382 Mdvl Phil Arabic-Aquinas');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22103, 'PHIL', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22103, '2480 Environmental Ethics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22104, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22104, '2490 Soc/Ethi/Prof Issues in Csci');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22105, 'PHIL', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22105, '2610 History of Phil -Rationalists');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24083, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24083, '2651 Modern German Philosophy I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22106, 'PHIL', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22106, '2660 Understanding Sci Reasoning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22107, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22107, '2810 Ethics & Hlth Care: Soc Policy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22109, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22109, '3051 Epistemology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22111, 'PHIL', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22111, '3211 Philosophy of Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22112, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22112, '3420 Philosophy of Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22113, 'PHIL', 'TRF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22113, '3434 Polit Thought: Homer-Aristotle');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22114, 'PHIL', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22114, '3520 Philosophy of Social Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24203, 'PHIL', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24203, '4125 Topics: Ethics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22115, 'PHIL', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22115, '4500 Topics in Feminist Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23199, 'PHIL', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23199, '4700 Philosophy of Race');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22116, 'PHIL', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22116, '4801 Topics in Health Care Ethics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23200, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23200, '5051 Epistemology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24204, 'PHIL', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24204, '5125 Topics in Ethics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23202, 'PHIL', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23202, '5211 Philosophy of Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23203, 'PHIL', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23203, '5420 Philosophy of Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23204, 'PHIL', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23204, '5500 Topics in Feminist Philosophy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23205, 'PHIL', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23205, '5520 Phil. of Social Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23959, 'PHIL', 'F', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23959, '5680 Topics in Philosophy of Scie.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23206, 'PHIL', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23206, '5700 Philosophy of Race');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23207, 'PHIL', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23207, '5801 Ethics & Health Care');

###########################################################################
###################### Physics & Atmospheric Science ######################
###########################################################################
INSERT INTO department VALUES ('PHYC','Physics & Atmospheric Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22120, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22120, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22120);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22120);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22121, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22121, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22121);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22121);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22122, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22122, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22122);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22122);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22123, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22123, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22123);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22123);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23978, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23978, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23978);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 23978);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24368, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24368, '1290 Introduction To Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22124, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22125, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22126, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22127, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22128, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22129, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22130, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22131, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22132, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22133, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22134, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22135, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22136, 'T', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 24368);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22137, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 24368);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22143, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22143, '1320 Physics in & Around You II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22144, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22143);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22145, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22143);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22146, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22143);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22147, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22143);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22148, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22143);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22149, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 0, 22143);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22152, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22152, '1452 Ast II:Stellar & Galactic Ast');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22153, 'PHYC', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22153, '2150 Physics Tools: Experiment');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22154, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22153);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22155, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22155, '2270 Intro to Applied Geophysics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22156, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22155);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22157, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22157, '2310 Energy and the Environment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22158, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22158, '2452 Stellar & Galactic Astrophysic');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22159, 'T', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22158);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22160, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22160, '2510 Electricity & Magnetism');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22161, 'MW', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22160);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22162, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22162, '3010 Experimental Physics II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22163, 'MW', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22162);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22165, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22165, '3180 Contemporary Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22166, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22166, '3210 Statistical Mechanics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23913, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0925', '%k%i')), 1, 22166);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22167, 'PHYC', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22167, '3250 Computational Methods in Phyc');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22168, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22168, '4230 Intro to Solid State Physics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22169, 'F', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 22168);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22171, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22171, '4412 Atmospheric Dynamics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22173, 'PHYC', 'R', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22173, '4505 Atmospheric Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22174, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22174, '4550 Synoptic Meteorology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22175, 'TR', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22174);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22176, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22176, '4570 Radiative Transfer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22178, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22178, '4660 Cosmology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22179, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22179, '4850 Honors Research Project II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23212, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23212, '5412 Atmospheric Dynamics II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23213, 'PHYC', 'TRF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23213, '5460 Optics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23215, 'PHYC', 'R', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23215, '5505 Atmospheric Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23216, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23216, '5550 Synoptic Meteorology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23217, 'TR', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23216);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23218, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23218, '5570 Radiative Transfer');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23220, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23220, '5660 Cosmology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23221, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23221, '6201 Solid State Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23223, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23223, '6410 Med. Img. Physics (Part II)');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23224, 'PHYC', 'W', 
        TIME(STR_TO_DATE('1205', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 4);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23224, '6423 Radiation Therapy Physics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23225, 'PHYC', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23225, '6431 Radiation Safety & Protection');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23226, 'PHYC', 'MW', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23226, '6450 Computational Meth in Med Phyc');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23228, 'PHYC', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23228, '6600 Topics in Physics.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24261, 'PHYC', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24261, '6802 Phys & Atmos Sci PhD Seminars');

########################################################
###################### Physiology ######################
########################################################
INSERT INTO department VALUES ('PHYL','Physiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23910, 'PHYL', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23910, '1012 Human Physiology 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22185, 'PHYL', 'MTWRF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22185, '1400 Human Physiology');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22186, 'MWF', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22185);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22187, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22185);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22188, 'PHYL', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22188, '2044 Human Systems Physiology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22189, 'PHYL', 'MW', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1455', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22189, '3320 Human Cell Physiology.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22190, 'PHYL', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22190, '3520 Core Concepts in Med Physiolog');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22192, 'PHYL', 'TR', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22192, '3620 Human Physiology Lab');

###########################################################
###################### Physiotherapy ######################
###########################################################
INSERT INTO department VALUES ('PHYT','Physiotherapy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23240, 'PHYT', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23240, '5020 Intro Comp for Data Acquis & P');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23778, 'PHYT', 'W', 
        TIME(STR_TO_DATE('1405', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23778, '5040Y Graduate Seminar Series');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23919, 'PHYT', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23919, '5202 Scientific Inquiry I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23244, 'PHYT', 'MTF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23244, '5214 Cardio Physiotherapy HPRO II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24097, 'WF', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 23244);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23245, 'PHYT', 'MTF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23245, '5215 Muscoloskeletal Physio II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24098, 'MWF', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1655', '%k%i')), 0, 23245);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23247, 'PHYT', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23247, '5460 Advanced Exercise Physiol.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24099, 'W', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 0, 23247);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24080, 'PHYT', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24080, '6106 Professional Issues in PT');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24105, 'PHYT', 'M', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1055', '%k%i')), 12);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24105, '6108 Integrated Practice');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24101, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 24105);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24102, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 24105);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24078, 'PHYT', 'F', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24078, '6202 Scientific Inquiry II');

######################################################
###################### Planning ######################
######################################################
INSERT INTO department VALUES ('PLAN','Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22202, 'PLAN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22202, '1002 Intro to Community Design 2');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22203, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 22202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22204, 'R', TIME(STR_TO_DATE('1835', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 22202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22205, 'T', TIME(STR_TO_DATE('1835', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 22202);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22206, 'T', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 22202);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22207, 'PLAN', 'MF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22207, '2002 Community Design Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22208, 'PLAN', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22208, '2006 Space, Place and GIS');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22209, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22208);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22210, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22208);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24316, 'PLAN', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24316, '2010 Sustainable Community Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24008, 'PLAN', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24008, '3100 Transport. & Land Use Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24268, 'PLAN', 'F', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24268, '3115 Social Justice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22214, 'PLAN', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22214, '3225 Plants in the Human Landscape');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22215, 'F', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22214);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22216, 'PLAN', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22216, '4035 Application of Planning Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22217, 'PLAN', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22217, '4100 Community Design Internship');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22218, 'PLAN', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22218, '4106 Transportation Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24334, 'PLAN', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24334, '4150 Topics in Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22221, 'PLAN', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22221, '4500 Thesis Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23250, 'PLAN', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23250, '5035 Application of Planning Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23251, 'PLAN', 'F', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23251, '5051 Topics in Community Design II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23252, 'PLAN', 'W', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23252, '5052 Topics in Community Design 3.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23253, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23252);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23254, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 23252);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23256, 'PLAN', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23256, '5304 Planning Research Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23257, 'PLAN', 'TF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23257, '5500 Planning Studio 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23258, 'PLAN', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23258, '6106 Transportation Planning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24100, 'PLAN', 'W', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 1.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24100, '6307 Mid-Term Conference Module 4');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23263, 'PLAN', 'T', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23263, '6500 Integrative Team Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23264, 'PLAN', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23264, '6505 Seminar: Theories');

###############################################################
###################### Political Science ######################
###############################################################
INSERT INTO department VALUES ('POLI','Political Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22228, 'POLI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22228, '1065 Political Worlds: Global Domai');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23783, 'POLI', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23783, '1103Y Intro to Government & Politics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22229, 'POLI', 'TRF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22229, '1500 Globalizations');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22230, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22229);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22231, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22229);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22232, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22229);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22233, 'POLI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22233, '2215 Canadian Aboriginal Politics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22234, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22234, '2220 Structures of Cana Parliam Gov');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22235, 'POLI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22235, '2302 Comp Poli II: Developing World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22236, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22236, '2420 Political Thought 1789-1900');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22237, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22237, '2530 Foreign Policy in Thry & Pract');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22238, 'POLI', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22238, '3208 Cdn. Provincial Politics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22239, 'POLI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22239, '3360 Politics in Latin America');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22240, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22240, '3378 Am. Pol. Polarization & Crisis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24383, 'POLI', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24383, '3420 The Int. Politics of Mobility');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22241, 'POLI', 'TRF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22241, '3434 Political Thought: Homer-Arist');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22242, 'POLI', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22242, '3449 Confronting Fascism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22243, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22243, '3492 Political Inquiry I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22244, 'POLI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22244, '3496 Philosophy of Social Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22245, 'POLI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22245, '3505 Human Rights:  Foundations');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22246, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22246, '3520 Building Democracy & Peace');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22247, 'POLI', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22247, '3546 Social Media & Politics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22249, 'POLI', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22249, '3581 Diplomacy & Negotiation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22252, 'POLI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22252, '4242 Poli Beha: Reas, Passion, Biol');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22253, 'POLI', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22253, '4340 Approaches to Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22254, 'POLI', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22254, '4380 Politics of Climate Change');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22255, 'POLI', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22255, '4390 NGOs & Government Services');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24384, 'POLI', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24384, '4450 Pol. Theories of Int. Ethics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22256, 'POLI', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22256, '4561 Security-Devopment Nexus');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22257, 'POLI', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22257, '4590 Politics of the Sea II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23267, 'POLI', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23267, '5100 Research Methods and Design');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23268, 'POLI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23268, '5242 Political Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23269, 'POLI', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23269, '5340 Approaches to Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23270, 'POLI', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23270, '5380 Politics of Climate Change');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23902, 'POLI', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23902, '5561 Security-Development. Nexus');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23271, 'POLI', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23271, '5589 Politics of the Sea');

####################################################################
###################### Post-Graduate Pharmacy ######################
####################################################################
INSERT INTO department VALUES ('PGPH','Post-Graduate Pharmacy');

############################################################################
###################### Process Engineering & App Scie ######################
############################################################################
INSERT INTO department VALUES ('PEAS','Process Engineering & App Scie');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23175, 'PEAS', 'TR', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23175, '6000 Research Methodology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24056, 'PEAS', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24056, '6020 Biomass Valorization');

############################################################
###################### Prosthodontics ######################
############################################################
INSERT INTO department VALUES ('PROS','Prosthodontics');

########################################################
###################### Psychiatry ######################
########################################################
INSERT INTO department VALUES ('PSYR','Psychiatry');

########################################################
###################### Psychology ######################
########################################################
INSERT INTO department VALUES ('PSYO','Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22260, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22260, '1012 Intro to Psyo & Nesc II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22262, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22263, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22264, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22265, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22266, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22267, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22268, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22269, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22270, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22271, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22272, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22273, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22274, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22275, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22276, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22277, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22278, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22279, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22282, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22283, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22284, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22285, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22286, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22287, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22292, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22293, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22294, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22295, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22296, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22297, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22298, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22299, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22300, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22301, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22260);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22261, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22261, '1012 Intro to Psyo & Nesc II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22262, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22263, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22264, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22265, 'M', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22266, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22267, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22268, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22269, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22270, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22271, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22272, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22273, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22274, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22275, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22276, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22277, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22278, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22279, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22282, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22283, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22284, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22285, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22286, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22287, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22292, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22293, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22294, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22295, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22296, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22297, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22298, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22299, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22300, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22301, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 0, 22261);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22303, 'PSYO', 'MW', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22303, '2080 Social Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22304, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22304, '2090 Developmental Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22306, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22306, '2160 Animal Behaviour.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22307, 'PSYO', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22307, '2220 Abnormal Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22308, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22308, '2470 Systems Neuroscience');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22310, 'PSYO', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22310, '3012 Exp. Learning Scie. Comm. II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22311, 'PSYO', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22311, '3051 Sensory Neuroscience I: Vision');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22312, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 0, 22311);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22313, 'PSYO', 'MW', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22313, '3082 Experimental Social Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22314, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22314, '3091 Methods in Development Psyo');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22315, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22315, '3093 Language and Literacy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22317, 'PSYO', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22317, '3122 Methods in Exp Clin Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22319, 'PSYO', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22319, '3131 Res Methods in Attention.');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22320, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22319);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22321, 'PSYO', 'F', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22321, '3137 Research Meth Cognitive Nesc');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22322, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 22321);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22323, 'PSYO', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22323, '3162 Adv. Anim. Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22324, 'PSYO', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22324, '3165 Neuroethology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22325, 'PSYO', 'TRF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22325, '3170 Hormones & Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22327, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22327, '3227 Prin Human Neuropsychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22329, 'PSYO', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22329, '3371 Neuroscience Laboratory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22330, 'PSYO', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22330, '3371 Neuroscience Laboratory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22331, 'PSYO', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22331, '3502 Statistical Methods II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22332, 'PSYO', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22332, '3775 Behaviour Neuroscience Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22334, 'PSYO', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22334, '4090 Develop. of Social Behaviour');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22335, 'PSYO', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22335, '4120 Topics in Clinical Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22336, 'PSYO', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22336, '4160 Tpcs in Behavioural Biology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22337, 'PSYO', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22337, '4502 Honours Thesis II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23277, 'PSYO', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23277, '6001 Fundmentals of Stats & Design');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23278, 'W', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1055', '%k%i')), 0, 23277);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23957, 'PSYO', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23957, '6071 Behavioural Neuroscience');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23279, 'PSYO', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23279, '6103 Adult Assessment');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23280, 'PSYO', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23280, '6106 Foundation Prac Sk-Clinical Ps');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23281, 'PSYO', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23281, '6107 Assessment Practicum: Child');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23282, 'PSYO', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23282, '6160 Comparative Psychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23283, 'PSYO', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23283, '6209 Research Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23284, 'PSYO', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23284, '6213 Culture and Identity:Diversity');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22339, 'PSYO', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22339, '6301 Adv. Clin. Interven: Child');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23286, 'PSYO', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23286, '6303 Adv Clin Practice Skills');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23287, 'PSYO', 'M', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23287, '6304 Clinical Rnds/Case Conf.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23288, 'PSYO', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23288, '6804 Topics in Neuropsychology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23289, 'PSYO', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23289, '7502 Methods of Psycholog. Inq. II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23290, 'PSYO', 'T', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1655', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23290, '8002 Psychology Colloquium II');

###################################################################
###################### Public Administration ######################
###################################################################
INSERT INTO department VALUES ('PUAD','Public Administration');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23298, 'PUAD', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23298, '5131 Public Economics');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23299, 'R', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('2025', '%k%i')), 1, 23298);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23300, 'PUAD', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23300, '5170 Public Sector Human Resources');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23301, 'PUAD', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23301, '5180 Res Methods & Policy Analysis');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23302, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 23301);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23788, 'PUAD', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23788, '5200Y Professional Development Cert1');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23303, 'PUAD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23303, '5250 Strategic Financial Management');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23304, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 23303);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23305, 'PUAD', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23305, '6000 Sr Sem: Ethics, Pub Serv & Gov');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23923, 'PUAD', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23923, '6020 Food Policy & Sustainability');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23306, 'PUAD', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23306, '6150 Info in Pol & Decision-Making');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23789, 'PUAD', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23789, '6200Y Professional Development Cert2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23307, 'PUAD', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23307, '6235 Issues in Applied Economics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23308, 'PUAD', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23308, '6500 Business & Government');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23926, 'PUAD', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23926, '6561 Security-Development Nexus');

#####################################################################
###################### Radiological Technology ######################
#####################################################################
INSERT INTO department VALUES ('RADT','Radiological Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22341, 'RADT', 'TR', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22341, '1020 Skeletal & Systems Radiography');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22342, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22341);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22343, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22341);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22344, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1455', '%k%i')), 1, 22341);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22345, 'RADT', 'TR', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22345, '2010 Imaging Equipment');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22346, 'W', TIME(STR_TO_DATE('1505', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 0, 22345);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22347, 'RADT', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22347, '2020 Adaption Radiography');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22348, 'M', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 0, 22347);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22349, 'F', TIME(STR_TO_DATE('0805', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 0, 22347);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22350, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22347);
        
##########################################################################
###################### Registration Course-Graduate ######################
##########################################################################
INSERT INTO department VALUES ('REGN','Registration Course-Graduate');

###############################################################
###################### Religious Studies ######################
###############################################################
INSERT INTO department VALUES ('RELS','Religious Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22360, 'RELS', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22360, '1202 Gods, Heros & Monsters II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22361, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22360);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22362, 'RELS', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22362, '2002 Christianity');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23947, 'RELS', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23947, '2003 Islam');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22364, 'RELS', 'MW', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1855', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22364, '2052 Cultural Intro to Arab World');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22365, 'RELS', 'M', 
        TIME(STR_TO_DATE('1835', '%k%i')), TIME(STR_TO_DATE('2125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22365, '2420 Witchcraft in Earl Mod Eur');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22366, 'RELS', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22366, '2510 Trauma of Modern S. Asia');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22367, 'RELS', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22367, '2600 Introductory Sanskrit - II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22368, 'RELS', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22368, '3013 Religion and Comtemp Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22369, 'RELS', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22369, '3111 Vishnu & Krishna the Dark Lord');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22370, 'RELS', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22370, '3121 Hist of European Alchemy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22371, 'RELS', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22371, '3201 Scie & Reli: Contemp Persp');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24131, 'RELS', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24131, '3211 Ecology and Religion');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23976, 'RELS', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23976, '3382 Mdvl Phil Arabic-Aquinas');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22372, 'RELS', 'W', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22372, '4451 Medieval Interpreters of Arist');

#################################################################
###################### Respiratory Therapy ######################
#################################################################
INSERT INTO department VALUES ('RSPT','Respiratory Therapy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22378, 'RSPT', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22378, '1020 Resp Clin Assess & Tech');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22379, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 0, 22378);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22380, 'RSPT', 'MT', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22380, '1030 Cardiopulmonary Physiology I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22381, 'RSPT', 'M', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22381, '2020 Appl. of Mech. Ventilation');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22382, 'R', TIME(STR_TO_DATE('0905', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 0, 22381);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22383, 'RSPT', 'T', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22383, '2050 Hlth Practice for Resp Therapy');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22384, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 0, 22383);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22385, 'RSPT', 'M', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22385, '2065 Resp Disease * Therapeutics II');

#############################################################
###################### Russian Studies ######################
#############################################################
INSERT INTO department VALUES ('RUSN','Russian Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22388, 'RUSN', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22388, '1003 Elementary Russian II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22389, 'RUSN', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22389, '1070 Modern Russ Culture & Civil');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22390, 'RUSN', 'MWF', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22390, '2003 Intermediate Russian II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22391, 'RUSN', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22391, '2023 Soviet Russia');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22392, 'RUSN', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22392, '2037 Russian Film II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22393, 'RUSN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22393, '2052 Survey of Rusn. Literature II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22394, 'RUSN', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22394, '3003 Advanced Russian II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24123, 'RUSN', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24123, '4003 Structure Contemp Russ II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22395, 'RUSN', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22395, '4090 Soviet History Seminar');

#####################################################
###################### Science ######################
#####################################################
INSERT INTO department VALUES ('SCIE','Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22397, 'SCIE', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22397, '1111 Writing for the Sciences');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22398, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22399, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22400, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22401, 'R', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22402, 'M', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22403, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22404, 'T', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22405, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22406, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22407, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22408, 'R', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22409, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22411, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22412, 'R', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0925', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22413, 'T', TIME(STR_TO_DATE('0835', '%k%i')),
        TIME(STR_TO_DATE('0925', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22414, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22415, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22416, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22417, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22418, 'R', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22419, 'R', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22420, 'W', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22421, 'R', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22422, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22397);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22423, 'T', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 22397);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22424, 'SCIE', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 9);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22424, '1507 Integrated Science II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22425, 'T', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 22424);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22426, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22424);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23798, 'SCIE', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23798, '2000Y Intr to the History of Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23799, 'W', TIME(STR_TO_DATE('1535', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 23798);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23800, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 23798);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22428, 'SCIE', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22428, '3111 Communicating Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23970, 'SCIE', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23970, '3333 Sci Ed:Intro to Principle/Prac');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23971, 'R', TIME(STR_TO_DATE('1835', '%k%i')),
        TIME(STR_TO_DATE('1925', '%k%i')), 1, 23970);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22429, 'SCIE', 'MW', 
        TIME(STR_TO_DATE('1505', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22429, '4005 Major Capstone Course in Meds');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23931, 'SCIE', 'R', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23931, '4702 Science Innovation II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22432, 'SCIE', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22432, '4850 Geographic Info Scie Res Proj');

#########################################################
###################### Social Work ######################
#########################################################
INSERT INTO department VALUES ('SLWK','Social Work');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23801, 'SLWK', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23801, '2111Y Dev of Cdn Slwk & Soc Welfare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23802, 'SLWK', 'M', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23802, '2111Y Dev of Cdn Slwk & Soc Welfare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23805, 'SLWK', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23805, '2333Y Beginning Social Work Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23806, 'SLWK', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23806, '2333Y Beginning Social Work Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22435, 'SLWK', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22435, '2444 Concept & Prac for Crit. SLWK');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22436, 'SLWK', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22436, '2444 Concept & Prac for Crit. SLWK');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23807, 'SLWK', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23807, '3030Y Theory Found. of SLWK Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23808, 'SLWK', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23808, '3030Y Theory Found. of SLWK Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23811, 'SLWK', 'R', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23811, '3085Y Social Work Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23812, 'SLWK', 'R', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23812, '3085Y Social Work Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22440, 'SLWK', 'W', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22440, '3220 Cross Cult Iss/Soc Wrk Practic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22441, 'SLWK', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('2025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22441, '3220 Cross Cult Iss/Soc Wrk Practic');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22444, 'SLWK', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22444, '3370 Child Welfare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23813, 'SLWK', 'T', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23813, '4010Y Adv. Social Work Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23814, 'SLWK', 'R', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23814, '4010Y Adv. Social Work Practice');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23816, 'SLWK', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 4.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23816, '4033Y Field Practicum & Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23818, 'SLWK', 'M', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 4.5);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23818, '4033Y Field Practicum & Seminar');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23928, 'SLWK', 'T', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23928, '5160 Aboriginl Perspec Servc Dlvry');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20029, 'SLWK', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20029, '6415 SLWK Field Work Class');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20030, 'SLWK', 'T', 
        TIME(STR_TO_DATE('1735', '%k%i')), TIME(STR_TO_DATE('1925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20030, '6415 SLWK Field Work Class');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23825, 'SLWK', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23825, '7001Y Social Work Research');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23318, 'SLWK', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23318, '7400 Integrated Approaches');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22449, 'SLWK', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22449, '7410 Social Work Health');

##########################################################################
###################### Sociol & Social Anthropology ######################
##########################################################################
INSERT INTO department VALUES ('SOSA','Sociol & Social Anthropology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22453, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22453, '1002 People&Culture: Intro to Anth');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22454, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22454, '1003 Introduction to Sociology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22455, 'SOSA', 'TRF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22455, '1500 Globalizations');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22456, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22455);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22457, 'W', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22455);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22458, 'T', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22455);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23828, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23828, '2001Y Ethnography in Global Context');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23829, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23829, '2002Y Thinking & Doing Sociology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22459, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22459, '2005 Intro to African Can. Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22460, 'SOSA', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22460, '2042 Explaining Social Inequality');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22461, 'SOSA', 'M', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22461, '2045 Indian Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22462, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22462, '2052 Contemp Iss in Indig Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22464, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22464, '2503 Health and Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22466, 'SOSA', 'M', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22466, '3013 Religion in Contemp Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22467, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22467, '3016 Colonialism and the Body');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24265, 'SOSA', 'F', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24265, '3052 Indigenous Soc Hlth & Env Iss.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24295, 'SOSA', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24295, '3060 Social Change & Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22468, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22468, '3105 Media and Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24013, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24013, '3145 Gender & Health');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22470, 'SOSA', 'W', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22470, '3180 Special Topics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22471, 'SOSA', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22471, '3181 Contemporary Masculinities');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22472, 'SOSA', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22472, '3225 Culture, Rights and Power');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24210, 'SOSA', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24210, '3281 Youth Crime');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22474, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22474, '3285 Sociology of Law');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22476, 'SOSA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22476, '3403 Qualitative & Field Methods');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22477, 'SOSA', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22477, '3405 Contemporary Social Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23830, 'SOSA', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23830, '4000Y Honours Seminar -  Soc.Anth.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24281, 'SOSA', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24281, '4006 Issues in Critical Health Stud');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22478, 'SOSA', 'T', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22478, '4013 Issues in Soci & Soc Anth');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22479, 'SOSA', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22479, '4014 Special Topics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23831, 'SOSA', 'F', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23831, '4500Y Honours Seminar - Sociology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24282, 'SOSA', 'R', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24282, '5006 Adv Issues Crit Health Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23832, 'SOSA', 'F', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23832, '5200Y Master\'s Sem Soci & Soc Anthr');

###########################################################################
###################### Spanish & Latin American Stud ######################
###########################################################################
INSERT INTO department VALUES ('SPAN','Spanish & Latin American Stud');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22482, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22482, '1021 Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22483, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22483, '1021 Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24246, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24246, '1021 Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22484, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22484, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22485, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22485, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22486, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22486, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22487, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22487, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22488, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22488, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22489, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22489, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22490, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22490, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22491, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22491, '1022 Advanced Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22492, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22492, '1035 Intensive Beginning Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22493, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22493, '2005 Espanol Practico - Nivel Inter');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22494, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22494, '2022 Advanced Intermediate Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22495, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22495, '2022 Advanced Intermediate Spanish');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22496, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22496, '2105 Catalan Language & Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23994, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23994, '2200 Latin American Culture');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24062, 'SPAN', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24062, '3025 Traduccion Ingles-Espanol');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22497, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22497, '3036 Advanced Spanish II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22498, 'SPAN', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22498, '3215 Seminar Spanish American Lit');

########################################################
###################### Statistics ######################
########################################################
INSERT INTO department VALUES ('STAT','Statistics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22514, 'STAT', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22514, '1060 Intro/Stat/Scie & Hlth Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22518, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22519, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22520, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22521, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22522, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22523, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22524, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22525, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22526, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22527, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22528, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22529, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22530, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22531, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22532, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22533, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22534, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22535, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22514);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22536, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22514);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22515, 'STAT', 'MW', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22515, '1060 Intro/Stat/Scie & Hlth Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22518, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22519, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22520, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22521, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22522, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22523, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22524, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22525, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22526, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22527, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22528, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22529, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22530, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22531, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22532, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22533, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22534, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22535, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22515);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22536, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22515);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22516, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22516, '1060 Intro/Stat/Scie & Hlth Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22518, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22519, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22520, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22521, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22522, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22523, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22524, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22525, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22526, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22527, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22528, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22529, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22530, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22531, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22532, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22533, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22534, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22535, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22516);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22536, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22516);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22517, 'STAT', 'TRF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22517, '1060 Intro/Stat/Scie & Hlth Science');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22518, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22519, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22520, 'W', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22521, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22522, 'W', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1855', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22523, 'W', TIME(STR_TO_DATE('1905', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22524, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22525, 'F', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22526, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22527, 'T', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1355', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22528, 'T', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22529, 'F', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22530, 'F', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22531, 'M', TIME(STR_TO_DATE('1105', '%k%i')),
        TIME(STR_TO_DATE('1155', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22532, 'T', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22533, 'M', TIME(STR_TO_DATE('1205', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22534, 'F', TIME(STR_TO_DATE('1035', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22535, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22517);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22536, 'M', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1025', '%k%i')), 1, 22517);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22537, 'STAT', 'TRF', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22537, '2060 Intro Probability & Stats');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22538, 'T', TIME(STR_TO_DATE('1805', '%k%i')),
        TIME(STR_TO_DATE('1955', '%k%i')), 1, 22537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22539, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1625', '%k%i')), 1, 22537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22540, 'T', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22541, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22537);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22542, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22537);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22544, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0925', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22544, '2080 Stat Meth/Data Analysis/Infere');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22546, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 22544);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22545, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22545, '2080 Stat Meth/Data Analysis/Infere');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22546, 'M', TIME(STR_TO_DATE('1735', '%k%i')),
        TIME(STR_TO_DATE('1825', '%k%i')), 1, 22545);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22547, 'STAT', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22547, '2300 Intro Math Modelling');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22548, 'M', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1225', '%k%i')), 1, 22547);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22549, 'M', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22547);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22550, 'STAT', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22550, '2450 Intro Data Mining with R');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22551, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22551, '3350 Design of Experiments');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22553, 'STAT', 'MF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22553, '3460 Intermediate Statistic. Theory');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22554, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22554, '3703 Actuarial Models I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22555, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22555, '3720 Life Contingencies I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22556, 'STAT', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22556, '4390 Time Series Analysis I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22557, 'STAT', 'MF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22557, '4620 Data Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24251, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('1335', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24251, '4703 Actuarial Models II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23327, 'STAT', 'MWF', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23327, '5067 Advanced Statistical Theory II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23328, 'STAT', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23328, '5390 Time Series Analysis I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23329, 'STAT', 'MF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23329, '5620 Data Analysis');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23330, 'STAT', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1225', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23330, '5750 Statistical Data Mining');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23834, 'STAT', 'R', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23834, '7320Y Statistics Seminar');

############################################################
###################### Sustainability ######################
############################################################
INSERT INTO department VALUES ('SUST','Sustainability');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22562, 'SUST', 'MW', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2055', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22562, '1001 A Sustainable Future');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22563, 'R', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22564, 'R', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22565, 'M', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22566, 'R', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22567, 'W', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22568, 'T', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22569, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1255', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22570, 'M', TIME(STR_TO_DATE('1005', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22571, 'R', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 1, 22562);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (24319, 'W', TIME(STR_TO_DATE('1605', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 1, 22562);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22573, 'SUST', 'TR', 
        TIME(STR_TO_DATE('1905', '%k%i')), TIME(STR_TO_DATE('2055', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22573, '2001 Global Environ. Governance');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22574, 'M', TIME(STR_TO_DATE('1335', '%k%i')),
        TIME(STR_TO_DATE('1525', '%k%i')), 1, 22573);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22575, 'W', TIME(STR_TO_DATE('0935', '%k%i')),
        TIME(STR_TO_DATE('1125', '%k%i')), 1, 22573);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22576, 'T', TIME(STR_TO_DATE('1135', '%k%i')),
        TIME(STR_TO_DATE('1325', '%k%i')), 1, 22573);
        
INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (22577, 'W', TIME(STR_TO_DATE('1235', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 1, 22573);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22579, 'SUST', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22579, '3102 Coastal Change & Adaptation');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23943, 'SUST', 'R', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23943, '3103 Effective Argument in Sust.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23899, 'SUST', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23899, '3106 The Canadian North');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22580, 'SUST', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22580, '3502 The Campus as a Living Lab');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24055, 'SUST', 'T', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24055, '3702 Sustainable Industries');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22581, 'SUST', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22581, '3950 Topics in Env. Sust. & Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23835, 'SUST', 'MWF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23835, '4000Y ESS Capstone.');

#####################################################
###################### Theatre ######################
#####################################################
INSERT INTO department VALUES ('THEA','Theatre');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22586, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22586, '1052 Thea Organize&Stagecraft 2');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23837, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23837, '1450Y Intro. to Costume Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23838, 'THEA', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23838, '1800Y Intro to Acting & Performance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23839, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23839, '1800Y Intro to Acting & Performance');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22587, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22587, '2012 Early Modern Theatre');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23840, 'THEA', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23840, '2060Y Technical Theatre I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23841, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23840);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23842, 'THEA', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23842, '2070Y Performance Technology I');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23843, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23842);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22588, 'THEA', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22588, '2215 Young Shakespeare');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22590, 'THEA', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22590, '2229 Tragedy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22591, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22591, '2402 Castle/Cafe: Dress 1450-1700');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23844, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23844, '2406Y Aesthetics of Contemp Dress');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22592, 'THEA', 'F', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22592, '2451 Costume in Performance I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22593, 'THEA', 'T', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22593, '2710 Stage Design I');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23845, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1625', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23845, '2800Y Acting II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23846, 'MW', TIME(STR_TO_DATE('1635', '%k%i')),
        TIME(STR_TO_DATE('1725', '%k%i')), 0, 23845);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23847, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23847, '2810Y Voice & Speech II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23848, 'F', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23847);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23849, 'THEA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23849, '2820Y Dance & Movement II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22594, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22594, '2901 Production Dramaturgy');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23850, 'THEA', 'T', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23850, '3060Y Technical Theatre II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23851, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23850);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23852, 'THEA', 'R', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23852, '3070Y Performance Technology II');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23853, 'R', TIME(STR_TO_DATE('1305', '%k%i')),
        TIME(STR_TO_DATE('1425', '%k%i')), 0, 23852);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22596, 'THEA', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22596, '3403 Bustle/Boardrm: Dress 1870-Now');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22597, 'THEA', 'W', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22597, '3454 Body-Shaping-Hist Tailoring II');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22598, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22598, '3502 Mod Thtr 2: High Modernism');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22599, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22599, '3600Y The Playwright in the Theatre');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23856, 'THEA', 'MWF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23856, '3800Y Acting III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23857, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23857, '3810Y Voice & Speech III');

INSERT INTO labInfo (L_CRN, L_DAYS, L_TIMESTART, L_TIMEEND, L_IS_TUTORIAL,
        C_CRN) VALUES (23858, 'F', TIME(STR_TO_DATE('1435', '%k%i')),
        TIME(STR_TO_DATE('1555', '%k%i')), 0, 23857);
        
INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23859, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23859, '3820Y Dance & Movement III');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23860, 'THEA', 'M', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23860, '4060Y Production Techniques 1');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23861, 'THEA', 'W', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23861, '4070Y Advanced Production Special');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23863, 'THEA', 'T', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23863, '4406Y Aesthetics of Historical Dress');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22601, 'THEA', 'R', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22601, '4450 Costume Technology');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23864, 'THEA', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23864, '4800Y Acting IV');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23865, 'THEA', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23865, '4840Y Adv. Performance Techniques');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22603, 'THEA', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22603, '4923 Topics in Dramatic Literature');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22604, 'THEA', 'F', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1825', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22604, '4924 Sp. Topic in Thtr & Cinema');

#####################################################################
###################### Transition Year Program ######################
#####################################################################
INSERT INTO department VALUES ('TYPR','Transition Year Program');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23868, 'TYPR', 'MF', 
        TIME(STR_TO_DATE('1235', '%k%i')), TIME(STR_TO_DATE('1325', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23868, '0002Y English Language Skills');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23869, 'TYPR', 'M', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23869, '0005Y Strategies-Univ Learning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23870, 'TYPR', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23870, '0008Y Indigenous Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23871, 'TYPR', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23871, '0009Y TYP Black Studies');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23872, 'TYPR', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 0);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23872, '0032Y TYP Math');

############################################################
###################### Vision Science ######################
############################################################
INSERT INTO department VALUES ('VISC','Vision Science');
