INSERT INTO accommodation (accommodation_condition, accommodation_type, basic_fee, description, host_name, latitude, longitude, name, rating, review_count) values
("테스트 조건", "테스트 타입", 10000, "테스트 설명", "테스트 호스트1", 127.0395707, 37.4850493, "테스트 숙소 이름", 5.0, 100),
("테스트 조건", "테스트 타입", 20000, "테스트 설명", "테스트 호스트2", 126.9619196, 37.4783544, "테스트 숙소 이름2", 4.7, 100),
("테스트 조건", "테스트 타입", 20000, "테스트 설명", "테스트 호스트3", 127.0395707, 37.4850493, "테스트 숙소 이름3", 4.5, 100);

INSERT INTO user (username) values
("testuser1"),
("testuser2"),
("testuser3");

INSERT INTO reservation (cancelled, check_in_date, check_out_date, client_count, fee, accommodation_id, user_id) values
(0, "2022-05-26", "2022-05-27", 3, 10000, 1, 1),
(0, "2022-05-20", "2022-05-23", 2, 20000, 1, 2),
(0, "2022-05-27", "2022-05-30", 2, 20000, 2, 3),
(0, "2022-05-22", "2022-05-26", 4, 15000, 3, 3);



