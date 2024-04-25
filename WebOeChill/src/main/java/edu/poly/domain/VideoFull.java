package edu.poly.domain;

import java.sql.Time;
import java.util.Date;

import edu.poly.model.Video;

public class VideoFull extends Video {
	private String videoId;
	private boolean active;
	private String description;
	private Date duration;
	private String genre;
	private String poster;
	private String title;
	private String videoLink;
	private int views;
	private boolean liked;
	private boolean rated;
	private long reviewCount;
	private int topPosition;

	public VideoFull(String videoId, boolean active, String description, Date duration, String genre, String poster,
			String title, String videoLink, int views, boolean liked, boolean rated, long reviewCount, int topPosition) {
		this.videoId = videoId;
		this.active = active;
		this.description = description;
		this.duration = duration;
		this.genre = genre;
		this.poster = poster;
		this.title = title;
		this.videoLink = videoLink;
		this.views = views;
		this.liked = liked;
		this.rated = rated;
		this.reviewCount = reviewCount;
		this.topPosition = topPosition;
	}

	public VideoFull() {
		
	}

	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Time getDuration() {
		return (Time) duration;
	}

	public void setDuration(Date duration) {
		this.duration = duration;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getVideoLink() {
		return videoLink;
	}

	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public boolean isLiked() {
		return liked;
	}

	public void setLiked(boolean liked) {
		this.liked = liked;
	}

	public boolean isRated() {
		return rated;
	}

	public void setRated(boolean rated) {
		this.rated = rated;
	}

	public int getTopPosition() {
		return topPosition;
	}

	public void setTopPosition(int topPosition) {
		this.topPosition = topPosition;
	}

	public long getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(long reviewCount) {
		this.reviewCount = reviewCount;
	}

}
