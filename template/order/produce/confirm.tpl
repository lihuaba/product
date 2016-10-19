<{include file="section/head.tpl"}>
<!-- ADD THE CLASS fixed TO GET A FIXED HEADER AND SIDEBAR LAYOUT -->
<!-- the fixed layout is not compatible with sidebar-mini -->
<body class="hold-transition skin-blue fixed sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <{include file="section/navbar.tpl"}>

    <!-- Left side column. contains the sidebar -->
    <{include file="section/navlist.tpl" mainMenu=$data.mainMenu}>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>确认生产订单 <small>供应商: <{$data.supplierInfo.supplier_code}></small></h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="javascript:void(0);">生产订单</a></li>
                <li class="active">确认订单</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box collapsed-box">
                <div class="box-header with-border">
                    <h3 class="box-title">表格操作</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"><i class="fa fa-plus"></i></button>
                    </div>
                </div>
                <div class="box-body" id="cart-list-vis">

                </div>
            </div>
            <!-- /.box -->
            <div class="box">
                <div class="box-header with-border">
                    <div class="pull-left">
                        <input type="checkbox" class="select-all"> 全选
                        <a class="btn btn-primary btn-sm" style="margin-left: 10px;" id="delMultiProduct" href="javascript:void(0);"><i class="fa fa-trash"></i> 批量删除</a>
                    </div>
                    <div class="pull-right count-cart" style="margin-top: 5px;">
                        共计<span><{$data.countSourceCode}></span>个买款ID, <span class="count-goods"><{$data.countSupplierCart.count_goods}></span>款, <span class="count-quantity"><{$data.countSupplierCart.count_quantity}></span>件, 重量<span class="count-weight"><{$data.countSupplierCart.count_weight}></span>克
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-hover table-bordered" id="cart-list">
                            <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>产品编号</th>
                                    <th>买款ID</th>
                                    <th>SPU编号</th>
                                    <th>产品图片</th>
                                    <th>SKU名称</th>
                                    <th>三级分类</th>
                                    <th>款式</th>
                                    <th>子款式</th>
                                    <th>规格重量</th>
                                    <th>规格尺寸</th>
                                    <th>颜色</th>
                                    <th>主料材质</th>
                                    <th>备注</th>
                                    <th>采购工费</th>
                                    <th style="width:100px;">数量</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <{foreach from=$data.listProduceProduct item=item}>
                                <tr class="single-product">
                                    <td class="select"><input type="checkbox" productid="<{$item.product_id}>"></td>
                                    <td><{$item.product_sn}></td>
                                    <td><{$item.source_code}></td>
                                    <td>
                                        <{foreach from=$item.spu_list item=spu}>
                                            <{$spu.spu_sn}>
                                        <{/foreach}>
                                    </td>
                                    <td>
                                        <{if $item.image_url}>
                                        <img src="<{$item.image_url}>" height="60" alt="">
                                        <{/if}>
                                    </td>
                                    <td><{$item.goods_name}></td>
                                    <td><{$item.category_name}></td>
                                    <td><{$item.parent_style_name}></td>
                                    <td><{$item.child_style_name}></td>
                                    <td><{$item.weight_value_data}></td>
                                    <td><{$item.size_value_data}></td>
                                    <td><{$item.color_value_data}></td>
                                    <td><{$item.material_value_data}></td>
                                    <td><input type="text" class="form-control input-sm" name="remark" value="<{$item.remark}>" style="width: 120px;"></td>
                                    <td><{$item.product_cost}></td>
                                    <td>
                                        <div class="input-group input-group-sm">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default reduce-quantity"><i class="fa fa-minus"></i></button>
                                            </span>
                                            <input type="text" class="form-control" name="quantity" value="<{$item.quantity}>" style="width: 40px;text-align: center;">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default increase increase-quantity"><i class="fa fa-plus"></i></button>
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="javascript:void(0);" class="btn btn-danger btn-xs del-prodcut"><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                                <{/foreach}>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <{include file="section/pagelist.tpl" viewData=$data.pageViewData}>
                        </div>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <a class="btn btn-primary pull-right" href="/order/produce/create.php?sales_order_id=<{$smarty.get.sales_order_id}>&supplier_id=<{$smarty.get.supplier_id}>"><i class="fa fa-save"></i> 确认订单</a>
                </div>
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
<style>
    .count-cart span {color: #b30;padding:0 2px;}
</style>
<{include file="section/foot.tpl"}>
<script>

    // ajax更该数量 统计款数 件数 重量
    $(document).delegate('.reduce-quantity, .increase-quantity', 'click', function () {
        var self            = $(this);
        var input           = $(this).parent().siblings('input[name="quantity"]');
        var cartCount       = $('.count-cart');
        var quantity        = parseInt(input.val());
        var salesOrderId    = <{$smarty.get.sales_order_id|default:0}>;
        var supplierId      = <{$smarty.get.supplier_id|default:0}>;
        var productId       = self.parents('.single-product').find('.select input').attr('productid');

        if ($(this).hasClass('reduce-quantity')) {

            quantity--;
        }
        if ($(this).hasClass('increase-quantity')) {

            quantity++;
        }
        if (quantity < 1) {

            alert('数量不能小于1');
            return;
        }
        $.ajax({
            url: '/order/produce/ajax_change_cart_product.php',
            type: 'POST',
            dataType: 'JSON',
            data: {
                sales_order_id: salesOrderId,
                supplier_id: supplierId,
                product_id: productId,
                quantity: quantity
            },
            success: function (data) {
                if (data.statusCode != 0) {
                    alert('操作失败');
                    return false;
                }

                input.val(quantity);
                cartCount.find('.count-goods').text(data.resultData.count_goods);
                cartCount.find('.count-quantity').text(data.resultData.count_quantity);
                cartCount.find('.count-weight').text(data.resultData.count_weight);
            }
        });
    });
    $('input[name="quantity"]').blur(function () {
        var self            = $(this);
        var quantity        = parseInt(self.val());
        var cartCount       = $('.count-cart');
        var salesOrderId    = <{$smarty.get.sales_order_id|default:0}>;
        var supplierId      = <{$smarty.get.supplier_id|default:0}>;
        var productId       = self.parents('.single-product').find('.select input').attr('productid');
        if (quantity < 1) {

            alert('数量不能小于1');
            location.reload();
            return;
        }
        $.ajax({
            url: '/order/produce/ajax_change_cart_product.php',
            type: 'POST',
            dataType: 'JSON',
            data: {
                sales_order_id: salesOrderId,
                supplier_id: supplierId,
                product_id: productId,
                quantity: quantity
            },
            success: function (data) {
                if (data.statusCode != 0) {
                    alert('操作失败');
                    return false;
                }

                self.val(quantity);
                cartCount.find('.count-goods').text(data.resultData.count_goods);
                cartCount.find('.count-quantity').text(data.resultData.count_quantity);
                cartCount.find('.count-weight').text(data.resultData.count_weight);
            }
        });
    });
    // ajax更改备注
    $(document).delegate('input[name="remark"]', 'blur', function () {
        var self            = $(this);
        var remark          = self.val();
        var salesOrderId    = <{$smarty.get.sales_order_id|default:0}>;
        var supplierId      = <{$smarty.get.supplier_id|default:0}>;
        var productId       = self.parents('.single-product').find('.select input').attr('productid');

        $.ajax({
            url: '/order/produce/ajax_change_cart_product_remark.php',
            type: 'POST',
            dataType: 'JSON',
            data: {
                sales_order_id: salesOrderId,
                supplier_id: supplierId,
                product_id: productId,
                remark: remark
            },
            success: function (data) {

            }
        });
    });
    // 全选
    $('input.select-all').click(function () {
        $('#cart-list .select input').prop('checked', $(this).prop('checked') );
    });
    // 批量删除
    $(document).delegate('#delMultiProduct', 'click', function () {

        var salesOrderId    = <{$smarty.get.sales_order_id|default:0}>;
        var supplierId      = <{$smarty.get.supplier_id|default:0}>;
        var checkedInputList    = $('#cart-list').find('.select input:checked');
        if (!salesOrderId || !supplierId) {

            alert('参数错误');
            return false;
        }
        if (checkedInputList.length == 0) {

            alert('请先选择产品');
            return false;
        }
        if (!confirm('确定要批量删除这些产品吗 ?')) {

            return false;
        }
        var productIdString     = '';
        $.each(checkedInputList, function (index, input) {

            productid   = $(input).attr('productid');
            productIdString += productid + ',';
        });
        productIdString = productIdString.substr(0, productIdString.length - 1);
        var redirect    = '/order/produce/del_cart_product.php?sales_order_id=' + salesOrderId + '&supplier_id=' + supplierId + '&multi_product_id=' + productIdString;
        location.href   = redirect;
    });
    // 删除
    $(document).delegate('.del-prodcut', 'click', function () {

        var salesOrderId    = <{$smarty.get.sales_order_id|default:0}>;
        var supplierId      = <{$smarty.get.supplier_id|default:0}>;
        var productId       = $(this).parents('.single-product').find('.select input').attr('productid');
        if (!salesOrderId || !supplierId || !productId) {

            alert('参数错误');
            return false;
        }
        if (confirm('确定要删除该产品吗 ?')) {

            var reditect    = '/order/produce/del_cart_product.php?sales_order_id=' + salesOrderId + '&supplier_id=' + supplierId + '&product_id=' + productId;
            location.href   = reditect;
        }
    });
    tableColumn({
        selector    : '#cart-list',
        container   : '#cart-list-vis'
    });
</script>
</body>
</html>