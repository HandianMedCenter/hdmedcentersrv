package com.hrsb.cg.dao;

import java.util.List;

import com.hrsb.cg.model.ProductLiterature;
import com.hrsb.cg.util.Page;

public interface ProductLiteratureMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ProductLiterature record);

    int insertSelective(ProductLiterature record);

    ProductLiterature selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ProductLiterature record);

    int updateByPrimaryKeyWithBLOBs(ProductLiterature record);

    int updateByPrimaryKey(ProductLiterature record);

	List<ProductLiterature> selectProductLiteratureByPage(
			Page<ProductLiterature> page);

	List<ProductLiterature> selectByProductId(Long productId);
	
}