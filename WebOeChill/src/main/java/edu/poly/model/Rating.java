package edu.poly.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the Ratings database table.
 * 
 */
@Entity
@Table(name="Ratings", uniqueConstraints = { @UniqueConstraint(columnNames = { "username", "videoID" }) })
@NamedQuery(name="Rating.findAll", query="SELECT r FROM Rating r")
public class Rating implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="RatingId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ratingId;

	@Column(name="RatedDate")
	private Timestamp ratedDate;

	@Column(name="Rating")
	private int rating;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Username")
	private User user;

	//bi-directional many-to-one association to Video
	@ManyToOne
	@JoinColumn(name="VideoId")
	private Video video;

	public Rating() {
	}

	public int getRatingId() {
		return this.ratingId;
	}

	public void setRatingId(int ratingId) {
		this.ratingId = ratingId;
	}

	public Timestamp getRatedDate() {
		return this.ratedDate;
	}

	public void setRatedDate(Timestamp ratedDate) {
		this.ratedDate = ratedDate;
	}

	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}

}