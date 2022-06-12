create table accommodation (
    id bigint not null auto_increment,
    created_date datetime,
    modified_date datetime,
    air_conditioner Boolean,
    count_of_bathroom integer not null,
    count_of_bed integer not null,
    hair_dryer Boolean,
    kitchen Boolean,
    max_count_of_guest integer not null,
    room_type varchar(255),
    wireless_internet Boolean,
    basic_fee integer not null,
    cleaning_fee integer not null,
    description varchar(255),
    city varchar(255),
    country varchar(255),
    region varchar(255),
    location point not null,
    name varchar(255) not null,
    rating double precision not null,
    review_count integer not null,
    discount_policy_id bigint,
    host_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table discount_policy (
    id bigint not null auto_increment,
    monthly_discount_rate double precision not null,
    weekly_discount_rate double precision not null,
    yearly_discount_rate double precision not null,
    primary key (id)
) engine=InnoDB;

create table image (
    id bigint not null auto_increment,
    image_link varchar(255),
    image_order integer not null,
    accommodation_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table reservation (
    id bigint not null auto_increment,
    created_date datetime,
    modified_date datetime,
    cancelled BOOLEAN not null,
    check_in_date date not null,
    check_out_date date not null,
    count_of_guest integer not null,
    fee integer not null,
    accommodation_id bigint not null,
    user_id bigint not null,
    primary key (id)
) engine=InnoDB;

create table user (
       id bigint not null auto_increment,
        created_date datetime,
        modified_date datetime,
        email varchar(255),
        oauth_id varchar(255),
        token varchar(255),
        username varchar(255),
        primary key (id)
    ) engine=InnoDB;

create table wish_list (
    id bigint not null auto_increment,
    created_date datetime,
    modified_date datetime,
    accommodation_id bigint not null,
    user_id bigint not null,
    primary key (id)
) engine=InnoDB;


alter table accommodation
add constraint FKtn616ty4ayfbxrkdo5614btyd
foreign key (discount_policy_id)
references discount_policy (id);


alter table accommodation
add constraint FKe88v1drpsugksp4x17pf5ejgl
foreign key (host_id)
references user (id);


alter table image
add constraint FKg5abixlfdp3f6fn9ag5kqigjo
foreign key (accommodation_id)
references accommodation (id);


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
