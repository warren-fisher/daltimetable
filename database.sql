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
    FOREIGN KEY (C_CRN) REFERENCES classInfo (C_CRN)
);

CREATE TABLE labInfo (
    L_CRN SMALLINT(5) UNIQUE,
    L_DAYS VARCHAR(5),
    L_TIMESTART TIME,
    L_TIMEEND TIME,
    L_SIZE SMALLINT(3),
    L_NUM_REGISTERED SMALLINT(3),
    L_IS_TUTORIAL TINYINT(1),
    C_CRN SMALLINT(5),
    PRIMARY KEY (L_CRN),
    FOREIGN KEY (C_CRN) REFERENCES classInfo (C_CRN)
);


INSERT INTO department VALUES ("CSCI", "Comp sci");

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20639, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20639, '1105 Intro to Computer Programming');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20646, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20646, '1107 Social Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20649, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20649, '1108 Experimental Robotics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20650, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20650, '1108 Experimental Robotics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24141, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24141, '1109 Practical Data Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20656, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20656, '1110 Intro to Computer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20657, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20657, '1110 Intro to Computer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20658, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20658, '1110 Intro to Computer Science');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20669, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1525', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20669, '1120 Intro to Computer Systems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20672, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1535', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20672, '1170 Intro to Web Design & Devel.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20673, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20673, '1170 Intro to Web Design & Devel.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20676, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20676, '1801 Case Studies in Comp & Society');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20677, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20677, '1801 Case Studies in Comp & Society');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24113, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24113, '2134 Software Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20716, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20716, '2141 Intro to Database Systems');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20721, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1355', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20721, '2170 Intro to Server Side Scripting');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20723, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20723, '2201 Introduction to Info Security');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20726, 'CSCI', 'T', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20726, '2202 Comp. Modeling for Scientists');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20734, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20734, '3136 Principles/Programming Languag');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20735, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20735, '3151 Foundations  of Machine Learn.');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20741, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('0835', '%k%i')), TIME(STR_TO_DATE('0955', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20741, '3172 Web-Centric Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20744, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1135', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20744, '3691 Intermediate Project');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20745, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 6);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20745, '3901 Software Development Concepts');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20751, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1605', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20751, '4145 Cloud Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20753, 'CSCI', 'TRF', 
        TIME(STR_TO_DATE('0935', '%k%i')), TIME(STR_TO_DATE('1025', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20753, '4152 Natural Lang Processing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20755, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20755, '4155 Machine Learning');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23875, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23875, '4163 Human-Computer Interaction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20760, 'CSCI', 'MWF', 
        TIME(STR_TO_DATE('1035', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20760, '4174 Network Security');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (20761, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (20761, '4177 Advanced Web Services');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22822, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22822, '5408 Data Mgmt, Warhsng Analytics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22825, 'CSCI', 'MW', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22825, '5409 Adv Topic in Cloud Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24361, 'CSCI', 'R', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1255', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24361, '5601 Designing for UX');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22827, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1635', '%k%i')), TIME(STR_TO_DATE('1755', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22827, '5708 Mobile Computing');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22829, 'CSCI', 'WF', 
        TIME(STR_TO_DATE('1005', '%k%i')), TIME(STR_TO_DATE('1125', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22829, '5709 Adv. Topics in Web Development');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24366, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1555', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24366, '6055 Research Methods & Statistics');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (22831, 'CSCI', 'TR', 
        TIME(STR_TO_DATE('1305', '%k%i')), TIME(STR_TO_DATE('1425', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (22831, '6405 Data Mining & Data Warehousing');

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

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24276, 'CSCI', 'F', 
        TIME(STR_TO_DATE('0905', '%k%i')), TIME(STR_TO_DATE('1155', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24276, '6511 Autonomous Robotics.');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (23877, 'CSCI', 'M', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (23877, '6610 Human Computer Interaction');

INSERT INTO classInfo (C_CRN, D_CODE, C_DAYS, C_TIMESTART, 
        C_TIMEEND, C_CREDIT_HRS) VALUES (24197, 'CSCI', 'W', 
        TIME(STR_TO_DATE('1435', '%k%i')), TIME(STR_TO_DATE('1725', '%k%i')), 3);
INSERT INTO classes (C_CRN, C_NAME) VALUES (24197, '6611 Persuasive Computing Design');

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

SELECT * FROM classes;
SELECT * FROM classInfo;

