package kr.codesquad.airbnb.domain;

import lombok.Getter;

import javax.persistence.Embeddable;

@Embeddable
@Getter
public class Guest {

    private Integer adults;
    private Integer children;
    private Integer infants;
}
