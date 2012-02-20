package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * UserFavoriteId entity. @author MyEclipse Persistence Tools
 */

public class UserFavoriteId implements java.io.Serializable {

	// Fields

	private Integer favoriteId;
	private Integer userId;
	private Short favoriteType;
	private Integer relatedId;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public UserFavoriteId() {
	}

	/** full constructor */
	public UserFavoriteId(Integer favoriteId, Integer userId,
			Short favoriteType, Integer relatedId, Timestamp addTime) {
		this.favoriteId = favoriteId;
		this.userId = userId;
		this.favoriteType = favoriteType;
		this.relatedId = relatedId;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getFavoriteId() {
		return this.favoriteId;
	}

	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Short getFavoriteType() {
		return this.favoriteType;
	}

	public void setFavoriteType(Short favoriteType) {
		this.favoriteType = favoriteType;
	}

	public Integer getRelatedId() {
		return this.relatedId;
	}

	public void setRelatedId(Integer relatedId) {
		this.relatedId = relatedId;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof UserFavoriteId))
			return false;
		UserFavoriteId castOther = (UserFavoriteId) other;

		return ((this.getFavoriteId() == castOther.getFavoriteId()) || (this
				.getFavoriteId() != null
				&& castOther.getFavoriteId() != null && this.getFavoriteId()
				.equals(castOther.getFavoriteId())))
				&& ((this.getUserId() == castOther.getUserId()) || (this
						.getUserId() != null
						&& castOther.getUserId() != null && this.getUserId()
						.equals(castOther.getUserId())))
				&& ((this.getFavoriteType() == castOther.getFavoriteType()) || (this
						.getFavoriteType() != null
						&& castOther.getFavoriteType() != null && this
						.getFavoriteType().equals(castOther.getFavoriteType())))
				&& ((this.getRelatedId() == castOther.getRelatedId()) || (this
						.getRelatedId() != null
						&& castOther.getRelatedId() != null && this
						.getRelatedId().equals(castOther.getRelatedId())))
				&& ((this.getAddTime() == castOther.getAddTime()) || (this
						.getAddTime() != null
						&& castOther.getAddTime() != null && this.getAddTime()
						.equals(castOther.getAddTime())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getFavoriteId() == null ? 0 : this.getFavoriteId()
						.hashCode());
		result = 37 * result
				+ (getUserId() == null ? 0 : this.getUserId().hashCode());
		result = 37
				* result
				+ (getFavoriteType() == null ? 0 : this.getFavoriteType()
						.hashCode());
		result = 37 * result
				+ (getRelatedId() == null ? 0 : this.getRelatedId().hashCode());
		result = 37 * result
				+ (getAddTime() == null ? 0 : this.getAddTime().hashCode());
		return result;
	}

}