package com.hrsb.cg.controller.d1api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hrsb.cg.intercept.D1apiAuth;
import com.hrsb.cg.model.Product;
import com.hrsb.cg.model.ProductComment;
import com.hrsb.cg.model.ProductImage;
import com.hrsb.cg.model.ProductLiterature;
import com.hrsb.cg.model.ProductQuestion;
import com.hrsb.cg.util.JsonUtil;
import com.hrsb.cg.util.Page;

/**
 * 汉典产品控制类
 * 
 * @author app001
 * 
 */
@Controller
@RequestMapping(value = "/d1api/product")
public class D1APIProductController extends D1APIController {

	/**
	 * 汉典产品列表
	 * 
	 * @param modelMap
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws Exception
	 */
	@D1apiAuth
	@RequestMapping(value = "/list.json")
	@ResponseBody
	public Map<String, Object> list(ModelMap modelMap,
			@RequestParam(defaultValue = "1") int pageNo,
			@RequestParam(defaultValue = "6") int pageSize) {
		Map<String, Object> mymap = new HashMap<String, Object>();

		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("status", 1);
			Page<Product> page = new Page<Product>(pageNo, pageSize)
					.setParams(params);
			List<Product> products = productService.selectByPage(page);
			page.setResults(products);
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
	 * 产品详情
	 * 
	 * @param id
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/detail.json")
	@ResponseBody
	public Map<String, Object> getDetai(@RequestParam long id) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		ModelMap modelMap = new ModelMap();

		try {
			// 产品详情
			Product product = productService.getById(id);
			productService.modifyProductClickCount(product);
			List<ProductImage> productImages = productService
					.getImagesByProductId(id);
			modelMap.put("product", product);
			modelMap.put("productImages", productImages);
			modelMap.put("types", 1);

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
	 * 常见问题
	 * 
	 * @param id
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/problem.json")
	@ResponseBody
	public Map<String, Object> problem(@RequestParam long id) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		ModelMap modelMap = new ModelMap();

		try {
			// 产品详情
			Product product = productService.getById(id);

			if (null != product) {
				// 常见问题
				List<ProductQuestion> productQuestions = productService
						.getQuestionByProductId(product.getId());
				modelMap.put("productQuestions", productQuestions);
				List<ProductImage> productImages = productService
						.getImagesByProductId(id);
				modelMap.put("productImages", productImages);
			}

			modelMap.put("product", product);
			modelMap.put("types", 2);

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
	 * 专家点评
	 * 
	 * @param id
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/comment.json")
	@ResponseBody
	public Map<String, Object> comment(@RequestParam long id) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		ModelMap modelMap = new ModelMap();

		try {
			// 产品详情
			Product product = productService.getById(id);

			if (null != product) {
				// 专家点评
				List<ProductComment> productComments = productService
						.getCommentByProductId(product.getId());
				modelMap.put("productComments", productComments);
				List<ProductImage> productImages = productService
						.getImagesByProductId(id);
				modelMap.put("productImages", productImages);
			}

			modelMap.put("product", product);
			modelMap.put("types", 3);

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
	 * 汉典文献
	 * 
	 * @param id
	 * @param c
	 * @param modelMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/literature.json")
	@ResponseBody
	public Map<String, Object> literature(@RequestParam long id) {
		Map<String, Object> mymap = new HashMap<String, Object>();
		ModelMap modelMap = new ModelMap();

		try {
			// 产品详情
			Product product = productService.getById(id);

			if (null != product) {
				List<ProductLiterature> productLiteratures = productService
						.getLiteratureByProductId(product.getId());
				modelMap.put("productLiteratures", productLiteratures);
				List<ProductImage> productImages = productService
						.getImagesByProductId(id);
				modelMap.put("productImages", productImages);
			}

			modelMap.put("product", product);
			modelMap.put("types", 4);
			mymap.put("success", "1");
			mymap.put("data", modelMap);
		} catch (Exception ex) {
			mymap.put("success", "0");
			mymap.put("errorMsg", ex.toString());
		}

		System.out.println(JsonUtil.maptojson(mymap));
		return mymap;
	}

}
