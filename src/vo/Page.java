package vo;

import java.util.List;
import java.util.Map;

/**
 * 表示一页的数据
 * 
 * @author Lenten
 *
 * @param <T>
 * 表示实际存储的数据类型
 */
public class Page<T> {
	/**
	 * 页码
	 */
	private Long pageNumber;
	/**
	 * 总页数
	 */
	private Long totalPages;
	/**
	 * 每页显示的记录数
	 */
	private Long pageSize;
	/**
	 * 当前页的内容
	 */
	private List<Map<String, Object>> content;

	public Long getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(Long pageNumber2) {
		this.pageNumber = pageNumber2;
	}

	public Long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Long totalPages) {
		this.totalPages = totalPages;
	}

	public Long getPageSize() {
		return pageSize;
	}

	public void setPageSize(Long pageSize2) {
		this.pageSize = pageSize2;
	}

	public List<Map<String, Object>> getContent() {
		return content;
	}

	public void setContent(List<Map<String, Object>> logs) {
		this.content = logs;
	}
}