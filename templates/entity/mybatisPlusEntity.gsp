<%
    def tableDefine=tableModel.tableDefine;
    def columns=tableDefine.columns;
    def pkColumn=tableDefine.getPkColumn();
    def pkJavaType=tableNameUtil.getDataType(pkColumn?.columnType);
%>package ${config.basePackage}.domain${PubUtils.addStrAfterSeparator(config.category,"." )};

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import java.io.Serializable;

/**
 * ${tableDefine.cnname} mybatisPlus实体bean
 *
 * @author ${config.author}
* @date ${config.nowDate}
*/
@TableName(name = "${tableDefine.dbTableName}")
@Data
public class ${tableDefine.id} implements Serializable{

  private static final long serialVersionUID = ${PubUtils.getRandomLong()}L;

<% if(pkColumn!=null) { %>
@TableId(value = "${pkColumn.columnName}", type = IdType.AUTO)
    private ${pkJavaType} ${pkColumn.dataName};
<%}%>
<%
    columns.each{
        if(!it.getIsPK()) {
            println """	/**  ${it.cnname}  */""";
            println """ @TableField(value="${it.columnName}", updateStrategy = FieldStrategy.NOT_NULL, whereStrategy = FieldStrategy.NOT_EMPTY)""";
            println """	private ${tableNameUtil.getDataType(it.columnType)} ${it.dataName};"""
        }
    };

%>
}
