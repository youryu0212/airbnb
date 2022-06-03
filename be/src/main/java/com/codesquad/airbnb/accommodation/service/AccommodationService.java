package com.codesquad.airbnb.accommodation.service;

import com.codesquad.airbnb.accommodation.domain.Accommodation;
import com.codesquad.airbnb.accommodation.domain.AccommodationRepository;
import com.codesquad.airbnb.accommodation.web.dto.AccommodationResponseDto;
import com.codesquad.airbnb.accommodation.web.dto.BasicSearchCondition;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class AccommodationService {

    private final AccommodationRepository accommodationRepository;

    public List<AccommodationResponseDto> findByBasicSearch(BasicSearchCondition basicSearchCondition) {
        List<Accommodation> accommodations = accommodationRepository.findAllByBasicCondition(basicSearchCondition);

        return accommodations.stream()
                .map(AccommodationResponseDto::new)
                .collect(Collectors.toList());
    }
}
