INSERT INTO accommodation (max_count_of_client, room_type, count_of_bed, count_of_bathroom, basic_fee, description, host_name, location, name, rating, review_count) values
(2, "레지던스 전체", 1, 1, 10000, "테스트 설명", "테스트 호스트1", ST_GeomFromText('POINT(127.0395707 37.4850493)'), "테스트 숙소 이름", 5.0, 100),
(3, "아파트 전체", 1, 1, 20000, "테스트 설명", "테스트 호스트2", ST_GeomFromText('POINT(126.9619196 37.4783544)'), "테스트 숙소 이름2", 4.7, 100),
(4, "레지던스 전체", 2, 1, 20000, "테스트 설명", "테스트 호스트3", ST_GeomFromText('POINT(127.0395707 37.4850493)'), "테스트 숙소 이름3", 4.5, 100);

INSERT INTO user (username) values
("testuser1"),
("testuser2"),
("testuser3");

INSERT INTO reservation (cancelled, check_in_date, check_out_date, client_count, fee, accommodation_id, user_id) values
(0, "2022-05-26", "2022-05-27", 3, 10000, 1, 1),
(0, "2022-05-20", "2022-05-23", 2, 20000, 1, 2),
(0, "2022-05-27", "2022-05-30", 2, 20000, 2, 3),
(0, "2022-05-22", "2022-05-26", 4, 15000, 3, 3);



