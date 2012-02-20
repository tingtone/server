package main.com.yourantao.aimeili.bean;

/**
 * TopicGoods entity. @author MyEclipse Persistence Tools
 */

public class TopicGoods implements java.io.Serializable {

	// Fields

	private TopicGoodsId id;

	// Constructors

	/** default constructor */
	public TopicGoods() {
	}

	/** full constructor */
	public TopicGoods(TopicGoodsId id) {
		this.id = id;
	}

	// Property accessors

	public TopicGoodsId getId() {
		return this.id;
	}

	public void setId(TopicGoodsId id) {
		this.id = id;
	}

}