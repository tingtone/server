package main.com.yourantao.aimeili.action;

import java.util.List;

import main.com.yourantao.aimeili.bean.Category;
import main.com.yourantao.aimeili.bean.CategoryDAO;
import main.com.yourantao.aimeili.conf.Constant;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("serial")
public class CategoryAction extends BaseAction implements CategoryInterface,Constant{
	
	private static final Logger log = LoggerFactory.getLogger(CategoryAction.class);
	private CategoryDAO categoryDAO;
	
	/**
	 * 通过分类下子分类
	 */
	@Override
	public String getSubCategories(){
		Integer categoryId = getIntegerParameter(CATEGORY_ID);
		if (categoryId == null)
			return null;

		List<Category> categories = categoryDAO.findByParentCatid(categoryId);

		for (Category category : categories) {
		}
		printArray(categories);

		return null;
	}

	@Override
	public String insertCategory() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public String updateCateroty() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public CategoryDAO getCategoryDAO() {
		return categoryDAO;
	}
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}

}
