package main.com.yourantao.aimeili.bean;

/**
 * TopicGoods entity. @author MyEclipse Persistence Tools
 */

public class TopicGoods implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer topicId;
	private String goodsNote;
	private Goods goods;

	// Constructors

	/** default constructor */
	public TopicGoods() {
	}

	/** full constructor */
	public TopicGoods(Integer topicId, String goodsNote, Goods goods) {
		this.topicId = topicId;
		this.goodsNote = goodsNote;
		this.setGoods(goods);
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getTopicId() {
		return this.topicId;
	}

	public void setTopicId(Integer topicId) {
		this.topicId = topicId;
	}

	public String getGoodsNote() {
		return this.goodsNote;
	}

	public void setGoodsNote(String goodsNote) {
		this.goodsNote = goodsNote;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public Goods getGoods() {
		return goods;
	}

}