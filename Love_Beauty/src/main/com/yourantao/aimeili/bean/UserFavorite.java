package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * UserFavorite entity. @author MyEclipse Persistence Tools
 */

public class UserFavorite implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer favoriteId;
	private Integer userId;
	private Short favoriteType;
	private Integer relatedId;
	private Timestamp addTime;

	// Constructors

	/** default constructor */
	public UserFavorite() {
	}

	/** full constructor */
	public UserFavorite(Integer favoriteId, Integer userId, Short favoriteType,
			Integer relatedId, Timestamp addTime) {
		this.favoriteId = favoriteId;
		this.userId = userId;
		this.favoriteType = favoriteType;
		this.relatedId = relatedId;
		this.addTime = addTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

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

}