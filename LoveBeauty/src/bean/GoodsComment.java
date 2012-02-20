package bean;

import java.sql.Timestamp;

/**
 * GoodsComment entity. @author MyEclipse Persistence Tools
 */
public class GoodsComment extends AbstractGoodsComment implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public GoodsComment() {
	}

	/** full constructor */
	public GoodsComment(Integer goodsId, String commentator,
			String commentContent, Short commentLevel, Integer commentRank,
			Timestamp addTime) {
		super(goodsId, commentator, commentContent, commentLevel, commentRank,
				addTime);
	}

}
