package com.team14.cherrybnb.room.domain;

import com.team14.cherrybnb.revervation.domain.Member;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.time.LocalDateTime;

public class Review {

    private int starRating;

    private String comment;

    @CreatedDate
    private LocalDateTime createdAt;

    @ManyToOne
    @JoinColumn
    private Member member;

    @ManyToOne
    @JoinColumn
    private Room room;
}
