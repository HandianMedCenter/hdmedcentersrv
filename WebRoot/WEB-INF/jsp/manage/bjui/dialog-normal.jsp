<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="bjui-pageContent">
    <form action="ajaxDone1.html" class="pageForm" data-toggle="validate">
        <input type="hidden" name="dialog.id" value="edce142bc2ed4ec6b623aacaf602a4de">
        <div class="pageFormContent" data-layout-h="0">
            <table class="table table-condensed table-hover">
                <tbody>
                    <tr>
                        <td colspan="2" align="center"><h3>* 我是一个弹出窗口</h3></td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_dialog_operation" class="control-label x90">所属业务：</label>
                            <select name="dialog.operation" id="j_dialog_operation" data-toggle="selectpicker">
                                <option value="">全部</option>
                                <option value="1">业务1</option>
                                <option value="2" selected>订房部</option>
                                <option value="3">领队</option>
                                <option value="4">导游</option>
                            </select>
                        </td>
                        <td>
                            <label for="j_dialog_code" class="control-label x85">团号：</label>
                            <input type="text" name="dialog.code" id="j_dialog_code" value="20141105-CD2TW-1112" data-rule="required" size="20">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="j_dialog_name" class="control-label x90">联系客户姓名：</label>
                            <input type="text" name="dialog.name" id="j_dialog_name" value="" data-rule="required" size="20">
                        </td>
                        <td>
                            <label for="j_dialog_tel" class="control-label x85">联系电话：</label>
                            <input type="text" name="dialog.tel" id="j_dialog_tel" value="" data-rule="required;mobile" size="20">
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="bjui-footBar">
            <ul>
                <li><button type="button" class="btn-close">关闭</button></li>
                <li><button type="submit" class="btn-default">保存</button></li>
            </ul>
        </div>
    </form>
</div>