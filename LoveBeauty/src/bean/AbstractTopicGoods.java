package bean;

/**
 * AbstractTopicGoods entity provides the base persistence definition of the
 * TopicGoods entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTopicGoods implements java.io.Serializable {

	// Fields

	private TopicGoodsId id;

	// Constructors

	/** default constructor */
	public AbstractTopicGoods() {
	}

	/** full constructor */
	public AbstractTopicGoods(TopicGoodsId id) {
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