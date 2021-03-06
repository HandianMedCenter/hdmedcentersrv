package com.hrsb.cg.service;

import java.util.List;

import com.hrsb.cg.model.Product;
import com.hrsb.cg.model.ProductComment;
import com.hrsb.cg.model.ProductImage;
import com.hrsb.cg.model.ProductLiterature;
import com.hrsb.cg.model.ProductQuestion;
import com.hrsb.cg.util.Page;

public interface ProductService {

	List<Product> selectByPage(Page<Product> page);

	Product selectById(Long productId);

	int saveProduct(Product product);

	/**
	 * 产品问题的分页
	 * @param page
	 * @return
	 */
	List<ProductQuestion> selectProductQuestionByPage(Page<ProductQuestion> page);

	/**
	 * 问题查询单条
	 * @param questionId
	 * @return
	 */
	ProductQuestion selectByQuestionId(Long questionId);

	/**
	 * 保存问题
	 * @param productQuestion
	 * @return
	 */
	int saveProductQuestion(ProductQuestion productQuestion);

	List<ProductComment> selectProductCommentByPage(Page<ProductComment> page);

	int saveProductComment(ProductComment productComment);

	ProductComment selectByProductCommentId(Long productCommentId);

	/**
	 * 产品文献
	 * @param page
	 * @return
	 */
	List<ProductLiterature> selectProductLiteratureByPage(
			Page<ProductLiterature> page);

	/**
	 * 产品文献 查询单条
	 * @param productLiteratureId
	 * @return
	 */
	ProductLiterature selectByProductLiteratureId(Long productLiteratureId);

	/**
	 * 编辑产品文献
	 * @param productLiterature
	 * @return
	 */
	int saveProductLiterature(ProductLiterature productLiterature);

	List<ProductImage> getImagesByProductId(long productId);

	List<ProductQuestion> getQuestionByProductId(Long productId);

	List<ProductComment> getCommentByProductId(Long productId);

	List<ProductLiterature> getLiteratureByProductId(Long productId, Long userId);
	
	List<ProductLiterature> getLiteratureByProductId(Long productId);//Added by JIANG

	Product getById(long id);

	String download(long id, Long userId, byte types);

	int checkIsDownload(Long literatureId, long userId, byte types);

	String collect(long id, Long id2, byte types);

	int checkIsCollection(Long literatureId, long userId, byte types);

	void modifyProductClickCount(Product product);

	/**
	 * 逻辑删除
	 * @param productId
	 * @return
	 */
	int del(Integer productId);

}
