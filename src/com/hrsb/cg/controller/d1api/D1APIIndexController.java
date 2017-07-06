package com.hrsb.cg.controller.d1api;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.time.DateUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.hrsb.cg.model.About;
import com.hrsb.cg.model.AreaCity;
import com.hrsb.cg.model.AreaCounty;
import com.hrsb.cg.model.AreaProv;
import com.hrsb.cg.model.CodeRecord;
import com.hrsb.cg.model.Comment;
import com.hrsb.cg.model.Department;
import com.hrsb.cg.model.Dirty;
import com.hrsb.cg.model.HospitalGrade;
import com.hrsb.cg.model.UserAuth;
import com.hrsb.cg.model.UserDetail;
import com.hrsb.cg.model.UserLogin;
import com.hrsb.cg.model.Version;
import com.hrsb.cg.util.AjaxUtil;
import com.hrsb.cg.util.Const;
import com.hrsb.cg.util.JsonUtil;
import com.hrsb.cg.util.MD5;
import com.hrsb.cg.util.Tools;

/**
 * 首页控制类
 * 
 * @author app001
 * 
 */
@Controller
@RequestMapping(value = "/d1api")
public class D1APIIndexController extends D1APIController {

	/**
	 * 验证手机号是否已经注册
	 * 
	 * @param phone
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/existence.json")
	@ResponseBody
	public Map<String, Object> existence(@RequestParam String phone) {
		boolean flag = userService.isExistLoginName(phone);

		Map<String, Object> mymap = new HashMap<String, Object>();

		if (!flag) {
			mymap.put("existence", "No");
		} else {
			mymap.put("existence", "Yes");
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 注册
	 * 
	 * @param phone
	 * @param code
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/register.json")
	@ResponseBody
	public Map<String, Object> regist(@RequestParam String phone,
			@RequestParam String code, @RequestParam String password) {
		String message = "";

		Map<String, Object> mymap = new HashMap<String, Object>();

		if (userService.isExistLoginName(phone)) {
			if (checkCode(phone, code)) {
				UserLogin login = new UserLogin();
				login.setPhone(phone);
				login.setPassword(MD5.convertToMD5(password));
				login.setFrozen((byte) 0);
				userLoginMapper.insertSelective(login);
				UserDetail detail = new UserDetail();
				detail.setUserId(login.getId());
				detail.setWay((byte) 1);
				detail.setPhone(phone);
				detail.setStatus((byte) 1);
				detail.setCreateTime(new Date());
				detail.setIsLoginFirst((byte) 1);
				detail.setSource("D1API");// modified from 手机站 to D1API
				detail.setDownloadTypes((byte) 1);
				detail.setDownloadCount(Const.DOWNLOADCOUNT);
				userDetailMapper.insertSelective(detail);

				// message = "注册成功";
				mymap.put("success", "1");
				mymap.put("data", detail);
			} else {
				message = "验证码错误";
				mymap.put("success", "0");
				mymap.put("errorMsg", message);
			}
		} else {
			message = "用户已存在";
			mymap.put("success", "0");
			mymap.put("errorMsg", message);
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 验证验证码是否有效
	 * 
	 * @param phone
	 * @param code
	 * @return
	 */
	private boolean checkCode(String phone, String code) {
		CodeRecord codeRecord = codeRecordMapper.selectByPhone(phone);

		if (null != codeRecord && !StringUtils.isEmpty(code)
				&& code.equals(codeRecord.getCode())
				&& codeRecord.getEffectiveTime().after(new Date())) {
			return true;
		}

		return false;
	}

	/**
	 * 验证码是否有效
	 * 
	 * @param phone
	 * @param code
	 */
	@RequestMapping(value = "/code_check")
	@ResponseBody
	public Map<String, Object> code_check(@RequestParam String phone,
			@RequestParam String code) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		if (checkCode(phone, code)) {
			mymap.put("code_check", "1");
		} else {
			mymap.put("code_check", "0");
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 验证密码是否正确
	 * 
	 * @param phone
	 * @param password
	 */
	@RequestMapping(value = "/checkpassword.json")
	@ResponseBody
	public Map<String, Object> checkPassword(@RequestParam String phone,
			@RequestParam String password) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		String msg = userService.checkPassword(phone, password);

		if ("ok" == msg) {
			mymap.put("success", "1");
		} else {
			mymap.put("success", "0");
			mymap.put("errorMsg", msg);// fail：用户名密码不匹配或者其它；frozen：用户冻结
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取验证码
	 * 
	 * @param phone
	 * @throws Exception
	 */
	@RequestMapping(value = "/getcode.json")
	@ResponseBody
	public Map<String, Object> getCode(@RequestParam String phone) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		try {
			String code = Tools.getRandom(4);
			String content = "R您的手机验证码为：" + code + " 【汉典医学】";
			String result = sdk.sendSms(Const.server_username,
					Const.server_password, phone, content);
			String[] arr = StringUtils.split(result, ",");

			if (!ArrayUtils.isEmpty(arr) && !StringUtils.isEmpty(arr[0])
					&& "0".equals(arr[0].trim())) {
				CodeRecord codeRecord = codeRecordMapper.selectByPhone(phone);
				CodeRecord record = new CodeRecord();

				if (null != codeRecord) {
					record.setId(codeRecord.getId());
					record.setCode(code);
					record.setEffectiveTime(DateUtils.addMinutes(new Date(),
							Const.MINUTE));
					codeRecordMapper.updateByPrimaryKeySelective(record);
				} else {
					record.setPhone(phone);
					record.setCode(code);
					record.setEffectiveTime(DateUtils.addMinutes(new Date(),
							Const.MINUTE));
					codeRecordMapper.insertSelective(record);
				}

				mymap.put("success", "1");
				mymap.put("data", code);
			} else {
				mymap.put("success", "0");
				mymap.put("errorMsg", result);
			}
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 登录
	 * 
	 * @param phone
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login.json")
	@ResponseBody
	public Map<String, Object> login(@RequestParam String phone,
			@RequestParam String password) {
		UserLogin userLogin = userLoginMapper.selectByPhoneAndPassword(phone,MD5.convertToMD5(password));
		Map<String, Object> mymap = new HashMap<String, Object>();

		if (null != userLogin && userLogin.getFrozen() == 0) {
			//先检查该用户的登录是否已经过期
			UserAuth oldAuth = userAuthMapper.selectByPhone(phone);
			UserAuth newAuth = null;
			
			DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			String time = null;
			
			if (null != oldAuth) {
				//曾经登录过，鉴权有记录
				Date updateTime = new Date();
				Date newEffectTime = DateUtils.addMinutes(new Date(),Const.SESSMINUTE);// 60 min有效时间
        		String newtoken = MD5.convertToMD5(phone+password+updateTime.toString());
        		userAuthMapper.updateEffectByPhone(newEffectTime, updateTime, newtoken, phone);
        		
        		UserDetail detail = userDetailMapper.getPhone(phone);
    			mymap.put("success", "1");
    			mymap.put("token", newtoken);
    			time = format.format(updateTime);
    			mymap.put("updatetime", time);
    			time = format.format(newEffectTime);
    			mymap.put("effectivetime", time);
    			mymap.put("data", detail);
			}
			else {
        		//没有登录过，在鉴权表没有记录，需要在userAuth表里面创建记录
				Date createtime = DateUtils.addMinutes(new Date(),0);
				Date effecttime = DateUtils.addMinutes(new Date(),Const.SESSMINUTE);// 60 min有效时间
				String token = MD5.convertToMD5(phone+password+createtime.toString());
				
				newAuth = new UserAuth();
				newAuth.setPhone(phone);
				newAuth.setToken(token);
				newAuth.setCreateTime(createtime);
				newAuth.setEffectiveTime(effecttime);
				userAuthMapper.insertSelective(newAuth);

				UserDetail detail = userDetailMapper.getPhone(phone);

				mymap.put("success", "1");
				mymap.put("token", token);
				time = format.format(effecttime);
				mymap.put("effectivetime", time);
				mymap.put("data", detail);
        	}			
		} else {
			mymap.put("success", "0");
			mymap.put("errorMsg", "用户不存在或者被冻结");
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 登录
	 * 
	 * @param phone
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login_post.json")
	@ResponseBody
	public Map<String, Object> login_post(@RequestBody String code) {
		System.out.println("Here it is the login POST data: " + code);
		JsonObject jsonobj = JsonUtil.parseJson(code);
		Map<String, Object> objmap = JsonUtil.toMap(jsonobj);
		String phone = objmap.get("phone").toString();
		String password = objmap.get("password").toString();
		System.out.println("phone: " + phone + ", password: " + password);

		UserLogin userLogin = userLoginMapper.selectByPhoneAndPassword(phone,
				MD5.convertToMD5(password));
		Map<String, Object> mymap = new HashMap<String, Object>();

		if (null != userLogin && userLogin.getFrozen() == 0) {
			// 未来考虑在数据库建立user session表，用于保存一个session
			// 其它接口访问需要判断是否与该session一致，否则需要重新登录
			String strsession = Tools.getRandom("ma", 10);// format is
															// ma\d{10}HHmmss
			Date effectivetime = DateUtils.addMinutes(new Date(),
					Const.SESSMINUTE);// 60 min有效时间
			// 将上面的session与phone以及effectivetime保存到后台数据库

			UserDetail detail = userDetailMapper.getPhone(phone);

			mymap.put("success", "1");
			mymap.put("session", strsession);
			mymap.put("effectivetime", effectivetime);
			mymap.put("data", detail);
		} else {
			mymap.put("success", "0");
			mymap.put("errorMsg", "用户不存在或者被冻结");
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 找回密码
	 * 
	 * @param phone
	 * @param code
	 * @param password
	 * @return
	 */
	// 此接口调用前，用户应该先获取手机验证码，然后上传的信息包括
	// 手机号，验证码，以及新设置的密码（填写两次，由前端检查是否一致）
	@RequestMapping(value = "/resetpassword.json")
	@ResponseBody
	public Map<String, Object> resetpassword(@RequestParam String phone,
			@RequestParam String code, @RequestParam String password) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		UserLogin userLogin = userLoginMapper.selectByPhone(phone);
		String message = "";

		if (null != userLogin) {
			if (checkCode(phone, code)) {
				UserLogin login = new UserLogin();
				login.setId(userLogin.getId());
				login.setPassword(MD5.convertToMD5(password));
				userLoginMapper.updateByPrimaryKeySelective(login);

				mymap.put("success", "1");
				// message = "密码找回成功";
			} else {
				mymap.put("success", "0");
				message = "验证码错误";
				mymap.put("errorMsg", message);
			}
		} else {
			mymap.put("success", "0");
			message = "该手机号尚未注册";
			mymap.put("errorMsg", message);
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 关于我们
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/about.json")
	@ResponseBody
	public Map<String, Object> about(@RequestBody String token) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		System.out.println("Here it is the POST data: " + token);
		JsonObject jsonobj = JsonUtil.parseJson(token);
		Map<String, Object> objmap = JsonUtil.toMap(jsonobj);
		String mytoken = objmap.get("token").toString();
		System.out.println("phone: " + mytoken);

		try {
			About about = aboutMapper.selectByPrimaryKey(1);

			mymap.put("success", "1");
			mymap.put("data", about);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 用户协议
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/agreement.json")
	@ResponseBody
	public Map<String, Object> agreement() {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			About about = aboutMapper.selectByPrimaryKey(2);

			mymap.put("success", "1");
			mymap.put("data", about);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 隐私条款
	 * 
	 * @param modelMap
	 * @return Map<String, Object>
	 */
	@RequestMapping(value = "/secret.json")
	@ResponseBody
	public Map<String, Object> secret() {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			About about = aboutMapper.selectByPrimaryKey(3);

			mymap.put("success", "1");
			mymap.put("data", about);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 当前版本
	 * 
	 * @param modelMap
	 * @return Map<String, Object>
	 */
	@RequestMapping(value = "/version.json")
	@ResponseBody
	public Map<String, Object> getVersion(@RequestParam String versionId) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			Version ver = null;
			if (null != versionId && !versionId.isEmpty()) {
				ver = versionMapper.selectByPrimaryKey(Integer.parseInt(versionId));
			} else {
				ver = versionMapper.selectLatest();
			}

			mymap.put("success", "1");
			mymap.put("data", ver);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取所有省
	 * 
	 * @param
	 * @return Map<String, Object>
	 */
	@RequestMapping(value = "/province.json")
	@ResponseBody
	public Map<String, Object> getProvince() {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			List<AreaProv> areaProvs = areaProvMapper.findAllProv();
			mymap.put("success", "1");
			mymap.put("data", areaProvs);

		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取省下的所有市
	 * 
	 * @param prov_code
	 */
	@RequestMapping(value = "/city.json")
	@ResponseBody
	public Map<String, Object> getCity(@RequestParam String prov_code) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			List<AreaCity> areaCities = areaCityMapper.selectAllCity(prov_code);
			mymap.put("success", "1");
			mymap.put("data", areaCities);

		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取市下的所有县
	 * 
	 * @param city_code
	 */
	@RequestMapping(value = "/county.json")
	@ResponseBody
	public Map<String, Object> getCounty(@RequestParam String city_code) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			List<AreaCounty> areaCounties = areaCountyMapper
					.selectAllCounty(city_code);
			mymap.put("success", "1");
			mymap.put("data", areaCounties);

		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取医院的等级或者职称
	 * 
	 * @param type
	 */
	@RequestMapping(value = "/grade.json")
	@ResponseBody
	public Map<String, Object> getGrade(@RequestParam int type) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			List<HospitalGrade> hospitalGrades = hospitalGradeMapper
					.selectByType(type);

			mymap.put("success", "1");
			mymap.put("data", hospitalGrades);

		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 获取科室
	 * 
	 * @param parent_id
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/department.json")
	@ResponseBody
	public Map<String, Object> getDepartment(@RequestParam int parent_id) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			List<Department> departments = departmentMapper
					.selectByParentId(parent_id);

			mymap.put("success", "1");
			mymap.put("data", departments);

		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}
		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

	/**
	 * 评论
	 * 
	 * @param c
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comments")
	@ResponseBody
	public Map<String, Object> comments(@RequestParam String articleId,
			@RequestParam String typ, Comment comment, HttpSession session)
			throws Exception {
		UserLogin userLogin = (UserLogin) session
				.getAttribute(Const.SESSION_CLIENT_USER);
		String content = comment.getContent();
		// 判断是否有脏字
		Dirty dirty = dirtyMapper.selectByPrimaryKey(1);

		if (!StringUtils.isEmpty(dirty.getContent())) {
			String[] arr = StringUtils.split(dirty.getContent(), ",");

			if (!ArrayUtils.isEmpty(arr)) {
				for (String str : arr) {
					content = StringUtils.replace(content, str, "**");
				}
			}
			String[] arr1 = StringUtils.split(dirty.getContent(), "，");

			if (!ArrayUtils.isEmpty(arr1)) {
				for (String str : arr1) {
					content = StringUtils.replace(content, str, "**");
				}
			}
		}
		comment.setContent(content);
		comment.setUserId(userLogin.getId());
		comment.setCreateTime(new Date());
		commentMapper.insertSelective(comment);

		Map<String, Object> mymap = new HashMap<String, Object>();
		mymap.put("putcomment", "OK");

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;

		// return "redirect:/d1api/literature/detail.html?articleId=" +
		// articleId + "&types=" + typ;
	}

	/**
	 * 退出
	 * 
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		session.setAttribute(Const.SESSION_PHONE_USER, null);
		return "redirect:/redirect.html?path=d1api/login";
	}

	/**
	 * 收藏
	 * 
	 * @param id
	 * @param c
	 * @param modelMap
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/collection")
	public void collect(@RequestParam long id, @RequestParam byte types,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			UserLogin userLogin = (UserLogin) session
					.getAttribute(Const.SESSION_PHONE_USER);
			String msg = productService.collect(id, userLogin.getId(), types);
			new AjaxUtil(request, response).print(msg);
		} catch (Exception e) {
			new AjaxUtil(request, response).print("error");
		}
	}

	/**
	 * 下载
	 * 
	 * @param id
	 * @param c
	 * @param modelMap
	 * @throws Exception
	 */
	// @SuppressWarnings("static-access")
	@RequestMapping(value = "/download.json")
	@ResponseBody
	public Map<String, Object> download(@RequestParam long id, byte types,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {
		try {
			UserLogin userLogin = (UserLogin) session
					.getAttribute(Const.SESSION_PHONE_USER);
			String msg = productService.download(id, userLogin.getId(), types);
			// new AjaxUtil(request, response).print(msg);

			Map<String, Object> mymap = new HashMap<String, Object>();
			mymap.put("download", msg);

			System.out.println(JsonUtil.maptojson(mymap));
			return mymap;
		} catch (Exception e) {
			// new AjaxUtil(request, response).print("error");

			Map<String, Object> mymap = new HashMap<String, Object>();
			mymap.put("download", "error");

			System.out.println(JsonUtil.maptojson(mymap));
			return mymap;
		}
	}

	/**
	 * H5评论
	 * 
	 * @param c
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment")
	public String comment(@RequestParam String articleId,
			@RequestParam String type, Comment comment, HttpSession session)
			throws Exception {
		String content = comment.getContent();
		if (!StringUtils.isEmpty(content)) {
			comment.setContent(Tools.filterEmojiString(content));

			// 判断是否有脏字
			Dirty dirty = dirtyMapper.selectByPrimaryKey(1);

			if (!StringUtils.isEmpty(dirty.getContent())) {
				String[] arr = StringUtils.split(dirty.getContent(), ",");

				if (!ArrayUtils.isEmpty(arr)) {
					for (String str : arr) {
						content = StringUtils.replace(content, str, "**");
					}
				}
				String[] arr1 = StringUtils.split(dirty.getContent(), "，");

				if (!ArrayUtils.isEmpty(arr1)) {
					for (String str : arr1) {
						content = StringUtils.replace(content, str, "**");
					}
				}
			}
			comment.setContent(content);
			baseService.saveComment(comment, session);
		}
		return "redirect:/d1api/literature/detail.html?articleId=" + articleId
				+ "&types=" + type;
	}

}
