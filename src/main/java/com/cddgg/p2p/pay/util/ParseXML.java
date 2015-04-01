package com.cddgg.p2p.pay.util;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.cddgg.base.util.FreeMarkerUtil;
import com.cddgg.p2p.pay.entity.AutomaticBidInfo;
import com.cddgg.p2p.pay.entity.BidInfo;
import com.cddgg.p2p.pay.entity.RechargeInfo;
import com.cddgg.p2p.pay.entity.RegisterInfo;
import com.cddgg.p2p.pay.entity.RepaymentInfo;
import com.cddgg.p2p.pay.entity.TenderAuditInfo;
import com.cddgg.p2p.pay.entity.WithdrawalInfo;

import freemarker.template.TemplateException;
/**
 * 
 * 生成xml文件
 * @author RanQiBing 2014-01-03
 *
 */
public class ParseXML {
	/**
	 * 用户注册信息生成xml文件
	 * @param register 用户信息
	 * @return 返回一个xml文件
	 * @throws TemplateException 
	 * @throws IOException 
	 */
	public static String registration(RegisterInfo register) throws IOException, TemplateException{
		Map<String,String> map = new HashMap<String, String>();
		map.put("pMerBillNo",register.getpMerBillNo());
		map.put("pIdentType",register.getpIdentType());
		map.put("pIdentNo",register.getpIdentNo());
		map.put("pStatus",register.getpStatus());
		map.put("pIpsAcctNo",register.getpIpsAcctNo());
		map.put("pIpsAcctDate",register.getpIpsAcctDate());
		map.put("pRealName",register.getpRealName());
		map.put("pMobileNo",register.getpMobileNo());
		map.put("pEmail",register.getpEmail());
		map.put("pSmDate",register.getpSmDate());
		map.put("pWebUrl",register.getpWebUrl());
		map.put("pS2SUrl",register.getpS2SUrl());
		map.put("pMemo1",register.getpMemo1());
		map.put("pMemo2",register.getpMemo2());
		map.put("pMemo3",register.getpMemo3());
		String registrationxml = FreeMarkerUtil.execute("config/pay/registration.flt", "UTF-8", map);
		return registrationxml;
	}
	/**
	 * 充值信息转换成xml
	 * @param recharge 充值信息
	 * @return  返回一个xml文件
	 * @throws TemplateException 
	 * @throws IOException 
	 */
    public static String rechargeXml(RechargeInfo recharge) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo", recharge.getpMerBillNo());
    	map.put("pAcctType",recharge.getpAcctType());
    	map.put("pIdentNo",recharge.getpIdentNo());
    	map.put("pRealName", recharge.getpRealName());
    	map.put("pIpsAcctNo", recharge.getpIpsAcctNo());
    	map.put("pTrdDate",recharge.getpTrdDate());
    	map.put("pTrdAmt",recharge.getpTrdAmt());
    	map.put("PChannelType",recharge.getPChannelType());
    	map.put("pTrdBnkCode",recharge.getpTrdBnkCode());
    	map.put("pMerFee",recharge.getpMerFee());
    	map.put("pIpsFeeType",recharge.getpIpsFeeType());
    	map.put("pWebUrl",recharge.getpWebUrl());
    	map.put("pS2SUrl",recharge.getpS2SUrl());
    	map.put("pMemo1",recharge.getpMemo1());
    	map.put("pMemo2",recharge.getpMemo2());
    	map.put("pMemo3",recharge.getpMemo3());
    	String recharges = FreeMarkerUtil.execute("config/pay/recharge.flt", "UTF-8", map);
    	return recharges;
    }
    /**
     * 用户投标信息
     * @param bid 投标信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws IOException 
     */
    public static String bidXml(BidInfo bid) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pBidNo",bid.getpBidNo());
    	map.put("pContractNo",bid.getpContractNo());
    	map.put("pBidType",bid.getpBidType());
    	map.put("pOutType",bid.getpOutType());
    	map.put("pUse",bid.getpUse());
    	map.put("pMerBillNo",bid.getpMerBillNo());
    	map.put("pBidDate",bid.getpBidDate());
    	map.put("pDeadLine",bid.getpDeadLine());
    	map.put("pAgreementNo",bid.getpAgreementNo());
    	map.put("pFAcctType",bid.getpFAcctType());
    	map.put("pFIdentType",bid.getpFIdentType());
    	map.put("pFIdentNo",bid.getpFIdentNo());
    	map.put("pFRealName",bid.getpFRealName());
    	map.put("pFIpsAcctNo",bid.getpFIpsAcctNo());
    	map.put("pTAcctType",bid.getpTAcctType());
    	map.put("pTIdentType",bid.getpTIdentType());
    	map.put("pTIdentNo",bid.getpTIdentNo());
    	map.put("pTRealName",bid.getpTRealName());
    	map.put("pTIpsAcctNo",bid.getpTIpsAcctNo());
    	map.put("pTrdAmt",bid.getpTrdAmt());
    	map.put("pFTrdFee",bid.getpFTrdFee());
    	map.put("pTTrdFee",bid.getpTTrdFee());
    	map.put("pWebUrl",bid.getpWebUrl());
    	map.put("pS2SUrl",bid.getpS2SUrl());
    	map.put("pMemo1",bid.getpMemo1());
    	map.put("pMemo2",bid.getpMemo2());
    	map.put("pMemo3",bid.getpMemo3());
    	String bidxml = FreeMarkerUtil.execute("config/pay/bid.flt", "UTF-8", map);
    	return bidxml;
    }
    /**
     * 将自动投标信息转换成xml文件
     * @param automatic 自动投标信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws IOException 
     */
    public static String automaticBidXml(AutomaticBidInfo automatic) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo",automatic.getpMerBillNo());
    	map.put("pSigningDate",automatic.getpSigningDate());
    	map.put("pAcctType",automatic.getpAcctType());
    	map.put("pIdentNo",automatic.getpIdentNo());
    	map.put("pRealName",automatic.getpRealName());
    	map.put("pIpsAcctNo",automatic.getpIpsAcctNo());
    	map.put("pWebUrl",automatic.getpWebUrl());
    	map.put("pS2SUrl",automatic.getpS2SUrl());
    	map.put("pMemo1",automatic.getpMemo1());
    	map.put("pMemo2",automatic.getpMemo2());
    	map.put("pMemo3",automatic.getpMemo3());
    	String automaticxml = FreeMarkerUtil.execute("config/pay/automaticBid.flt", "UTF-8", map);
    	return automaticxml;
    }
    /**
     * 还款信息转换成xml文件
     * @param repayment 还款信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws IOException 
     */
    public static String repaymentXml(RepaymentInfo repayment) throws IOException, TemplateException{
    	Map<String,Object> map = new HashMap<String, Object>();
    	map.put("pBidNo",repayment.getpBidNo());
    	map.put("pContractNo",repayment.getpContractNo());
    	map.put("pRepaymentDate",repayment.getpRepaymentDate());
    	map.put("pMerBillNo",repayment.getpMerBillNo());
    	map.put("pMerchantBillNo",repayment.getpMerchantBillNo());
    	map.put("pFAcctType",repayment.getpFAcctType());
    	map.put("pFIdentNo",repayment.getpFIdentNo());
    	map.put("pFRealName",repayment.getpFRealName());
    	map.put("pFIpsAcctNo",repayment.getpFIpsAcctNo());
    	map.put("pFTrdFee",repayment.getpFTrdFee());
    	map.put("pFTrdAmt",repayment.getpFTrdAmt());
    	map.put("pWebUrl",repayment.getpWebUrl());
    	map.put("pS2SUrl",repayment.getpS2SUrl());
//    	map.put("pTAcctType",repayment.getpTAcctType());
//    	map.put("pTIpsAcctNo",repayment.getpTIpsAcctNo());
//    	map.put("pTTrdFee",repayment.getpTTrdFee());
//    	map.put("pTTrdAmt",repayment.getpTTrdAmt());
    	map.put("list",repayment.getRepaymentInvestorInfoList());
    	map.put("pMemo1",repayment.getpMemo1());
    	map.put("pMemo2",repayment.getpMemo2());
    	map.put("pMemo3",repayment.getpMemo3());
    	String repaymentxml = FreeMarkerUtil.execute("config/pay/repayment.flt", "UTF-8", map);
    	return repaymentxml;
    }
    /**
     * 投标审核
     * @param tenderAudit 投标审核信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws IOException 
     */
    public static String tenderAuditXml(TenderAuditInfo tenderAudit) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pBidNo",tenderAudit.getpBidNo());
    	map.put("pContractNo",tenderAudit.getpContractNo());
    	map.put("pMerBillNo",tenderAudit.getpMerBillNo());
    	map.put("pBidStatus",tenderAudit.getpBidStatus());
    	map.put("pS2SUrl",tenderAudit.getpS2SUrl());
    	map.put("pMemo1",tenderAudit.getpMemo1());
    	map.put("pMemo2",tenderAudit.getpMemo2());
    	map.put("pMemo3",tenderAudit.getpMemo3());
    	String tenderAuditxml = FreeMarkerUtil.execute("config/pay/tenderAudit.flt", "UTF-8", map);
    	return tenderAuditxml;
    }
    /**
     * 提现
     * @param withdrawal 提现信息
     * @return 返回一个xml文件
     * @throws TemplateException 
     * @throws IOException 
     */
    public static String withdrawalXml(WithdrawalInfo withdrawal) throws IOException, TemplateException{
    	Map<String,String> map = new HashMap<String, String>();
    	map.put("pMerBillNo",withdrawal.getpMerBillNo());
    	map.put("pAcctType",withdrawal.getpAcctType());
    	map.put("pOutType",withdrawal.getpOutType());
    	map.put("pBidNo",withdrawal.getpBidNo());
    	map.put("pContractNo",withdrawal.getpContractNo());
    	map.put("pDwTo",withdrawal.getpDwTo());
    	map.put("pIdentNo",withdrawal.getpIdentNo());
    	map.put("pRealName",withdrawal.getpRealName());
    	map.put("pIpsAcctNo",withdrawal.getpIpsAcctNo());
    	map.put("pDwDate",withdrawal.getpDwDate());
    	map.put("pTrdAmt",withdrawal.getpTrdAmt());
    	map.put("pMerFee",withdrawal.getpMerFee());
    	map.put("pIpsFeeType",withdrawal.getpIpsFeeType());
    	map.put("pWebUrl",withdrawal.getpWebUrl());
    	map.put("pS2SUrl",withdrawal.getpS2SUrl());
    	map.put("pMemo1",withdrawal.getpMemo1());
    	map.put("pMemo2",withdrawal.getpMemo2());
    	map.put("pMemo3",withdrawal.getpMemo3());
    	String tenderAuditxml = FreeMarkerUtil.execute("config/pay/withdrawal.flt", "UTF-8", map);
    	return tenderAuditxml;
    	
    }
}
