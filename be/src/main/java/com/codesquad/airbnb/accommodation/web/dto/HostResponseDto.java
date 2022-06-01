package com.codesquad.airbnb.accommodation.web.dto;

import com.codesquad.airbnb.user.domain.User;
import lombok.Getter;

@Getter
public class HostResponseDto {
    private String username;

    public HostResponseDto(User user) {
        this.username = user.getUsername();
    }
}
