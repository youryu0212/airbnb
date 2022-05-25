package kr.codesquad.airbnb.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Embeddable;

@Embeddable
@Getter
@Setter
public class Guest {

    private Integer adults;
    private Integer children;
    private Integer infants;
}
