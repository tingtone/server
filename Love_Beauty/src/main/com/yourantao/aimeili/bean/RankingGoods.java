package main.com.yourantao.aimeili.bean;

import java.sql.Timestamp;

/**
 * RankingGoods entity. @author MyEclipse Persistence Tools
 */

public class RankingGoods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer rankingId;
	private Goods goods;
	private Timestamp addTime;
	private Long goodsRank;

	// Constructors

	/** default constructor */
	public RankingGoods() {
	}

	/** full constructor */
	public RankingGoods(Integer rankingId, Goods goods, Timestamp addTime,
			Long goodsRank) {
		this.rankingId = rankingId;
		this.setGoods(goods);
		this.addTime = addTime;
		this.goodsRank = goodsRank;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRankingId() {
		return this.rankingId;
	}

	public void setRankingId(Integer rankingId) {
		this.rankingId = rankingId;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Goods getGoods() {
		return goods;
	}

	public Timestamp getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

	public Long getGoodsRank() {
		return this.goodsRank;
	}

	public void setGoodsRank(Long goodsRank) {
		this.goodsRank = goodsRank;
	}

}