package com.imnu.auction;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.ObjectIdGenerators.StringIdGenerator;
import com.imnu.common.Message;
import com.imnu.common.Page;
import com.imnu.model.AuUser;
import com.imnu.model.AuWallet;
import com.imnu.service.AuWalletService;

/**
 * 
 * 描述:钱包Action
 */
@Controller
@RequestMapping("/wallet")
public class AuWalletAction {
	
	@Resource
	private AuWalletService walletService;
	
	/**
	 * 查询总行数
	 * @return
	 */
	@RequestMapping("findCount")
	@ResponseBody
	public Page findCount(AuWallet wallet){
		Page page = new Page();
		Long l = walletService.findCount(wallet);
		page.setTotalRows(l.intValue());
		return page;
	}
	/**
	 * 查询所有
	 * @return
	 */
	@RequestMapping("queryAll")
	@ResponseBody
	public List<AuWallet> queryAll(AuWallet wallet){
		Page page = new Page();
		if(wallet!=null&&wallet.getCurPage()!=null){
			page.setCurPage(wallet.getCurPage());
		}else{
			page.setCurPage(1);
		}
		return walletService.queryAll(wallet,page);
	}
	
	/**
	 * 根据ID删除钱包信息
	 * @param waId
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Message delete(String waId){
		Message msg  = new Message();
		int rows = walletService.deleteByPrimaryKey(waId);
		if(rows > 0 ){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	/**
	 * 根据ID查询钱包信息
	 * @param waId
	 * @return
	 */
	@RequestMapping("findById")
	@ResponseBody
	public AuWallet findById(String waId){
		return walletService.selectByPrimaryKey(waId);
	}
	/**
	 * 增加或修改
	 * @param wallet
	 * @return 
	 */
	@RequestMapping("addOrUpdate")
	@ResponseBody
	public Message addOrUpdate(AuWallet wallet){
		Message msg = new Message();
		int rows = walletService.addOrUpdate(wallet);
		if(rows > 0){
			msg.setState(1);
		}else{
			msg.setState(0);
		}
		return msg;
	}
	
	@RequestMapping("addWallet")
	@ResponseBody
	public int addWallet(String money,HttpSession session) {
		AuUser user=(AuUser) session.getAttribute("user");
		AuWallet auWallet=new AuWallet();
		auWallet.setUserId(user.getUserId());
		auWallet.setWaBalance(new BigDecimal(money));
		AuWallet wallet=walletService.selectWallet(auWallet);
		int rows=0;
		if(wallet==null) {
			System.out.println("======================增加");
			rows=walletService.insert(auWallet);
		}else {
			System.out.println("======================修改");
			auWallet.setWaId(wallet.getWaId());
			auWallet.setWaBalance(new BigDecimal(auWallet.getWaBalance().intValue()+wallet.getWaBalance().intValue()));
			rows=walletService.updateByPrimaryKeySelective(auWallet,money);
		}
		return rows;
	}
	
	@RequestMapping("findWallet")
	@ResponseBody
	public AuWallet findWallet(String userId) {
		AuWallet auWallet = walletService.findWallet(userId);
		if(auWallet==null) {
			auWallet=new AuWallet();
			auWallet.setWaBalance(new BigDecimal(0));
		}
		return auWallet;
	}
	
}
