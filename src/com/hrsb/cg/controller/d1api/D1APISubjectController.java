package com.hrsb.cg.controller.d1api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;
import com.hrsb.cg.model.Subject;
import com.hrsb.cg.model.SubjectQuestion;
import com.hrsb.cg.model.SubjectQuestionOption;
import com.hrsb.cg.model.SubjectResult;
import com.hrsb.cg.util.JsonUtil;
import com.hrsb.cg.util.Page;

/**
 * 健康自测控制类
 * 
 * @author app001
 * 
 */
@Controller
@RequestMapping(value = "/d1api/subject")
public class D1APISubjectController extends D1APIController {

	/**
	 * 健康自测列表
	 * 
	 * @param modelMap
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "/list.json")
	@ResponseBody
	public Map<String, Object> list(
			@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(defaultValue = "6") int pageSize) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			Page<Subject> page = new Page<Subject>(pageNo, pageSize);
			List<Subject> subjects = subjectService.getByPage(page);
			page.setResults(subjects);
			ModelMap modelMap = new ModelMap();
			modelMap.put("page", page);
			
			mymap.put("success", "1");
			mymap.put("data", modelMap);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 测试题
	 * 
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/detail.json")
	@ResponseBody
	public Map<String, Object> getDetai(@RequestParam long id) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		ModelMap modelMap = new ModelMap();

		try {
			Subject subject = subjectService.getById(id);
			// types==1、2的时候需要测试题有选项
			if (null != subject) {
				List<SubjectQuestion> subjectQuestions = subjectService
						.getQuestionBySubject(subject);
				modelMap.put("subjectQuestions", subjectQuestions);
			}

			modelMap.put("subject", subject);
			mymap.put("success", "1");
			mymap.put("data", modelMap);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 测试结果
	 * 
	 * @param subjectId
	 * @param optionId
	 * @param choice
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/result.json")
	@ResponseBody
	public Map<String, Object> result(@RequestBody String data) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		System.out.println("Here it is the login POST data: " + data);
		
		try {
			JsonParser parse = new JsonParser(); // 创建json解析器
			JsonObject json = (JsonObject) parse.parse(data); // 创建jsonObject对象
			JsonObject jsubject = json.get("subject").getAsJsonObject();
			JsonArray jsubjectAnswers = json.get("subjectAnswers")
					.getAsJsonArray();
			System.out.println("subject:" + jsubject);
			System.out.println("subjectAnswers:" + jsubjectAnswers);

			String title = jsubject.get("title").getAsString();
			String iId = jsubject.get("id").getAsString();//测试题的序号
			System.out.println("title:" + title);

			//long[] optionId = new long[jsubjectAnswers.size()];//Assume that the question number will not exceed 20.
			Vector<Long> optionId = new Vector<Long>();
			
			for (int i = 0; i < jsubjectAnswers.size(); i++) {
				JsonObject ansObj = jsubjectAnswers.get(i).getAsJsonObject();
				String question = ansObj.get("question").getAsString();
				JsonArray questionOpt = ansObj.get("subjectQuestionOptions")
						.getAsJsonArray();
				JsonObject questionDetail = questionOpt.get(0)
						.getAsJsonObject();
				Long id = questionDetail.get("id").getAsLong();
				//optionId[i] = id;
				optionId.add(id);//回答选项的序号
				String answer = questionDetail.get("optionName").getAsString();
				Integer score = questionDetail.get("optionScore").getAsInt();

				System.out.println("Question: " + question);
				System.out.println("Answer: " + answer + ", score: " + score);
			}

			// start calculation
			
			ModelMap modelMap = new ModelMap();

			long subjectId = Long.parseLong(iId);
			Subject subject = subjectService.getById(subjectId);

			if (null != subject) {
				// 计算总分
				int total = 0;
				// 平均分
				int score = 0;
				SubjectResult subjectResult = null;
				// 1原始8分2原始7分3累积分4是否5一题一答
				if (subject.getTypes() == 1 || subject.getTypes() == 2) {
					for (int i = 0; i < optionId.size(); i++) {
						SubjectQuestionOption subjectQuestionOption = subjectQuestionOptionMapper
								.selectByPrimaryKey((Long)(optionId.elementAt(i)));
						total += subjectQuestionOption.getOptionScore();
					}
					// 1原始8分2原始7分3累积分4是否5一题一答
					if (subject.getTypes() == 1) {
						Double scores = (total - 8.0) / (8 * 4) * 100;
						score = scores.intValue();
					}

					if (subject.getTypes() == 2) {
						Double scores = (total - 7.0) / (7 * 4) * 100;
						score = scores.intValue();
					}
					System.out.println(score
							+ "-----------------------------------");
					subjectResult = subjectResultMapper
							.selectBySubjectIdBetweenScore(subjectId, score);

				}

				if (subject.getTypes() == 3) {
					for (int i = 0; i < optionId.size(); i++) {
						if ((Long)(optionId.elementAt(i)) != 0) {
							SubjectQuestion subjectQuestion = subjectQuestionMapper
									.selectByPrimaryKey((Long)(optionId.elementAt(i)));
							total += subjectQuestion.getScore();
						}
					}

					subjectResult = subjectResultMapper
							.selectBySubjectIdBetweenScore(subjectId, total);

				}

				if (subject.getTypes() == 4) {
					for (int i = 0; i < optionId.size(); i++) {
						if ((Long)(optionId.elementAt(i)) == 1) {
							score = 1;
							break;
						}
					}

					if (score == 0) {
						subjectResult = subjectResultMapper
								.selectBySubjectIdAndIsCorrect(subjectId, 0);
					} else {
						subjectResult = subjectResultMapper
								.selectBySubjectIdAndIsCorrect(subjectId, 1);
					}
				}

				if (subject.getTypes() == 5) {
					subjectResult = subjectResultMapper
							.selectBySubjectIdAndQuestionId(subjectId,
									(Long)(optionId.elementAt(0)));
				}

				modelMap.put("subjectResult", subjectResult);
				modelMap.put("subjectId", subjectId);

				mymap.put("success", "1");
				mymap.put("data", modelMap);
			}

		} catch (JsonIOException e) {
			e.printStackTrace();
			mymap.put("success", "0");
			mymap.put("errorMsg", e.toString());
			
		} catch (JsonSyntaxException e) {
			e.printStackTrace();
			mymap.put("success", "0");
			mymap.put("errorMsg", e.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

}
