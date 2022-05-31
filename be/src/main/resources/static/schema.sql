drop table if exists wish_list;

drop table if exists reservation;

drop table if exists accommodation;

drop table if exists user;

create table accommodation (
       id bigint not null auto_increment,
        created_date datetime,
        modified_date datetime,
        air_conditioner bit,
        count_of_bathroom integer not null,
        count_of_bed integer not null,
        hair_dryer bit,
        kitchen bit,
        max_count_of_client integer not null,
        room_type varchar(255),
        wireless_internet bit,
        basic_fee integer not null,
        description varchar(255),
        host_name varchar(255) not null,
        location point not null,
        name varchar(255) not null,
        rating double precision not null,
        review_count integer not null,
        primary key (id)
    ) engine=InnoDB

create table reservation (
       id bigint not null auto_increment,
        created_date datetime(6),
        modified_date datetime(6),
        cancelled BOOLEAN not null,
        check_in_date date not null,
        check_out_date date not null,
        client_count integer not null,
        fee integer not null,
        accommodation_id bigint not null,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

create table user (
       id bigint not null auto_increment,
        created_date datetime(6),
        modified_date datetime(6),
        username varchar(255),
        primary key (id)
    ) engine=InnoDB;

create table wish_list (
       id bigint not null auto_increment,
        created_date datetime(6),
        modified_date datetime(6),
        accommodation_id bigint not null,
        user_id bigint not null,
        primary key (id)
    ) engine=InnoDB;

alter table reservation
       add constraint FKoa1arn2i6kipar0jakkwtsjip
       foreign key (accommodation_id)
       references accommodation (id);

alter table reservation
       add constraint FKm4oimk0l1757o9pwavorj6ljg
       foreign key (user_id)
       references user (id);

alter table wish_list
       add constraint FK1mf2d4a0ofkf89uoqqr4xqfyv
       foreign key (accommodation_id)
       references accommodation (id);

alter table wish_list
       add constraint FK8462y9kc76hpxuom1ui7dvp7k
       foreign key (user_id)
       references user (id);
