package bean;

/**
 * AbstractTopicGoodsId entity provides the base persistence definition of the
 * TopicGoodsId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTopicGoodsId implements java.io.Serializable {

	// Fields

	private Integer topicId;
	private Integer goodsId;
	private String goodsNote;

	// Constructors

	/** default constructor */
	public AbstractTopicGoodsId() {
	}

	/** full constructor */
	public AbstractTopicGoodsId(Integer topicId, Integer goodsId,
			String goodsNote) {
		this.topicId = topicId;
		this.goodsId = goodsId;
		this.goodsNote = goodsNote;
	}

	// Property accessors

	public Integer getTopicId() {
		return this.topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsNote() {
		return this.goodsNote;
	}

	public void setGoodsNote(String goodsNote) {
		this.goodsNote = goodsNote;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractTopicGoodsId))
			return false;
		AbstractTopicGoodsId castOther = (AbstractTopicGoodsId) other;

		return ((this.getTopicId() == castOther.getTopicId()) || (this
				.getTopicId() != null
				&& castOther.getTopicId() != null && this.getTopicId().equals(
				castOther.getTopicId())))
				&& ((this.getGoodsId() == castOther.getGoodsId()) || (this
						.getGoodsId() != null
						&& castOther.getGoodsId() != null && this.getGoodsId()
						.equals(castOther.getGoodsId())))
				&& ((this.getGoodsNote() == castOther.getGoodsNote()) || (this
						.getGoodsNote() != null
						&& castOther.getGoodsNote() != null && this
						.getGoodsNote().equals(castOther.getGoodsNote())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTopicId() == null ? 0 : this.getTopicId().hashCode());
		result = 37 * result
				+ (getGoodsId() == null ? 0 : this.getGoodsId().hashCode());
		result = 37 * result
				+ (getGoodsNote() == null ? 0 : this.getGoodsNote().hashCode());
		return result;
	}

}