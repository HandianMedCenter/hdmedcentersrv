<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="bjui-pageHeader">
    <form id="pagerForm" data-toggle="ajaxsearch" action="table.html" method="post">
        <input type="hidden" name="pageSize" value="${model.pageSize}">
        <input type="hidden" name="pageCurrent" value="${model.pageCurrent}">
        <input type="hidden" name="orderField" value="${param.orderField}">
        <input type="hidden" name="orderDirection" value="${param.orderDirection}">
        <ul class="bjui-searchBar">
            <li><label>所属业务:</label>
                <select name="type" data-toggle="selectpicker">
                    <option value="">全部</option>
                    <option value="1">联络</option>
                    <option value="2">住宿</option>
                    <option value="3">餐饮</option>
                    <option value="4">交通</option>
                </select>
            </li>
            <li><label>护照号：</label><input type="text" id="customNo" value="" name="code" class="form-control" size="10" /></li>
            <li><label>客户姓名：</label><input type="text" value="" name="name" class="form-control" size="8" /></li>
            <li><input type="checkbox" id="j_table_chk" value="true" data-toggle="icheck" data-label="我的客户"></li>
            <li><a href="javascript:;" class="showMoreSearch" data-toggle="moresearch" data-name="custom" title="更多选项"><i class="fa fa-angle-double-down"></i></a></li>
            <li><button type="submit" class="btn-default" data-icon="search">查询</button></li>
            <li><a class="btn btn-orange" href="javascript:;" data-toggle="reloadsearch" data-clear-query="true" data-icon="undo">清空查询</a></li>
            <li class="pull-right">
                <div class="btn-group">
                    <button type="button" class="btn-default dropdown-toggle" data-toggle="dropdown" data-icon="copy">批量操作<span class="caret"></span></button>
                    <ul class="dropdown-menu right" role="menu">
                        <li><a href="book1.xlsx" data-toggle="doexport" data-confirm-msg="确定要导出信息吗？">导出<span style="color: green;">全部</span></a></li>
                        <li><a href="book1.xlsx" data-toggle="doexportchecked" data-confirm-msg="确定要导出选中项吗？" data-idname="expids" data-group="ids">导出<span style="color: red;">选中</span></a></li>
                        <li class="divider"></li>
                        <li><a href="ajaxDone2.html" data-toggle="dodelchecked" data-confirm-msg="确定要删除选中项吗？" data-idname="delids" data-group="ids">删除选中</a></li>
                    </ul>
                </div>
            </li>
        </ul>
        <div class="bjui-moreSearch">
            <label>职业：</label><input type="text" value="" name="profession" size="15" />
            <label>&nbsp;性别:</label>
            <select name="sex" data-toggle="selectpicker">
                <option value="">全部</option>
                <option value="true">男</option>
                <option value="false">女</option>
            </select>
            <label>&nbsp;手机:</label>
            <input type="text" value="" name="mobile" size="10">
        </div>
    </form>
</div>
<div class="bjui-pageContent">
    <div class="bjui-headBar">
        <ul>
            <li class="left"><button type="button" class="btn-default">功能按钮1</button></li>
            <li class="left"><button type="button" class="btn-green">功能按钮2</button></li>
            <li><button type="button" class="btn-red">其他功能</button></li>
            <li class="left"><button type="button" class="btn-orange">功能按钮3</button></li>
            <li class="left"><button type="button" class="btn-blue">功能按钮4</button></li>
        </ul>
    </div>
    <table class="table table-bordered table-hover table-striped table-top" data-layout-h="0">
        <thead>
            <tr>
                <th data-order-field="operation">业务</th>
                <th data-order-field="name">姓名</th>
                <th>拼音姓</th>
                <th>拼音名</th>
                <th data-order-field="sex">性别</th>
                <th data-order-field="birthday">出生日期</th>
                <th data-order-field="birthplace">出生地</th>
                <th data-order-field="add">居住地</th>
                <th data-order-field="passportno">护照号</th>
                <th data-order-field="issuedate">签发日期</th>
                <th data-order-field="indate">有效日期</th>
                <th data-order-field="issueat">签发地</th>
                <th data-order-field="profession">职业</th>
                <th data-order-field="mobile">手机</th>
                <th data-order-direction="asc" data-order-field="createtime">登记时间</th>
                <th width="26"><input type="checkbox" class="checkboxCtrl" data-group="ids" data-toggle="icheck"></th>
                <th width="100">操作</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>联络</td>
                <td>孙悟空</td>
                <td>Sun</td>
                <td>Wukong</td>
                <td>男</td>
                <td>0100-01-01</td>
                <td>花果山</td>
                <td>灵山</td>
                <td>0000011</td>
                <td>1000-05-01</td>
                <td>9999-12-31</td>
                <td>五指山</td>
                <td>保镖、斗战圣佛</td>
                <td>--</td>
                <td>2014-10-24 15:50</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="1"></td>
                <td>
                    <a href="form.html?id=1" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑-孙悟空">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>联络</td>
                <td>唐僧</td>
                <td>Tang</td>
                <td>Seng</td>
                <td>男</td>
                <td>0600-10-11</td>
                <td>洛阳</td>
                <td>灵山</td>
                <td>0000012</td>
                <td>1000-04-01</td>
                <td>9999-12-31</td>
                <td>洛阳</td>
                <td>念经</td>
                <td>--</td>
                <td>2014-10-24 15:51</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="2"></td>
                <td>
                    <a href="form.html?id=2" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑-唐僧">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>联络</td>
                <td>猪八戒</td>
                <td>Zhu</td>
                <td>Bajie</td>
                <td>男</td>
                <td>0400-10-11</td>
                <td>高老庄</td>
                <td>灵山</td>
                <td>0000013</td>
                <td>1001-06-01</td>
                <td>9999-12-31</td>
                <td>高老庄</td>
                <td>吃饭</td>
                <td>--</td>
                <td>2014-10-24 15:52</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="3"></td>
                <td>
                    <a href="form.html?id=3" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑-猪八戒">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>联络</td>
                <td>沙和尚</td>
                <td>Sha</td>
                <td>Heshang</td>
                <td>男</td>
                <td>0450-10-11</td>
                <td>流沙河</td>
                <td>灵山</td>
                <td>0000013</td>
                <td>1005-07-01</td>
                <td>9999-12-31</td>
                <td>流沙河</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 15:53</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="4"></td>
                <td>
                    <a href="form.html?id=4" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？" data-title="编辑-沙和尚">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉1</td>
                <td>Luo</td>
                <td>Han1</td>
                <td>男</td>
                <td>1000-01-01</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000001</td>
                <td>1010-01-01</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:01</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="5"></td>
                <td>
                    <a href="form.html?id=5" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉2</td>
                <td>Luo</td>
                <td>Han2</td>
                <td>男</td>
                <td>1000-01-02</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000002</td>
                <td>1010-01-02</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:02</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="7"></td>
                <td>
                    <a href="form.html?id=7" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉3</td>
                <td>Luo</td>
                <td>Han3</td>
                <td>男</td>
                <td>1000-01-03</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000003</td>
                <td>1010-01-03</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:03</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="8"></td>
                <td>
                    <a href="form.html?id=8" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉4</td>
                <td>Luo</td>
                <td>Han4</td>
                <td>男</td>
                <td>1000-01-04</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000004</td>
                <td>1010-01-04</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:04</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="9"></td>
                <td>
                    <a href="form.html?id=9" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉5</td>
                <td>Luo</td>
                <td>Han5</td>
                <td>男</td>
                <td>1000-01-05</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000005</td>
                <td>1010-01-05</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:05</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="10"></td>
                <td>
                    <a href="form.html?id=10" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉6</td>
                <td>Luo</td>
                <td>Han6</td>
                <td>男</td>
                <td>1000-01-06</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000006</td>
                <td>1010-01-06</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:06</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="11"></td>
                <td>
                    <a href="form.html?id=11" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉7</td>
                <td>Luo</td>
                <td>Han7</td>
                <td>男</td>
                <td>1000-01-07</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000007</td>
                <td>1010-01-07</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:07</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="12"></td>
                <td>
                    <a href="form.html?id=12" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉8</td>
                <td>Luo</td>
                <td>Han8</td>
                <td>男</td>
                <td>1000-01-08</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000008</td>
                <td>1010-01-08</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:08</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="13"></td>
                <td>
                    <a href="form.html?id=13" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉9</td>
                <td>Luo</td>
                <td>Han9</td>
                <td>男</td>
                <td>1000-01-09</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000009</td>
                <td>1010-01-09</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:09</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="14"></td>
                <td>
                    <a href="form.html?id=14" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉10</td>
                <td>Luo</td>
                <td>Han10</td>
                <td>男</td>
                <td>1000-01-10</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000010</td>
                <td>1010-01-10</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:10</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="15"></td>
                <td>
                    <a href="form.html?id=15" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉11</td>
                <td>Luo</td>
                <td>Han11</td>
                <td>男</td>
                <td>1000-01-11</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000011</td>
                <td>1010-01-11</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:11</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="16"></td>
                <td>
                    <a href="form.html?id=16" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉12</td>
                <td>Luo</td>
                <td>Han12</td>
                <td>男</td>
                <td>1000-01-12</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000012</td>
                <td>1010-01-12</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:12</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="17"></td>
                <td>
                    <a href="form.html?id=17" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉13</td>
                <td>Luo</td>
                <td>Han13</td>
                <td>男</td>
                <td>1000-01-13</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000013</td>
                <td>1010-01-13</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:13</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="18"></td>
                <td>
                    <a href="form.html?id=18" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉14</td>
                <td>Luo</td>
                <td>Han14</td>
                <td>男</td>
                <td>1000-01-14</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000014</td>
                <td>1010-01-14</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:14</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="19"></td>
                <td>
                    <a href="form.html?id=19" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉15</td>
                <td>Luo</td>
                <td>Han15</td>
                <td>男</td>
                <td>1000-01-15</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000015</td>
                <td>1010-01-15</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:15</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="20"></td>
                <td>
                    <a href="form.html?id=20" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉16</td>
                <td>Luo</td>
                <td>Han16</td>
                <td>男</td>
                <td>1000-01-16</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000016</td>
                <td>1010-01-16</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:16</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="21"></td>
                <td>
                    <a href="form.html?id=21" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉17</td>
                <td>Luo</td>
                <td>Han17</td>
                <td>男</td>
                <td>1000-01-17</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000017</td>
                <td>1010-01-17</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:17</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="22"></td>
                <td>
                    <a href="form.html?id=22" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉18</td>
                <td>Luo</td>
                <td>Han18</td>
                <td>男</td>
                <td>1000-01-18</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000018</td>
                <td>1010-01-18</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:18</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="23"></td>
                <td>
                    <a href="form.html?id=23" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉19</td>
                <td>Luo</td>
                <td>Han19</td>
                <td>男</td>
                <td>1000-01-19</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000019</td>
                <td>1010-01-19</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:19</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="24"></td>
                <td>
                    <a href="form.html?id=24" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉20</td>
                <td>Luo</td>
                <td>Han20</td>
                <td>男</td>
                <td>1000-01-20</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000020</td>
                <td>1010-01-20</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:20</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="25"></td>
                <td>
                    <a href="form.html?id=25" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉21</td>
                <td>Luo</td>
                <td>Han21</td>
                <td>男</td>
                <td>1000-01-21</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000021</td>
                <td>1010-01-21</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:21</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="26"></td>
                <td>
                    <a href="form.html?id=26" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉22</td>
                <td>Luo</td>
                <td>Han22</td>
                <td>男</td>
                <td>1000-01-22</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000022</td>
                <td>1010-01-22</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:22</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="27"></td>
                <td>
                    <a href="form.html?id=27" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉23</td>
                <td>Luo</td>
                <td>Han23</td>
                <td>男</td>
                <td>1000-01-23</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000023</td>
                <td>1010-01-23</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:23</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="28"></td>
                <td>
                    <a href="form.html?id=28" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉24</td>
                <td>Luo</td>
                <td>Han24</td>
                <td>男</td>
                <td>1000-01-24</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000024</td>
                <td>1010-01-24</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:24</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="29"></td>
                <td>
                    <a href="form.html?id=29" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉25</td>
                <td>Luo</td>
                <td>Han25</td>
                <td>男</td>
                <td>1000-01-25</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000025</td>
                <td>1010-01-25</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:25</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="30"></td>
                <td>
                    <a href="form.html?id=30" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉26</td>
                <td>Luo</td>
                <td>Han26</td>
                <td>男</td>
                <td>1000-01-26</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000026</td>
                <td>1010-01-26</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:26</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="31"></td>
                <td>
                    <a href="form.html?id=31" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉27</td>
                <td>Luo</td>
                <td>Han27</td>
                <td>男</td>
                <td>1000-01-27</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000027</td>
                <td>1010-01-27</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:27</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="32"></td>
                <td>
                    <a href="form.html?id=32" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉28</td>
                <td>Luo</td>
                <td>Han28</td>
                <td>男</td>
                <td>1000-01-28</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000028</td>
                <td>1010-01-28</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:28</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="33"></td>
                <td>
                    <a href="form.html?id=33" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉29</td>
                <td>Luo</td>
                <td>Han29</td>
                <td>男</td>
                <td>1000-01-29</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000029</td>
                <td>1010-01-29</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:29</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="34"></td>
                <td>
                    <a href="form.html?id=34" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉30</td>
                <td>Luo</td>
                <td>Han30</td>
                <td>男</td>
                <td>1000-01-30</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000030</td>
                <td>1010-01-30</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:30</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="35"></td>
                <td>
                    <a href="form.html?id=35" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉31</td>
                <td>Luo</td>
                <td>Han31</td>
                <td>男</td>
                <td>1000-01-31</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000031</td>
                <td>1010-01-31</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:31</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="36"></td>
                <td>
                    <a href="form.html?id=36" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉32</td>
                <td>Luo</td>
                <td>Han32</td>
                <td>男</td>
                <td>1000-02-01</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000032</td>
                <td>1010-02-01</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:32</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="32"></td>
                <td>
                    <a href="form.html?id=32" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉33</td>
                <td>Luo</td>
                <td>Han33</td>
                <td>男</td>
                <td>1000-02-02</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000033</td>
                <td>1010-02-02</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:33</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="33"></td>
                <td>
                    <a href="form.html?id=33" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉34</td>
                <td>Luo</td>
                <td>Han34</td>
                <td>男</td>
                <td>1000-02-03</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000034</td>
                <td>1010-02-03</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:34</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="34"></td>
                <td>
                    <a href="form.html?id=34" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉35</td>
                <td>Luo</td>
                <td>Han35</td>
                <td>男</td>
                <td>1000-02-04</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000035</td>
                <td>1010-02-04</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:35</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="35"></td>
                <td>
                    <a href="form.html?id=35" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉36</td>
                <td>Luo</td>
                <td>Han36</td>
                <td>男</td>
                <td>1000-02-05</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000036</td>
                <td>1010-02-05</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:36</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="36"></td>
                <td>
                    <a href="form.html?id=36" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉37</td>
                <td>Luo</td>
                <td>Han37</td>
                <td>男</td>
                <td>1000-02-06</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000037</td>
                <td>1010-02-06</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:37</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="37"></td>
                <td>
                    <a href="form.html?id=37" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉38</td>
                <td>Luo</td>
                <td>Han38</td>
                <td>男</td>
                <td>1000-02-07</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000038</td>
                <td>1010-02-07</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:38</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="38"></td>
                <td>
                    <a href="form.html?id=38" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉39</td>
                <td>Luo</td>
                <td>Han39</td>
                <td>男</td>
                <td>1000-02-08</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000039</td>
                <td>1010-02-08</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:39</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="39"></td>
                <td>
                    <a href="form.html?id=39" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉40</td>
                <td>Luo</td>
                <td>Han40</td>
                <td>男</td>
                <td>1000-02-09</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000040</td>
                <td>1010-02-09</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:40</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="40"></td>
                <td>
                    <a href="form.html?id=40" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉41</td>
                <td>Luo</td>
                <td>Han41</td>
                <td>男</td>
                <td>1000-02-10</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000041</td>
                <td>1010-02-10</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:41</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="41"></td>
                <td>
                    <a href="form.html?id=41" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉42</td>
                <td>Luo</td>
                <td>Han42</td>
                <td>男</td>
                <td>1000-02-11</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000042</td>
                <td>1010-02-11</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:42</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="42"></td>
                <td>
                    <a href="form.html?id=42" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉43</td>
                <td>Luo</td>
                <td>Han43</td>
                <td>男</td>
                <td>1000-02-12</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000043</td>
                <td>1010-02-12</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:43</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="43"></td>
                <td>
                    <a href="form.html?id=43" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉44</td>
                <td>Luo</td>
                <td>Han44</td>
                <td>男</td>
                <td>1000-02-13</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000044</td>
                <td>1010-02-13</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:44</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="44"></td>
                <td>
                    <a href="form.html?id=44" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉45</td>
                <td>Luo</td>
                <td>Han45</td>
                <td>男</td>
                <td>1000-02-14</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000045</td>
                <td>1010-02-14</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:45</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="45"></td>
                <td>
                    <a href="form.html?id=45" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉46</td>
                <td>Luo</td>
                <td>Han46</td>
                <td>男</td>
                <td>1000-02-15</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000046</td>
                <td>1010-02-15</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:46</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="46"></td>
                <td>
                    <a href="form.html?id=46" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉47</td>
                <td>Luo</td>
                <td>Han47</td>
                <td>男</td>
                <td>1000-02-16</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000047</td>
                <td>1010-02-16</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:47</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="47"></td>
                <td>
                    <a href="form.html?id=47" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉48</td>
                <td>Luo</td>
                <td>Han48</td>
                <td>男</td>
                <td>1000-02-17</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000048</td>
                <td>1010-02-17</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:48</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="48"></td>
                <td>
                    <a href="form.html?id=48" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉49</td>
                <td>Luo</td>
                <td>Han49</td>
                <td>男</td>
                <td>1000-02-18</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000049</td>
                <td>1010-02-18</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:49</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="49"></td>
                <td>
                    <a href="form.html?id=49" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉50</td>
                <td>Luo</td>
                <td>Han50</td>
                <td>男</td>
                <td>1000-02-19</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000050</td>
                <td>1010-02-19</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:50</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="50"></td>
                <td>
                    <a href="form.html?id=50" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉51</td>
                <td>Luo</td>
                <td>Han51</td>
                <td>男</td>
                <td>1000-02-20</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000051</td>
                <td>1010-02-20</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:51</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="51"></td>
                <td>
                    <a href="form.html?id=51" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉52</td>
                <td>Luo</td>
                <td>Han52</td>
                <td>男</td>
                <td>1000-02-21</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000052</td>
                <td>1010-02-21</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:52</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="52"></td>
                <td>
                    <a href="form.html?id=52" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉53</td>
                <td>Luo</td>
                <td>Han53</td>
                <td>男</td>
                <td>1000-02-22</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000053</td>
                <td>1010-02-22</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:53</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="53"></td>
                <td>
                    <a href="form.html?id=53" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉54</td>
                <td>Luo</td>
                <td>Han54</td>
                <td>男</td>
                <td>1000-02-23</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000054</td>
                <td>1010-02-23</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:54</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="54"></td>
                <td>
                    <a href="form.html?id=54" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉55</td>
                <td>Luo</td>
                <td>Han55</td>
                <td>男</td>
                <td>1000-02-24</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000055</td>
                <td>1010-02-24</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:55</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="55"></td>
                <td>
                    <a href="form.html?id=55" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉56</td>
                <td>Luo</td>
                <td>Han56</td>
                <td>男</td>
                <td>1000-02-25</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000056</td>
                <td>1010-02-25</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:56</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="56"></td>
                <td>
                    <a href="form.html?id=56" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉57</td>
                <td>Luo</td>
                <td>Han57</td>
                <td>男</td>
                <td>1000-02-26</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000057</td>
                <td>1010-02-26</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:57</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="57"></td>
                <td>
                    <a href="form.html?id=57" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉58</td>
                <td>Luo</td>
                <td>Han58</td>
                <td>男</td>
                <td>1000-02-27</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000058</td>
                <td>1010-02-27</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:58</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="58"></td>
                <td>
                    <a href="form.html?id=58" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉59</td>
                <td>Luo</td>
                <td>Han59</td>
                <td>男</td>
                <td>1000-02-28</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000059</td>
                <td>1010-02-28</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 16:59</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="59"></td>
                <td>
                    <a href="form.html?id=59" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
            <tr>
                <td>住宿</td>
                <td>罗汉60</td>
                <td>Luo</td>
                <td>Han60</td>
                <td>男</td>
                <td>1000-02-29</td>
                <td>佛国</td>
                <td>灵山</td>
                <td>1000060</td>
                <td>1010-03-01</td>
                <td>9999-12-31</td>
                <td>佛国</td>
                <td>罗汉</td>
                <td>--</td>
                <td>2014-10-24 17:00</td>
                <td><input type="checkbox" name="ids" data-toggle="icheck" value="60"></td>
                <td>
                    <a href="form.html?id=60" class="btn btn-green" data-toggle="navtab" data-reload-warn="本页已有打开的内容，确定将刷新本页内容，是否继续？">编辑</a>
                    <a href="ajaxDone2.html" class="btn btn-red" data-toggle="doajax" data-confirm-msg="确定要删除该行信息吗？">删</a>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="bjui-footBar">
        <div class="pages">
            <span>每页&nbsp;</span>
            <div class="selectPagesize">
                <select data-toggle="selectpicker" data-toggle-change="changepagesize">
                    <option value="30">30</option>
                    <option value="60">60</option>
                    <option value="120">120</option>
                    <option value="150">150</option>
                </select>
            </div>
            <span>&nbsp;条，共 600 条</span>
        </div>
        <div class="pagination-box" data-toggle="pagination" data-total="600" data-page-size="30" data-page-current="1">
        </div>
    </div>
</div>
