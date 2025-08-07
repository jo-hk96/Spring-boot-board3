create table board(
BNO number(8) primary key,
TITLE VARCHAR2(240) not null,
content varchar2(4000),
writer varchar2(12),
regdate date default sysdate,
hit number(9) default 0
);


create sequence seq_BNO;

insert into board (bno ,title ,content ,writer) values(seq_BNO.nextval,'새글','방가','아이유');

insert into board (bno ,title ,content ,writer) values(seq_BNO.nextval,'두번째글','잘부탁','레이');

commit;


select * from board;