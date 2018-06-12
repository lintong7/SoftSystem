package entity;
//软件实体类

import java.sql.Date;

public class Soft {
	// ID
	private Integer id;
	// 软件名称
	private String name;
	// 软件分类
	private Integer cid;
	// 版本
	private String version;
	// 软件类型（1国产软件、2国外软件、3汉化补丁）
	private String type;
	// 软件语言（1简体中文、2英文、3繁体中文、4多国语言）
	private String language;
	// 软件授权（1共享版、2免费版、3试用版、4演示版）
	private String impower;
	// 软件大小
	private Float size;
	// 应用平台（Win All、Android、IOS）
	private String system;
	// 开发商邮箱
	private String email;
	// 软件官网
	private String homepage;
	// 软件图标
	private String icon;
	// 正文介绍
	private String body;
	// 下载地址
	private String downurl;
	// 置顶
	private Integer top;
	// 下载次数
	private Integer down_count;
	// 点赞数
	private Integer like;
	// 软件发布时间
	private Date create_time;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getImpower() {
		return impower;
	}
	public void setImpower(String impower) {
		this.impower = impower;
	}
	public Float getSize() {
		return size;
	}
	public void setSize(Float size) {
		this.size = size;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getDownurl() {
		return downurl;
	}
	public void setDownurl(String downurl) {
		this.downurl = downurl;
	}
	public Integer getTop() {
		return top;
	}
	public void setTop(Integer top) {
		this.top = top;
	}
	public Integer getDown_count() {
		return down_count;
	}
	public void setDown_count(Integer down_count) {
		this.down_count = down_count;
	}
	public Integer getLike() {
		return like;
	}
	public void setLike(Integer like) {
		this.like = like;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
}
