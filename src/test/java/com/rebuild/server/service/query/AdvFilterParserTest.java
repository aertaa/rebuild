/*
rebuild - Building your business-systems freely.
Copyright (C) 2018 devezhao <zhaofang123@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <https://www.gnu.org/licenses/>.
*/

package com.rebuild.server.service.query;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.rebuild.server.TestSupport;
import com.rebuild.web.IllegalParameterException;

/**
 * 
 * @author devezhao
 * @since 01/04/2019
 */
public class AdvFilterParserTest extends TestSupport {

	@Test
	public void testBaseParse() throws Exception {
		JSONObject filterExp = new JSONObject();
		filterExp.put("entity", "User");
		JSONArray items = new JSONArray();
		filterExp.put("items", items);
		filterExp.put("equation", "(1 AND 2) or (1 OR 2)");
		
		// Filter items
		items.add(JSON.parseObject("{ op:'LK', field:'loginName', value:'admin' }"));
		items.add(JSON.parseObject("{ op:'EQ', field:'deptId.name', value:'总部' }"));  // Joins
		
		String where = new AdvFilterParser(filterExp).toSqlWhere();
		System.out.println(where);
	}
	
	@Test(expected = IllegalParameterException.class)
	public void testBadJoinsParse() throws Exception {
		JSONObject filterExp = new JSONObject();
		filterExp.put("entity", "User");
		JSONArray items = new JSONArray();
		filterExp.put("items", items);
		
		// Filter item
		items.add(JSON.parseObject("{ op:'LK', field:'loginName.name', value:'总部' }"));
		
		String where = new AdvFilterParser(filterExp).toSqlWhere();
		System.out.println(where);
	}
}
