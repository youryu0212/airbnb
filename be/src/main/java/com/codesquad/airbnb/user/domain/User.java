package com.codesquad.airbnb.user.domain;

import com.codesquad.airbnb.common.BaseTime;
import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import static javax.persistence.GenerationType.IDENTITY;

@Getter
@Entity
public class User extends BaseTime {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long id;

    private String username;
}
