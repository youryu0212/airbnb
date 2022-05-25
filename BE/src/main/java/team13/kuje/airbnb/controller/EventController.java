package team13.kuje.airbnb.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import team13.kuje.airbnb.controller.model.EventDto;
import team13.kuje.airbnb.controller.model.WrapperDto;
import team13.kuje.airbnb.service.EventService;

@RestController
@RequestMapping("/api/events")
@RequiredArgsConstructor
public class EventController {

	private final EventService eventService;

	@GetMapping
	public WrapperDto<EventDto> findByCategoryTag(@RequestParam("category_tag") String tag) {
		List<EventDto> eventDtos = eventService.findByCategoryTag(tag);
//		List<EventDto> eventDtos = eventService.findByCategoryTag2(tag);
		return new WrapperDto<>(eventDtos);
	}

}
