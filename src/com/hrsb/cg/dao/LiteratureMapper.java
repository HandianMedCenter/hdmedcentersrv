package com.hrsb.cg.dao;

import java.util.List;

import com.hrsb.cg.model.Literature;
import com.hrsb.cg.util.Page;

public interface LiteratureMapper {
    int deleteByPrimaryKey(Long id);

    int insertSelective(Literature record);

    Literature selectByPrimaryKey(Long id);

	List<Literature> selectByPage(Page<Literature> page);

	void updateDownloadCount(Literature literature2);

	Literature selectByArticleId(String articleId);

	void updateClickCount(Literature literature2);
	
}