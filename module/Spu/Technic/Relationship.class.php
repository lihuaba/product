<?php
/**
 * 模型 Spu信息-工艺信息 关联
 */
class   Spu_Technic_Relationship {

    use Base_MiniModel;

    /**
     * 数据库配置
     */
    const   DATABASE    = 'product';

    /**
     * 表名
     */
    const   TABLE_NAME  = 'spu_technic_relationship';

    /**
     * 字段
     */
    const   FIELDS      = 'spu_id,technic_id';
    /**
     * 新增
     *
     * @param   array   $data   数据
     */
    static  public  function create (array $data) {

        $options    = array(
            'fields'    => self::FIELDS,
            'filter'    => '',
        );
        $newData    = array_map('addslashes', Model::create($options, $data)->getData());
        self::_getStore()->insert(self::_tableName(), $newData);
    }

    /**
     * 更新
     *
     * @param   array   $data   数据
     */
    static  public  function update (array $data) {

        $options    = array(
            'fields'    => self::FIELDS,
            'filter'    => '',
        );
        $condition  = "`spu_id` = '" . addslashes($data['spu_id']) . "' AND `technic_id` = '" . addslashes($data['technic_id']) . "'";
        $newData    = array_map('addslashes', Model::create($options, $data)->getData());
        self::_getStore()->update(self::_tableName(), $newData, $condition);
    }
    
    /**
     * 根据SPUID 删除工艺
     *
     * @param $spuId    SPUID
     */
    static public function delBySpuId ($spuId) {

        if(empty($spuId)){
            
            return ;
        }
        $sql    = 'DELETE FROM `' . self::_tableName() . '` WHERE `spu_id` = "' . (int) $spuId . '"';

        return  self::_getStore()->execute($sql);
    }
}
