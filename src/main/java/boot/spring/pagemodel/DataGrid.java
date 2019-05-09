package boot.spring.pagemodel;

import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;


@ApiModel("分页组件")
public class DataGrid<T> {
	@ApiModelProperty("当前页面号")
	private int current;//当前页面号
	@ApiModelProperty("每页行数")
	private int rowCount;//每页行数
	@ApiModelProperty("总行数")
	private int total;//总行数
	@ApiModelProperty("数据内容")
	private List<T> rows;
	public int getCurrent() {
		return current;
	}
	public void setCurrent(int current) {
		this.current = current;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
}
