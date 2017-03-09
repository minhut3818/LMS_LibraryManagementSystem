create database Library;
use Library;
create table BOOK(
	isbn float primary key not null,
	title varchar(50) not null,
    publisher_id int not null,
    publishing_year year not null,
    category_id int not null,
    short_description varchar(200),
    brw_tckt_nber int not null,
    valid_status boolean,
    amount int not null,
    importance int(1) not null
);
create table AUTHOR_DETAILS(
	author_id int not null auto_increment primary key,
    author_name varchar(30) not null
);
create table BOOK_AUTHOR(
	author_id int not null,
    isbn float not null,
    constraint pk_author_isbn_book_author primary key (author_id, isbn)
);
create table PUBLISHER_DETAILS(
	publisher_id int not null auto_increment primary key,
    publisher_name varchar(50) not null
);
create table BOOK_CATEGORY_DETAILS(
	category_id int not null primary key auto_increment,
    category_name varchar(30) not null
);
create table TICKET(
	user_id int not null,
    isbn float not null,
    borrowed_date date not null,
    expired_date date not null,
    ticket_id int not null primary key auto_increment,
    borrow_number int not null,
    limition_number int
);
create table STAFF_INFO(
	staff_id int not null primary key auto_increment,
    real_name varchar(30) not null,
    address varchar(30) not null,
    phone_number int(11) not null,
    email varchar(30),
    pword int(20) not null
);
create table ROLE(
	role_id int not null auto_increment primary key,
    role_name varchar(20) not null
);
create table USER_INFO(
	user_id int not null auto_increment primary key,
    real_name varchar(30) not null,
    address varchar(30) not null,
    phone_number int(11) not null,
    email varchar(30) not null,
    pword varchar(20) not null,
    sex boolean not null,
    job varchar(30),
    degree varchar(30)
);
create table USER_ROLE(
	user_id int not null,
    role_id int not null,
    primary key (user_id, role_id)
);
create table RETURN_BOOK(
	user_id int not null,
    isbn float not null,
    borrowed_date date not null,
    expired_date date not null,
    returned_date date not null,
    fine int,
    return_book_id int not null primary key auto_increment
);
create table PAYMENT(
	user_id int not null,
    payment_amount int not null,
    pay_day date not null,
    fine int,
    payment_id int primary key not null auto_increment
);
alter table BOOK 
add constraint category_id_fk_on_book foreign key (category_id) references BOOK_CATEGORY_DETAILS(category_id);
alter table BOOK
add constraint publisher_id_fk_on_book foreign key (publisher_id) references PUBLISHER_DETAILS(publisher_id);
alter table BOOK_AUTHOR
add constraint isbn_fk_on_book_author foreign key (author_id) references AUTHOR_DETAILS(author_id);
alter table BOOK_AUTHOR
add constraint author_id_fk_on_book_author foreign key (isbn) references BOOK(isbn);
alter table TICKET
add constraint user_id_fk_on_ticket foreign key (user_id) references USER_INFO(user_id);
alter table TICKET
add constraint isbn_fk_on_ticket foreign key (isbn) references BOOK(isbn);
alter table RETURN_BOOK
add constraint user_id_fk_on_return foreign key (user_id) references USER_INFO(user_id);
alter table RETURN_BOOK
add constraint isbn_fk_on_return foreign key (isbn) references BOOK(isbn);
alter table PAYMENT
add constraint user_id_fk_on_payment foreign key (user_id) references USER_INFO(user_id);
alter table USER_ROLE
add constraint user_id_fk_on_user_role foreign key (user_id) references USER_INFO(user_id);
alter table USER_ROLE
add constraint role_id_fk_on_user_role foreign key (role_id) references ROLE(role_id);

insert into role (role_name) value ("MEMBER_USER");
insert into role (role_name) value ("ADMIN");
insert into role (role_name) value ("GUEST");

insert into book_category_details(category_name) value ("Magazine");
insert into book_category_details(category_name) value ("Fiction");
insert into book_category_details(category_name) value ("History");
insert into book_category_details(category_name) value ("Science");
insert into book_category_details(category_name) value ("Psychology");
insert into book_category_details(category_name) value ("Economics");
insert into book_category_details(category_name) value ("Politics");
insert into book_category_details(category_name) value ("Manga");
insert into book_category_details(category_name) value ("Magazine");
insert into book_category_details(category_name) value ("Fiction");
insert into book_category_details(category_name) value ("Cookbook");
insert into book_category_details(category_name) value ("Foreign Language");

insert into publisher_details(publisher_name) value ("Van hoc");
insert into publisher_details(publisher_name) value ("Hoi nha van");
insert into publisher_details(publisher_name) value ("Phu nu");
insert into publisher_details(publisher_name) value ("Hong Duc");
insert into publisher_details(publisher_name) value ("Ha Noi");
insert into publisher_details(publisher_name) value ("Tong hop thanh pho Ho Chi Minh");
insert into publisher_details(publisher_name) value ("Thanh nien");
insert into publisher_details(publisher_name) value ("Tre");
insert into publisher_details(publisher_name) value ("Dai hoc Quoc gia thanh pho Ho Chi Minh");
insert into publisher_details(publisher_name) value ("Kim Dong");
insert into publisher_details(publisher_name) value ("The duc the thao");
insert into publisher_details(publisher_name) value ("Phuong Nam Book");
insert into publisher_details(publisher_name) value ("Amak Books");
insert into publisher_details(publisher_name) value ("Quang Van Books");
insert into publisher_details(publisher_name) value ("Thai Ha Books");
insert into publisher_details(publisher_name) value ("IPM");
insert into publisher_details(publisher_name) value ("TABOOK");
insert into publisher_details(publisher_name) value ("Vintage");
insert into publisher_details(publisher_name) value ("International Publishers Co");
insert into publisher_details(publisher_name) value ("Rodale Books");
insert into publisher_details(publisher_name) value ("Smithsonian Books");
insert into publisher_details(publisher_name) value ("Cambridge University Press");
insert into publisher_details(publisher_name) value ("Haole Library");

insert into author_details(author_name) value ("Winston Groom");
insert into author_details(author_name) value ("Dominic Midgley");
insert into author_details(author_name) value ("Chris Hutchins");
insert into author_details(author_name) value ("Cuu Ba Dao");
insert into author_details(author_name) value ("Krishnamurti");
insert into author_details(author_name) value ("Hu Min");
insert into author_details(author_name) value ("John Gordon");
insert into author_details(author_name) value ("Ly A Tan");
insert into author_details(author_name) value ("Ta Chi Dai Tuong");
insert into author_details(author_name) value ("Nguyen Tan Dang");
insert into author_details(author_name) value ("Nguyen Xuan Truong");
insert into author_details(author_name) value ("Tatsuhiko Takimoto");
insert into author_details(author_name) value ("Nomura Mizuki");
insert into author_details(author_name) value ("Yoshiharu Tsuboi");
insert into author_details(author_name) value ("Philippe Devillers");
insert into author_details(author_name) value ("Shinkai Makoto");
insert into author_details(author_name) value ("Natsuki Namiya");
insert into author_details(author_name) value ("Arikawa Hiro");
insert into author_details(author_name) value ("Mikami En");
insert into author_details(author_name) value ("Eita Nakatani");
insert into author_details(author_name) value ("Eto Mori");
insert into author_details(author_name) value ("Dazai Osamu");
insert into author_details(author_name) value ("Tanigawa Nagaru");
insert into author_details(author_name) value ("Riku Misora");
insert into author_details(author_name) value ("Kenji Inoue");
insert into author_details(author_name) value ("Chihaya Akane");
insert into author_details(author_name) value ("Inui Kurumi");
insert into author_details(author_name) value ("Yukito Ayatsuji");
insert into author_details(author_name) value ("Hasekura Isuna");
insert into author_details(author_name) value ("Suzumu");
insert into author_details(author_name) value ("Ichikawa Takuji");
insert into author_details(author_name) value ("Yonejawa Honobu");
insert into author_details(author_name) value ("Iwai Shunji");
insert into author_details(author_name) value ("Reiki Kawahara");
insert into author_details(author_name) value ("Gosho Aoyama");
insert into author_details(author_name) value ("Naoshi Arakawa");
insert into author_details(author_name) value ("Yoshitoki Oima");
insert into author_details(author_name) value ("Krishnamurti");
insert into author_details(author_name) value ("Kouji Seo");
insert into author_details(author_name) value ("Karl Marx");
insert into author_details(author_name) value ("Friedrich Engels");
insert into author_details(author_name) value ("Adolf Hitler");
insert into author_details(author_name) value ("Thug Kitchen LLC");
insert into author_details(author_name) value ("Darren Naish");
insert into author_details(author_name) value ("Brett L. Walker");

select * from book_category_details;
select * from author_details;
select * from publisher_details;

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786045332641, "Schoolgirl",2,2015,2,"Essentially the start of Dazai's career, Schoolgirl gained notoriety for its ironic and inventive use of language",0,true,5,1);
insert into book_author(author_id, isbn) values (22,9786045332641);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786049143132, "5 Centimeters per Second",1,2014,2,"Praise for the animated film by Makoto Shinkai",0,true,5,1);
insert into book_author(author_id, isbn) values (16,9786049143132);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786041092969, "A Silent Voice",8,2016,8,"LEARNING TO LISTEN",0,true,15,1);
insert into book_author(author_id, isbn) values (37,9786041092969);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780307947390, "Forrest Gump",18,2012,2,"The modern classic that inspired the beloved movie starring Tom Hanks",0,true,10,1);
insert into book_author(author_id, isbn) values (1,9780307947390);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780717802418, "The Communist Manifesto",19,2014,7,"The Communist Manifesto, originally titled Manifesto of the Communist Party is a short 1848 book written by the German Marxist political theorists Karl Marx and Friedrich Engels",0,true,30,2);
insert into book_author(author_id, isbn) values (40,9780717802418);
insert into book_author(author_id, isbn) values (41,9780717802418);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781682040218, "Mein Kampf",23,2015,7,"Unabridged edition of Hitlers original book - Four and a Half Years of Struggle against Lies, Stupidity, and Cowardice",0,true,10,3);
insert into book_author(author_id, isbn) values (42,9781682040218);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781623363581, "Thug Kitchen: The Official Cookbook",20,2014,11,"Eat Like You Give a F*ck",0,true,25,1);
insert into book_author(author_id, isbn) values (43,9781623363581);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781588345820, "Dinosaurs: How They Lived and Evolved",8,2016,8,"LEARNING TO LISTEN",0,true,15,1);
insert into book_author(author_id, isbn) values (37,9781588345820);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780521178723, "A Concise History of Japan",21,2015,6,"A Concise History of Japan integrates the pageantry of Japanese history",0,true,12,2);
insert into book_author(author_id, isbn) values (45,9780521178723);
