package com.team14.cherrybnb.room.dto;

import com.team14.cherrybnb.auth.domain.Member;
import com.team14.cherrybnb.common.domain.Address;
import com.team14.cherrybnb.room.domain.RoomImage;
import com.team14.cherrybnb.room.domain.RoomInfo;
import com.team14.cherrybnb.room.domain.RoomPriceCondition;

import java.util.List;

public class RoomDetailResponse {

    private List<RoomImage> roomImage;

    private Long roomId;

    private String name;

    private int starRating;

    private int reviewCount;

    private Address address;

    private Member host;

    private RoomInfo roomInfo;

    private String description;

    private RoomPriceCondition roomPriceCondition;

    private boolean checkWish;
}
