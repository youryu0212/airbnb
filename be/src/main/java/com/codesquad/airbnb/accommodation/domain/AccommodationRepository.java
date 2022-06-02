package com.codesquad.airbnb.accommodation.domain;

import com.codesquad.airbnb.accommodation.web.dto.BasicSearchCondition;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.util.List;

@RequiredArgsConstructor
@Repository
public class AccommodationRepository {

    private final EntityManager em;

    public List<Accommodation> findAllByBasicCondition(BasicSearchCondition basicSearchCondition) {

        LocalDate checkInDate = basicSearchCondition.getCheckInDate();
        LocalDate checkOutDate = basicSearchCondition.getCheckOutDate();
        int minPrice = basicSearchCondition.getMinPrice();
        int maxPrice = basicSearchCondition.getMaxPrice();
        int countOfGuest = basicSearchCondition.getCountOfGuest();

        /**
         * 현재 클라이언트가 체크아웃하려는 날짜에 체크인하는 예약이 있더라도 예약이 가능하다.
         * 현재 클라이언트가 체크인하려는 날짜에 체크아웃하는 예약이 있더라도 예약이 가능하다.
         */
        return em.createQuery("SELECT a FROM Accommodation a " +
                        "WHERE a.basicFee >= :minPrice AND a.basicFee <= :maxPrice " +
                        "AND a.accommodationCondition.maxCountOfGuest >= :countOfGuest " +
                        "AND a.id NOT IN (SELECT r.accommodation FROM Reservation r " +
                        "WHERE r.cancelled = false " +
                        "AND ((r.checkInDate >= :checkInDate AND r.checkInDate < :checkOutDate) " +
                        "OR (r.checkOutDate > :checkInDate AND r.checkOutDate <= :checkOutDate) " +
                        "OR (r.checkInDate <= :checkInDate AND r.checkOutDate >= :checkOutDate)))",
                        Accommodation.class)
                .setParameter("checkInDate", checkInDate)
                .setParameter("checkOutDate", checkOutDate)
                .setParameter("minPrice", minPrice)
                .setParameter("maxPrice", maxPrice)
                .setParameter("countOfGuest", countOfGuest)
                .getResultList();
    }
}
