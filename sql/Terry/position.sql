-- ���̺� ����
DROP TABLE "CRUNCH"."POSITION";
CREATE TABLE "CRUNCH"."POSITION"
(	"POSITIONCODE" NUMBER NOT NULL ENABLE,
	"POSITIONNAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ADMIN" CHAR(3 BYTE) DEFAULT 'NO' NOT NULL ENABLE,
	 CONSTRAINT "POSITION_PK" PRIMARY KEY ("POSITIONCODE")
);

-- POSITION CODE SELECT
SELECT * FROM POSITION ORDER BY POSITIONCODE ASC;

-- ������ ���� �� ����
DELETE FROM USERINFO;
DROP SEQUENCE POSITION_POSITIONCODE_SEQ;
CREATE SEQUENCE POSITION_POSITIONCODE_SEQ;

-- POSITION INSERT
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (1, '���', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (2, '����', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (3, '�븮', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (4, '����', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (5, '����', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (6, '����', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (7, '�̻�', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (8, '���̻�', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (9, '�����̻�', 'NO');
INSERT INTO POSITION (POSITIONCODE, POSITIONNAME, ADMIN) VALUES (10, '�Λ���', 'NO');