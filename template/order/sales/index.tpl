<{include file="section/head.tpl"}>
<!-- ADD THE CLASS fixed TO GET A FIXED HEADER AND SIDEBAR LAYOUT -->
<!-- the fixed layout is not compatible with sidebar-mini -->
<body class="hold-transition skin-blue fixed sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <{include file="section/navbar.tpl"}>

    <!-- Left side column. contains the sidebar -->
    <{include file="section/navlist.tpl" mainMenu=$mainMenu}>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>销售订单管理</h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li>订单管理</li>
            </ol>
        </section>
        <section class="content">
            <!-- Default box -->
            <!-- /.box -->
            <div class="box">
                <div class="box-header with-border row">
                    <form class="form-inline" action="?" method="get">
                        <div class="col-md-4" style="">
                            <div class="input-daterange input-group input-group-sm">
                                <span class="input-group-addon" style="border-width:1px 0 1px 1px;">创建日期:</span>
                                <input type="text" name="date_start" readonly class="form-control" value="<{$condition.date_start}>">
                                <span class="input-group-addon">到</span>
                                <input type="text" name="date_end" readonly class="form-control" value="<{date('Y-m-d', strtotime($condition['date_end']))}>">
                            </div>
                        </div>
                        <div class="col-md-2" style="">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">客户名称:</span>
                                    <select class="form-control select-multiple" name="customer_id">
                                            <option value="0">请选择</option>
<{foreach from=$mapCustomer item=item}>
                                            <option value="<{$item.customer_id}>" <{if $item.customer_id eq $condition.customer_id}> selected = "selected" <{/if}>><{$item.customer_name}></option>
<{/foreach}>
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-2" style="">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">销售员:</span>
                                    <select class="form-control select-multiple" name="salesperson_id">
                                            <option value="0">请选择</option>
<{foreach from=$mapSalesperson item=item}>
                                            <option value="<{$item.salesperson_id}>" <{if $item.salesperson_id eq $condition.salesperson_id}> selected = "selected" <{/if}>><{$item.salesperson_name}></option>
<{/foreach}>
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-2" style="">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">订单状态:</span>
                                    <select class="form-control select-multiple" name="sales_order_status">
                                            <option value="0">请选择</option>
<{foreach from=$statusList item=item}>
                                            <option value="<{$item.status_id}>" <{if $item.status_id eq $condition.sales_order_status}> selected = "selected" <{/if}>><{$item.status_name}></option>
<{/foreach}>
                                    </select>
                            </div>
                        </div>
                        <div class="col-md-1" style="">
                                <button class="btn btn-primary" type="submit">搜索</button>
                        </div>

                    </form>
                </div>
                <div class='row'>
                    <div class='col-md-12'>
                        <a href="/order/sales/select_sales_quotation.php" class="pull-right btn btn-primary" type="button">创建新订单</a>
                    </div>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered" id="user-list">
                            <thead>
                                <tr>
                                    <th>订单号</th>
                                    <th>款数</th> 
                                    <th>下单件数</th>
                                    <th>重量</th>
                                    <th>订单金额</th>
                                    <th>客户名称</th>
                                    <th>销售员</th>
                                    <th>订单状态</th>
                                    <th>创建时间</th>
                                    <th style="text-align:center" width="250px">操作</th>
                                </tr>
                            </thead>
                            <tbody>
<{foreach from=$listOrderInfo item=item}>
                                    <tr>
                                        <td><{$item.sales_order_sn}></td>
                                        <td><{$item.count_goods}></td>
                                        <td><{$item.quantity_total}></td>
                                        <td><{$item.reference_weight}></td>
                                        <td><{$item.order_amount}></td>
                                        <td><{$mapCustomer[$item.customer_id]['customer_name']}></td>
                                        <td><{$mapSalesperson[$item.salesperson_id]['salesperson_name']}></td>
                                        <td><{$statusList[$item.sales_order_status]['status_name']}></td>
                                        <td><{$item.create_time}></td>
                                        <td>
                                            <a href='/order/sales/add_goods.php?sales_order_id=<{$item.sales_order_id}>' class="btn btn-primary btn-xs" type='button'>编辑</a>
                                            <a href='/order/sales/produce_advice.php?sales_order_id=<{$item.sales_order_id}>' class="btn btn-primary btn-xs" type='button'>采购管理</a>
                                            <a class="btn btn-primary btn-xs" type='button'>查看详情</a>
                                            <a href='/order/sales/delete_sales_order.php?sales_order_id=<{$item.sales_order_id}>' class="btn btn-primary btn-xs delete-confirm" type='button'>删除</a>
                                        </td>
                                    </tr>
<{/foreach}>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer clearfix">
                    <{include file="section/pagelist.tpl" viewData=$pageViewData}>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.0
        </div>
        <strong>Copyright &copy; 2015-2016 ifmuse.com.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <{include file="section/controlSidebar.tpl"}>
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<{include file="section/foot.tpl"}>
<script>
    // 日期选择
    $('.input-daterange').datepicker({
        format  : 'yyyy-mm-dd',
        language: 'zh-CN'
    });
    tableColumn({
        selector    : '#log-list',
        container   : '#log-list-vis'
    });

    $('.delete-confirm').click(function () {

        return  confirm('确认删除？');
    });
    $('.confirm-yes').click(function () {

        return  confirm('确定后报价单无法修改和删除!是否确定?');
    });

$(function(){

    $('.sales-quotaiton-copy').click(function () {
    
        spuQuotationId = $(this).attr('spu-quotation-id');

        $.post('/sales_quotation/copy_sales_quotation.php', {
            sales_quotation_id  : spuQuotationId,
            '__output_format'   : 'JSON'
        }, function (response) {

            if (0 != response.code) {

                showMessage('错误', response.message);

                return  ;
            }else{
                
                history.go(0);
            }
            
        }, 'json');  
        
    });
});    
</script>
</body>
</html>