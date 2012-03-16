package main.com.yourantao.aimeili.bean;

/**
 * Ranking entity. @author MyEclipse Persistence Tools
 */

public class Ranking implements java.io.Serializable {

	// Fields

	private Integer rankingId;
	private String rankingName;
	private Long rankingRank;
	private Integer rankingImageId;

	// Constructors

	/** default constructor */
	public Ranking() {
	}

	/** full constructor */
	public Ranking(String rankingName, Long rankingRank, Integer rankingImageId) {
		this.rankingName = rankingName;
		this.rankingRank = rankingRank;
		this.rankingImageId = rankingImageId;
	}

	// Property accessors

	public Integer getRankingId() {
		return this.rankingId;
	}

	public void setRankingId(Integer rankingId) {
		this.rankingId = rankingId;
	}

	public String getRankingName() {
		return this.rankingName;
	}

	public void setRankingName(String rankingName) {
		this.rankingName = rankingName;
	}

	public Long getRankingRank() {
		return this.rankingRank;
	}

	public void setRankingRank(Long rankingRank) {
		this.rankingRank = rankingRank;
	}

	public Integer getRankingImageId() {
		return this.rankingImageId;
	}

	public void setRankingImageId(Integer rankingImageId) {
		this.rankingImageId = rankingImageId;
	}

}