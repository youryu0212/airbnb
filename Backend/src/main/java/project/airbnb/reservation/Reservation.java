package project.airbnb.reservation;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import project.airbnb.bnb.Bnb;

@Entity
public class Reservation {

	@Id @GeneratedValue
	@Column(name = "reservation_id")
	private Long id;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bnb_id")
	private Bnb bnb;
}
