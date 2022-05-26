package team13.kuje.airbnb.controller.model;

import java.util.ArrayList;
import java.util.List;

public class WrapperDto<T> {

	private List<T> data;

	public WrapperDto(List<EventDto> eventDtos) {
		this.data = new ArrayList<>();
	}

	public void add(T param) {
		this.data.add(param);
	}
}
