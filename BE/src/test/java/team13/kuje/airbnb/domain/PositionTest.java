package team13.kuje.airbnb.domain;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

@DisplayName("PositionTest 클래스")
class PositionTest {

	@Nested
	@DisplayName("생성자")
	class Describe_constructor {

	    @Nested
	    @DisplayName("만약 정상적인 위경도가 주어진다면")
	    class Context_with_normal_lat_lng {

	        @Test
	        @DisplayName("위경도를 가지고 있는 객체를 반환한다")
	        void It_return_object() {
				Position position = new Position("36.12341234", "127.12341234");

				assertThat(position.getLat().toString()).isEqualTo("36.12341234");
				assertThat(position.getLng().toString()).isEqualTo("127.12341234");
			}
	    }

		@Nested
		@DisplayName("만약 위경도가 주어지지 않는다면")
		class Context_with_empty_lat_lng {

			@Test
			@DisplayName("서울 시청 위경도를 가지고 있는 객체를 반환한다")
			void It_return_object() {
				Position position = new Position(null, null);

				assertThat(position.getLat().toString()).isEqualTo("37.5666805");
				assertThat(position.getLng().toString()).isEqualTo("126.9784147");
			}
		}

		@Nested
		@DisplayName("만약 유효하지 않은 위경도가 주어진다면")
		class Context_with_invalid_lat_lng {

			@Test
			@DisplayName("예외를 발생시킨다.")
			void It_throw_Exception1() {
				assertThatThrownBy(() -> new Position("37.abcd", "error"))
					.isInstanceOf(IllegalArgumentException.class);
			}

			@Test
			@DisplayName("예외를 발생시킨다.")
			void It_throw_Exception2() {
				assertThatThrownBy(() -> new Position("-120.123", "300"))
					.isInstanceOf(IllegalArgumentException.class);
			}
		}

	}
}
