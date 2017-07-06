package com.hrsb.cg.controller.manage;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hrsb.cg.dao.UserKeywordMapper;
import com.hrsb.cg.model.Literature;
import com.hrsb.cg.model.Manager;
import com.hrsb.cg.model.UserDetail;
import com.hrsb.cg.model.UserKeyword;
import com.hrsb.cg.service.LiteratureService;
import com.hrsb.cg.util.AjaxUtil;
import com.hrsb.cg.util.Const;
import com.hrsb.cg.util.Page;

@Controller
@RequestMapping(value="manageLiterature")
public class ManageLiteratureController {
	
	@Autowired
	LiteratureService literatureService;
	
	@Autowired
	UserKeywordMapper userKeywordMapper;
	
	@RequestMapping(value="literatureList")
	public ModelAndView literatureList(Integer pageCurrent,Integer pageSize,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("/manage/literature/literature-list");
		String title = request.getParameter("title");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", title);
		Page<Literature> page=new Page<Literature>(null==pageCurrent?1:pageCurrent,null==pageSize?15:pageSize).setParams(params);
		page.setOrderDirection("desc");
		page.setOrderField("download_count");
		List<Literature> Literatures=literatureService.selectByPage(page);
		page.setResults(Literatures);
		mv.addObject("page", page);
		return mv;
	}
	

	/**
	 * 关键字查询
	 * @param pageCurrent
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping(value="keywordList")
	public ModelAndView keywordList(Integer pageCurrent,Integer pageSize,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("/manage/literature/keyword-list");
		
		Page<UserKeyword> page=new Page<UserKeyword>(null==pageCurrent?1:pageCurrent,null==pageSize?15:pageSize);
		page.setOrderField("click_count");
		page.setOrderDirection("desc");
		List<UserKeyword> userKeywords=userKeywordMapper.selectByPage(page);
		page.setResults(userKeywords);
		mv.addObject("page", page);
		return mv;
	}
	
	/**
	 * 关键字编辑页面
	 * @param pageCurrent
	 * @param pageSize
	 * @param request
	 * @return
	 */
	@RequestMapping(value="keywordSaveUI")
	public ModelAndView keywordSaveUI(String keywordId,HttpServletRequest request){
		ModelAndView mv=new ModelAndView("/manage/literature/keyword-edit");
		
		if(StringUtils.isNotEmpty(keywordId)){
		UserKeyword userKeyword=userKeywordMapper.selectByPrimaryKey(Long.parseLong(keywordId));
		mv.addObject("userKeyword", userKeyword);
		}
		return mv;
	}
	
	@RequestMapping(value="/keywordSave")
	public void keywordSave(@ModelAttribute UserKeyword userKeyword,HttpServletRequest request,HttpServletResponse response) throws IOException{
		Manager m=(Manager)request.getSession().getAttribute(Const.SESSION_MANAGER);
			userKeyword.setManagerId(m.getId());
			userKeyword.setOperateTime(new Date());
			int i=0;
			if(userKeyword.getId()==null){
			 i=userKeywordMapper.insertSelective(userKeyword);
			}else{
			 i=userKeywordMapper.updateByPrimaryKeySelective(userKeyword);
			}
				if(i==1){
					new AjaxUtil(request, response).JsonType("200", "保存成功！", "", "keyword", "", "", "保存成功！",true);
				}else{
					new AjaxUtil(request, response).JsonType("300", "保存失败！", "", "keyword", "", "", "保存失败",true);	
				}
	}

	
	@RequestMapping(value="/keywordDel")
	public void keywordDel(@RequestParam(value="keywordId")Long keywordId ,HttpServletRequest request,HttpServletResponse response) throws IOException{
			int i=0;
				i=userKeywordMapper.deleteByPrimaryKey(keywordId);
				if(i==1){
					new AjaxUtil(request, response).JsonType("200", "保存成功！", "", "keyword", "", "", "保存成功！",false);
				}else{
					new AjaxUtil(request, response).JsonType("300", "保存失败！", "", "keyword", "", "", "保存失败",false);	
				}
	}
	
}
