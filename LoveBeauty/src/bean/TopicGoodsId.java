package bean;

/**
 * TopicGoodsId entity. @author MyEclipse Persistence Tools
 */
public class TopicGoodsId extends AbstractTopicGoodsId implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public TopicGoodsId() {
	}

	/** full constructor */
	public TopicGoodsId(Integer topicId, Integer goodsId, String goodsNote) {
		super(topicId, goodsId, goodsNote);
	}

}
