package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestArray {
	public static void main(String[] args) {
		List<Map<String, String>>[] lists = new ArrayList[4];
		Map<String, String> map = new HashMap<String, String>();
		map.put("a", "1");
		map.put("b", "2");
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list.add(map);
		lists[0] = list;
		System.out.println(lists[0]);

		System.out.println("***********无敌分割线************");

		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("c", "1");
		map2.put("d", "2");
		List<Map<String, String>> list2 = new ArrayList<Map<String, String>>();
		list2.add(map2);
		lists[1] = list2;
		System.out.println(lists[1]);
		
		Map<String,Object> map3 = new HashMap<String, Object>();
        Map<String,String> agentMap = new HashMap<String, String>();
        String agentAmt = "123";
        agentMap.put("agentAmt",agentAmt);
        agentMap.put("agentId", "35110230000000393");
        Map [] agentInfo = {agentMap};//[{agentAmt=210.00, agentId=35110230000000393}]
        System.out.println("agentInfo:"+agentInfo);
	}
}
