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
            <h1>SPU列表</h1>
            <ol class="breadcrumb">
                <li><a href="/"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="javascript:void(0);">SPU管理</a></li>
                <li class="active">SPU列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box">
                <div class="box-header with-border">
                    <input type="checkbox" name="select-all"> 全选
                    <a href="javascript:void(0);" class="btn btn-primary btn-sm" id="delMulti" style="margin-left: 10px;"><i class="fa fa-shopping-cart"></i> 加入销售报价单</a>
                    <a href="javascript:void(0);" class="btn btn-primary btn-sm pull-right"><i class="fa fa-shopping-cart"></i> 100</a>
                </div>
                <div class="box-body">
                    <div class="row">
                        <{foreach from=$data.listSpuInfo item=item}>
                        <div class="col-sm-6 col-md-3 spu-single">
                            <div class="thumbnail">
                                <img src="<{$item.image_url}>" alt="...">
                                <div class="caption">
                                    <p>三级分类: <{$item.category_name}></p>
                                    <p>规格重量: <{$item.weight_value}></p>
                                    <p>K红进货工费: <{$item.sale_cost}></p>
                                    <p>供应商ID: <{$item.supplier_id}></p>
                                    <p>
                                        <span class="pull-left">
                                            <a href="javascript:void(0);" class="btn btn-primary btn-xs"><i class="fa fa-plus"></i></a>
                                        </span>
                                        <span class="pull-right">
                                            <a href="/product/spu/index.php?spu_id=<{$item.spu_id}>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a>
                                            <a href="javascript:delSpu();" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a>
                                        </span>
                                    </p>
                                    <p class="clearfix"></p>
                                </div>
                            </div>
                        </div>
                        <!-- /.spu-single -->
                        <{/foreach}>
                    </div>
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <{include file="section/pagelist.tpl" viewData=$data.pageViewData}>
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

<{include file="section/foot.tpl"}>
</body>
</html>