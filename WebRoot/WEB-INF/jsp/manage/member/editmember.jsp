<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="/client/js/shengShiXian.js"></script>
<script type="text/javascript">
function pic_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#headImg').val(json.navTabId).trigger('validate')
        $('#headimg_span').html('<img src="'+ json.navTabId +'" width="100" />')
    }
}
function cardImg_upload_success(file, data) {
    var json = $.parseJSON(data)
    
    $(this).bjuiajax('ajaxDone', json)
    if (json[BJUI.keys.statusCode] == BJUI.statusCode.ok) {
        $('#cardImg').val(json.navTabId).trigger('validate')
        $('#cardImg_span').html('<img src="'+ json.navTabId +'" width="100" />')
    }
}

$(function(){
	var id=$("input[name='id']").val();
	if(id!=null && id!=""){
		$("input").attr("readonly","readonly");
		$("select").attr("disabled","disabled");
	}

})

</script>
<div class="bjui-pageContent">
    <form action="/mm/userDetailSave.im" id="memberForm" class="pageForm" method="post" data-toggle="validate">
        <input type="hidden" name="id" value="${us.id }" >
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover" width="100%">
                <tbody>
                	<tr>
                        <td>
                            <label for="username" class="control-label x85">登录名：</label>
                            <input type="text" name="loginName" id="loginName" value=""  data-rule="loginName" data-rule-loginName="[/^1[3-9]\d{9}$/,'手机号不正确']" size="15">
                        </td>
                    </tr>
                   <tr>
                        <td>
                            <label for="username" class="control-label x85">手机号码：</label>
                            <input type="text" name="phone" id="phone" value="${us.phone}"  data-rule="loginName" data-rule-loginName="[/^1[3-9]\d{9}$/,'手机号不正确']" size="15">
                        </td>
                        <td>
                            <label for="password" class="control-label x85">昵称：</label>
                            <input type="text" name="nickName" id="nickName" value="${us.nickName}" data-rule="required" size="15">
                        </td>
                    </tr>
                    <tr>
                    	<td>
                            <label for="phone" class="control-label x85">姓名：</label>
                           <input type="text" name="userName" id="userName" value="${us.userName }" data-rule="required" size="15">
                        </td>
                        <td>
                            <label for="name" class="control-label x85">性别：</label>
                            <select name="sex" id="sex" data-toggle="selectpicker" data-width="100">
                            	<option value="男" ${us.sex == '男'?selected:'' }>男</option>
                            	<option value="女" ${us.sex == '女'?selected:'' }>女</option>
                            	<option value="保密" ${us.sex == '保密'?selected:'' }>保密</option>
                            </select>
                        </td>
                        
                    </tr>
                    <tr>
                        <td colspan="2">
                            <label for="phone" class="control-label x85">所在地区：</label>
                            <select name="province" id="province">
                            	<option>请选择</option>
	                            <c:if test="${!empty areaProvs }">
		                        	<c:forEach items="${areaProvs }" var="areaProv">
		                        		<option value="${areaProv.provCode }" <c:if test="${areaProv.provName eq us.province }">selected</c:if>>${areaProv.provName }</option>
		                        	</c:forEach>
		                        </c:if>
                            </select>&nbsp;
                            <select id="city" name="city">
                            	<c:if test="${!empty us.id }">
                            	<option>${us.city }</option>
                            	</c:if>
                            	<c:if test="${empty us.id }">
                            	<option>请选择</option>
                            	</c:if>
	                            
		                    </select>
		                	<select id="county" name="country">
		                		<c:if test="${!empty us.id }">
                            	<option>${us.country }</option>
                            	</c:if>
                            	<c:if test="${empty us.id }">
                            	<option>请选择</option>
                            	</c:if>
		                    </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="username" class="control-label x85">医院：</label>
                            <input type="text" name="hospitalName" id="hospitalName" value="${us.hospitalName}"  data-rule="required" size="15">
                        </td>
                        <td>
                            <label for="password" class="control-label x85">医院等级：</label>
                            <select name="hospitalGrade" id="hospitalGrade" data-toggle="selectpicker">
                            	<option value="">请选择</option>
                            	<c:if test="${!empty hospitalGradeList}">
	                            	<c:forEach items="${hospitalGradeList }" var="grade">
	                            		<option value="${grade.id }" ${grade.id==us.hospitalGrade?'selected':'' }>${grade.name }</option>
	                            	</c:forEach>
                            	</c:if>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="department" class="control-label x85">科室：</label>
                            
 							<select name="departmentOne" id="departmentOne" data-toggle="selectpicker">
	 							<option value="">请选择</option>
	 							<c:if test="${!empty departments}">
	                            	<c:forEach items="${departments }" var="department">
	                            		<option value="${department.id }" ${department.id==us.departmentOne?'selected':'' }>${department.name }</option>
	                            	</c:forEach>
	                            </c:if>	
                            </select>
                        </td>
                        <td>
                            <label for="password" class="control-label x85">职称：</label>
                            <select name="professional" id="professional" data-toggle="selectpicker">
                            	<option value="">请选择</option>
                            	<c:if test="${!empty hospitalProfessionalList}">
	                            	<c:forEach items="${hospitalProfessionalList }" var="professional">
	                            		<option value="${professional.id }" ${professional.id==us.professional?'selected':'' }>${professional.name }</option>
	                            	</c:forEach>
                            	</c:if>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="forte" class="control-label x85">主治特长：</label>
                            <input type="text" name="forte" id="forte" value="${us.forte}"  data-rule="required" size="15">
                        </td>
                        <td>
                            <label for="number" class="control-label x85">执业医师资格证编号：</label>
                            <input type="text" name="number" id="number" value="${us.number}" data-rule="required" size="15">
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <label class="control-label x85">头像：</label>
                           <c:if test="${!empty us.id}">
                          	 	<img src="${us.headImg}" width="100"/>
                           </c:if>
                            <c:if test="${empty us.id}">
	                            <div style="display: inline-block; vertical-align: middle;">
	                                <div id="headimg2" data-toggle="upload" data-uploader="/upload/file.im?sessionid=?" 
	                                    data-file-size-limit="1024000000"
	                                    data-file-type-exts="*.jpg;*.png;*.gif;*.mpg;*.gif"
	                                    data-multi="true"
	                                    data-on-upload-success="pic_upload_success"
	                                    data-icon="cloud-upload"></div>
	                                <input type="hidden" name="headImg" value="${us.headImg}" id="headImg" data-target="#headImg .bjui-upload-select-file">
	                                <span id="headimg_span"><img src="${us.headImg}" width="100"/></span>
	                            </div>
                            </c:if>
                        </td>
                        <td>
                        	 <label for="cardImg" class="control-label x85">身份认证信息：</label>
                        	 <c:if test="${!empty us.id}">
                          	 	<img src="${us.cardImg}" width="100"/>
                           </c:if>
                           <c:if test="${empty us.id}">
                           
	                        	 <div style="display: inline-block; vertical-align: middle;">
	                                <div id="headimg2" data-toggle="upload" data-uploader="/upload/file.im?sessionid=?" 
	                                    data-file-size-limit="1024000000"
	                                    data-file-type-exts="*.jpg;*.png;*.gif;*.mpg;*.gif"
	                                    data-multi="true"
	                                    data-on-upload-success="cardImg_upload_success"
	                                    data-icon="cloud-upload"></div>
	                                <input type="hidden" name="cardImg" value="${us.cardImg }" id="cardImg" data-target="#cardImg .bjui-upload-select-file">
	                                <span id="cardImg_span"><img src="${us.cardImg}" width="100"/></span>
	                            </div>
                            </c:if>
                        </td>
                      </tr>
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn-close" data-icon="close">取消</button></li>
                <c:if test="${empty us.id}">
                <li><button type="submit" class="btn-default" data-icon="save">保存</button></li>
                </c:if>
            </ul>
        </div>
    </form>
</div>
<script type="text/javascript">
	$("#loginName").blur(function(){
		//alert($(this).val())
		$.ajax({
				type:"get",
				url:"/valPhone.html",
				data:{loginName:$(this).val()},
				success:function(msg){
					if(msg=="isExist"){
						alert("用户名已注册");
						return;
					}
				}
		
		})
	});
</script>
