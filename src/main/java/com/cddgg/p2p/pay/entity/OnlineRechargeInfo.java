package com.cddgg.p2p.pay.entity;

import com.cddgg.base.util.StringUtil;
import com.cddgg.commons.date.DateUtils;

/**
 * 在线充值
 * @author RanQiBing 2014-01-03
 *
 */
public class OnlineRechargeInfo {
	
	/**商户编号*/
	private String Mer_code ;
	
    /**商户充值订单号  必填  商户系统唯一 */
	private String BillNo = "CZ"+StringUtil.pMerBillNo(); 
	
	/**充值金额  必填  金额单位：元，丌能为负，丌允许为 0，保留 2*/
	private String Amount;  
	
	/**充值日期  必填  格式：YYYYMMDD */
	private String Date = DateUtils.format("yyyyMMdd"); 
	
	/**币种*/
	private String Currency_Type;
	
	private String Gateway_Type;
	
	private String Lang; //语言
	
	private String Merchanturl; //支付结果成功返回的商户URL
	
	private String FailUrl; //支付结果失败返回的商户URL
	
	private String Attach;   //商户数据包
	
	private String  OrderEncodeType; //订单支付接口加密方式
	
	private String RetEncodeType;   //交易返回加密方式
	
	private String Rettype; //返回方式
	
	private String ServerUrl; //
	
	private String SignMD5;  //订单支付接口的MD5摘要
	
	public String getMer_code() {
		return Mer_code;
	}

	public void setMer_code(String mer_code) {
		Mer_code = mer_code;
	}

	public String getBillNo() {
		return BillNo;
	}

	public void setBillNo(String billNo) {
		BillNo = billNo;
	}

	public String getAmount() {
		return Amount;
	}

	public void setAmount(String amount) {
		Amount = amount;
	}

	public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getCurrency_Type() {
		return Currency_Type;
	}

	public void setCurrency_Type(String currency_Type) {
		Currency_Type = currency_Type;
	}

	public String getGateway_Type() {
		return Gateway_Type;
	}

	public void setGateway_Type(String gateway_Type) {
		Gateway_Type = gateway_Type;
	}

	public String getLang() {
		return Lang;
	}

	public void setLang(String lang) {
		Lang = lang;
	}

	public String getMerchanturl() {
		return Merchanturl;
	}

	public void setMerchanturl(String merchanturl) {
		Merchanturl = merchanturl;
	}

	public String getFailUrl() {
		return FailUrl;
	}

	public void setFailUrl(String failUrl) {
		FailUrl = failUrl;
	}

	public String getAttach() {
		return Attach;
	}

	public void setAttach(String attach) {
		Attach = attach;
	}

	public String getOrderEncodeType() {
		return OrderEncodeType;
	}

	public void setOrderEncodeType(String orderEncodeType) {
		OrderEncodeType = orderEncodeType;
	}

	public String getRetEncodeType() {
		return RetEncodeType;
	}

	public void setRetEncodeType(String retEncodeType) {
		RetEncodeType = retEncodeType;
	}

	public String getRettype() {
		return Rettype;
	}

	public void setRettype(String rettype) {
		Rettype = rettype;
	}

	public String getServerUrl() {
		return ServerUrl;
	}

	public void setServerUrl(String serverUrl) {
		ServerUrl = serverUrl;
	}

	public String getSignMD5() {
		return SignMD5;
	}

	public void setSignMD5(String signMD5) {
		SignMD5 = signMD5;
	}

	
	
}
