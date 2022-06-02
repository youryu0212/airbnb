package com.codesquad.airbnb.integration;

import com.codesquad.airbnb.accommodation.domain.AccommodationRepository;
import io.restassured.RestAssured;
import io.restassured.response.ExtractableResponse;
import io.restassured.response.Response;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static io.restassured.RestAssured.given;
import static org.assertj.core.api.Assertions.assertThat;

@Sql("/testData.sql")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Transactional
class SearchTest {

    @LocalServerPort
    private int port;

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private AccommodationRepository accommodationRepository;

    @BeforeEach
    void setUp() {
        RestAssured.port = port;
    }

    @Test
    void basicSearchTest() {
        ExtractableResponse<Response> response = sendBasicSearchRequest(
                "2022-05-20",
                "2022-05-27",
                "10000",
                "30000",
                "2")
                .then()
                .statusCode(200)
                .log().all()
                .extract();


        ExtractableResponse<Response> response2 = sendBasicSearchRequest(
                "2022-05-23",
                "2022-05-25",
                "10000",
                "20000",
                "2")
                .then()
                .statusCode(200)
                .log().all()
                .extract();

        ExtractableResponse<Response> response3 = sendBasicSearchRequest(
                "2022-05-19",
                "2022-05-31",
                "10000",
                "15000",
                "3")
                .then()
                .statusCode(200)
                .log().all()
                .extract();

        ExtractableResponse<Response> response4 = sendBasicSearchRequest(
                "2022-05-23",
                "2022-05-25",
                "10000",
                "20000",
                "4")
                .then()
                .statusCode(200)
                .log().all()
                .extract();

        assertThat(response.body().as(List.class)).hasSize(1);
        assertThat(response2.body().as(List.class)).hasSize(2);
        assertThat(response3.body().as(List.class)).isEmpty();
        assertThat(response4.body().as(List.class)).isEmpty();
    }

    private Response sendBasicSearchRequest(String checkInDate, String checkOutDate, String minPrice, String maxPrice, String countOfGuest) {
        return given()
                .accept(MediaType.APPLICATION_JSON_VALUE)
                .param("checkInDate", checkInDate)
                .param("checkOutDate", checkOutDate)
                .param("minPrice", minPrice)
                .param("maxPrice", maxPrice)
                .param("countOfGuest", countOfGuest)
                .when()
                .get("/accommodations");
    }
}
