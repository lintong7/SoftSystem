package test;
/**
 * DBUtil组件的各种handler说明：
 * ArrayHandler：把结果集中的第一行数据转成对象数组。
 * ArrayListHandler：把结果集中的每一行数据都转成一个对象数组，再存放到List中。
 * BeanHandler：将结果集中的第一行数据封装到一个对应的JavaBean实例中。
 * BeanListHandler：将结果集中的每一行数据都封装到一个对应的JavaBean实例中，存放到List里。
 * ColumnListHandler：将结果集中某一列的数据存放到List中。
 * KeyedHandler：将结果集中的每一行数据都封装到一个Map里，然后再根据指定的key把每个Map再存放到一个Map里。
 * MapHandler：将结果集中的第一行数据封装到一个Map里，key是列名，value就是对应的值。
 * MapListHandler：将结果集中的每一行数据都封装到一个Map里，然后再存放到List。
 * ScalarHandler：将结果集中某一条记录的其中某一列的数据存成Object。
 */
public class TestDBUtil {

}
