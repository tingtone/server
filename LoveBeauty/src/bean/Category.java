package bean;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */
public class Category extends AbstractCategory implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String categoryName, String categoryDescription,
			Integer categoryRank) {
		super(categoryName, categoryDescription, categoryRank);
	}

}
