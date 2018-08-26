<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>手机列表</title>
</head>
<body>
<center><input type="text" id="searchvalue" /> <button id="search" class="btn btn-success">搜索</button></center>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th><input type="checkbox" onclick="alls(this)">(多选)</th>
            <th>id</th>
            <th>手机名称</th>
            <th>手机价格</th>
            <th>机身颜色</th>
            <th>手机内存</th>
            <th>操作</th>
        </tr>
        <tbody id="tdata"></tbody>
    </table>
    <div style="margin-top: 2em;">
        <input type="button" value="批量删除" id="dels"  class="btn btn-success"> <button type='button' class='btn btn-primary'  data-toggle='modal' data-target='#add'>添加</button>
    </div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">手机信息更新</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

                <%--更新表单--%>
                <div class="modal-body" style="height: 400px">

                    <div class="form-group">
                        <label for="Id">手机ID</label>
                        <input type="text" class="form-control" id="Id" name="Id" aria-describedby="emailHelp" readonly="readonly" placeholder="">
                    </div>

                    <div class="form-group">
                        <label for="name">手机名称</label>
                        <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp" placeholder="请输入手机名称">
                    </div>
                    <div class="form-group">
                        <label for="price">手机价格</label>
                        <input type="number" class="form-control" step="0.001" name="price" id="price" aria-describedby="emailHelp" value="0.002" placeholder="请输入手机价格">
                    </div>
                    <div class="form-group">
                        <label for="color">机身颜色</label>
                        <input type="text" class="form-control"  name="color" id="color" aria-describedby="emailHelp" placeholder="请输入机身颜色">
                    </div>
                    <div class="form-group">
                        <label for="memory">手机内存</label>
                        <input type="text" class="form-control" name="memory" id="memory" aria-describedby="emailHelp" placeholder="请输入手机内存">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btnClose" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" id="btnUpdate" class="btn btn-primary">更新</button>
                </div>
        </div>
    </div>
</div>

<!-- 添加 -->
<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="11">添加</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%--更新表单--%>
            <div class="modal-body" style="height: 400px">

                <div class="form-group">
                    <label for="aid">手机ID</label>
                    <input type="text" class="form-control" id="aid" aria-describedby="emailHelp"  placeholder="请输入手机id">
                </div>

                <div class="form-group">
                    <label for="aname">手机名称</label>
                    <input type="text" class="form-control"  id="aname" aria-describedby="emailHelp" placeholder="请输入手机名称">
                </div>
                <div class="form-group">
                    <label for="aprice">手机价格</label>
                    <input type="number" class="form-control" step="0.001"  id="aprice" aria-describedby="emailHelp" placeholder="请输入手机价格">
                </div>
                <div class="form-group">
                    <label for="acolor">机身颜色</label>
                    <input type="text" class="form-control"  id="acolor" aria-describedby="emailHelp" placeholder="请输入机身颜色">
                </div>
                <div class="form-group">
                    <label for="amemory">手机内存</label>
                    <input type="text" class="form-control"  id="amemory" aria-describedby="emailHelp" placeholder="请输入手机内存">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="abtnClose" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" id="btnAdd" class="btn btn-primary">添加</button>
            </div>
        </div>
    </div>
</div>

<script>

    //渲染数据
    var data = function () {
        $.post("/IphoneList",{value:$("#searchvalue").val()},function (data) {
            $("#tdata tr").remove();
            $.each(data,function (index,obj) {
                var tr =$("<tr/>");
                $("" +
                    "<td><input name='id' value="+obj.id+" type='checkbox' /></td>" +
                    "<td>"+obj.id+"</td>" +
                    "<td>"+obj.name+"</td>" +
                    "<td>￥"+obj.price+"</td>" +
                    "<td>"+obj.color+"</td>" +
                    "<td>"+obj.memory+"</td>" +
                    "<td>" +
                        "<a id='del' data-id="+obj.id+" class='btn btn-primary'>删除</a>  " +
                        "<button type='button' class='btn btn-primary' data-id="+obj.id+"  data-toggle='modal' data-target='#myModal'>更新</button>" +
                    "</td>" ).appendTo(tr);
                $("#tdata").append(tr);
            })
        });
    }
    data();

    //点击删除时请求
    $("body").on("click","#del",function () {
        var id= event.target.dataset['id'];
        var tr =  event.target.closest("tr");
        if(!confirm("确定要删除吗？"))
            return false;
        $.get("/IphoneDel?id="+id,function (text) {
            alert(text.msg);
            //删除当前tr节点 充当刷新界面(不进行数据渲染);
             tr.remove();
        })
    })

    //复选框事件
    function alls(e) {
        var checkboxs = document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked = e.checked
        }
    }

    //点击更新按钮时的事件
    $("body").on("show.bs.modal","#myModal",function () {
        var id = event.target.dataset['id'];
        $.get("/IphoneUpdate?id="+id,function (text) {
            $("#Id").val(text.id);
            $("#name").val(text.name);
            $("#price").val(text.price);
            $("#color").val(text.color);
            $("#memory").val(text.memory);
        });
    });
    //点击更新按钮的事件
    $("#btnUpdate").click(function () {
        if(!confirm("确定更新吗？"))
            return false;
        $.post("/IphoneUpdate",
            {id:$("#Id").val(),name:$("#name").val(),price:$("#price").val(),color:$("#color").val(),memory:$("#memory").val()},
            function (text) {
            alert(text.msg);
            //关闭弹出窗
            $("#btnClose").click();
            data();
        });

    });
    //多选删除事件
    $("#dels").click(function () {

        if(!confirm("确定删除嘛？"))
            return false;

        var arr = [];
        $("#tdata").find("input[type='checkbox']:checked").each(function () {
            arr.push($(this).val());
        });

        $.get("/IphoneDels?id="+arr,function (text) {
            data();
           alert(text.msg);
        });

    });
    //点击搜索按钮事件时
    $("#search").click(function () {
       data();
    })

    //点击添加按钮时的事件
    $("#add").on("show.bs.modal",function () {});
    $("#btnAdd").click(function () {
        $.post("/IphoneAdd",
            {id:$("#aid").val(),name:$("#aname").val(),price:$("#aprice").val(),color:$("#acolor").val(),memory:$("#amemory").val()},
            function (text) {
                alert(text.msg);
                //关闭弹出窗
                $("#abtnClose").click();
                data();
            });
    });

</script>
</body>
</html>
