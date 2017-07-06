<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
function pic_form_upload_success(data) {
    var json = jQuery.parseJSON(data);
    DWZ.ajaxDone(json);
    if (json.statusCode == DWZ.statusCode.ok) {
        $('#j_form_pic').val(json.navTabId);
        $('#j_form_span_pic').html('<img src="'+ json.navTabId +'" width="100" />');
    }
}
</script>
<div class="bjui-pageContent">
    <div class="pageFormContent" data-layout-h="0">
        <div style="margin:15px auto 0; width:800px;">
            <fieldset>
                <legend>弹出窗口</legend>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>样例</th>
                            <th>属性</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <a href="dialog-normal.html" class="btn btn-default" data-toggle="dialog" data-width="800" data-height="400" data-id="dialog">普通弹出窗口</a>
                            </td>
                            <td>data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-normal"</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="dialog-normal.html" class="btn btn-default" data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-max" data-max="true">最大化的普通弹出窗口</a>
                            </td>
                            <td>data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-max" data-max="true"</td>
                        </tr>
                        <tr>
                            <td>
                                <a href="dialog-modal.html" class="btn btn-default" data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-mask" data-mask="true">模态弹出窗口</a>
                            </td>
                            <td>data-toggle="dialog" data-width="800" data-height="400" data-id="dialog-mask" data-mask="true"</td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
        </div>
    </div>
    <div class="bjui-footBar">
        <ul>
            <li><button type="button" class="btn-close" data-icon="close">关闭</button></li>
        </ul>
    </div>
</div>