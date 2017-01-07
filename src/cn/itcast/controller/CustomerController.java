package cn.itcast.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.pojo.Customer;
import cn.itcast.pojo.QueryVo;
import cn.itcast.pojo.User;
import cn.itcast.service.CustomerService;
import cn.itcast.service.UserService;
import cn.itcast.utils.Page;

@Controller
//@RequestMapping("/customer")
public class CustomerController {
	@Autowired
	private UserService userService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("/tologin")
	public String tologin() throws Exception{
		return "login";
	}
	
	@RequestMapping("/login")
	public String login(QueryVo vo,Model model)throws Exception{
		User existUser = userService.findUserByName(vo);
		System.out.println(existUser);
		System.out.println(vo);
		//model.addAttribute(existUser);
		if(existUser!=null){
			model.addAttribute("user",existUser);
			return "redirect:list.action";
		}
		return "login";	
	}
	@RequestMapping("/list")
	public String list(QueryVo vo, Model model) throws Exception{
				/*//计算分页起始条数
				vo.setStart((vo.getPage() - 1) * vo.getSize());
				//查询
				List<Customer> list = customerService.findCustomerByVo(vo);
				Integer count = customerService.findCustomerCountByVo(vo);
				
				//构造分页对象
				Page<Customer> page = new Page<Customer>();
				//当前页
				page.setPage(vo.getPage());
				//每页显示多少条
				page.setSize(vo.getSize());
				//总记录数
				page.setTotal(count);
				//查询的列表数据
				page.setRows(list);
				
				//将分页数据返回给页面
				model.addAttribute("page", page);*/
		/*List<Customer> customerList = customerService.findAll();
		//System.out.println(customerList);
		model.addAttribute("customerList",customerList);*/
		return "index";
	}
	
	@RequestMapping("toCenter")
	public String toCenter(QueryVo vo, Model model) throws Exception{
		
		//乱编码问题
		if(vo.getCust_name() != null){
			vo.setCust_name(new String(vo.getCust_name().getBytes("iso8859-1"),"utf-8"));
		}
		if(vo.getCust_type() != null){
			vo.setCust_type(new String(vo.getCust_type().getBytes("iso8859-1"),"utf-8"));
		}
		vo.setStart((vo.getPage() - 1) * vo.getSize());
		//查询
		List<QueryVo> list = customerService.findCustomerByVo(vo);
		Integer count = customerService.findCustomerCountByVo(vo);
		
		//构造分页对象
		Page<QueryVo> page = new Page<QueryVo>();
		//当前页
		page.setPage(vo.getPage());
		//每页显示多少条
		page.setSize(vo.getSize());
		//总记录数
		page.setTotal(count);
		//查询的列表数据
		page.setRows(list);
		//添加时下拉列表
		List<User> userlist = userService.findAll();
		System.out.println(userlist);
		model.addAttribute("userlist",userlist);
		
		//将分页数据返回给页面
		model.addAttribute("page", page);
		model.addAttribute("query",vo);
		/*List<Customer> customerList = customerService.findAll();
		//System.out.println(customerList);
		model.addAttribute("customerList",customerList);*/
		System.out.println(page);
		return "center";	
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public String delete(int id) throws Exception{
		customerService.deleteCustomerById(id);
		return "OK";
	
	}
	@RequestMapping("add")
	@ResponseBody
	public String save(QueryVo vo,Model model) throws Exception{
		System.out.println(vo.toString());
		customerService.addCustomer(vo);
		return "OK";	
	}
}
