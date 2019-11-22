<%
    def varDomainName=tableNameUtil.lowerCaseFirst(tableDefine.id);
    def pkColumn=tableDefine.getPkColumn();
    def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
%>package ${config.basePackage}.dao${PubUtils.addStrAfterSeparator(config.category,"." )};

import ${config.basePackage}.domain${PubUtils.addStrAfterSeparator(config.category,"." )}.${tableDefine.id};
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * ${tableDefine.cnname} mybatisPlus数据访问接口
 *
 * @author ${config.author}
* @date ${config.nowDate}
*/
@Repository
public interface ${tableDefine.id}Dao extends BaseMapper<${tableDefine.id}> {
}
